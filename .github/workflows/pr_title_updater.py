import sys
import random
from enum import Enum
import github_api
import re

pr_number = ""
github_token = ""
emoji_list = ["🔥", "🚨", "☄️", "❤️‍🔥", "🏎️", "🥊", "🌹", "🚒"]
auto_text = " (Auto"
ticket_pattern = r'issue\w*-\d+' # 정규식 패턴

class Layer(Enum):
    feature = 'feature'
    master = 'main'

# title의 맨앞을 채우는 문구입니다.
def convert_prefix(branch):
    baseList = branch.split("/")
    filtered_array = list(filter(lambda x: x != "base" and x != "feature", baseList))

    result = "/".join(filtered_array)
    return result

# 다른 layer의 브랜치를 기준으로 타이틀을 생성
def generate_different_layer_title(base_branch, head_branch, title):
    prefix = convert_prefix(base_branch)
    child_prefix = convert_prefix(head_branch)

    title = prefix + " <- " + child_prefix + " " + title
    return title

# master <- feature 로 계속 끼얹을때 사용할 타이틀일 생성
def generate_trunk_based_title(head_branch, title):
    ticket_match = re.search(ticket_pattern, head_branch)

    if ticket_match:
        ticket_name = ticket_match.group(0)
        prefix = "["+ ticket_name + "]"
        if title.startswith(prefix):
            print("이미 문구가 추가되어, 타이틀 앞에 문구를 추가하지 않습니다.")
            return title
    
        return prefix + " " + title
    else:
        prefix = "["+ "NO-JIRA" + "]"

        if title.startswith(prefix):
            print("이미 문구가 추가되어, 타이틀 앞에 문구를 추가하지 않습니다.")
            return title
        
        return prefix + " " + title

# title을 layer에 맞게 수정
def convert_layer_title(base_branch, head_branch, title):
    prefix = convert_prefix(base_branch)

    if title.startswith(prefix):
        print("이미 문구가 추가되어, 타이틀 앞에 문구를 추가하지 않습니다.")
        return title

    baseList = base_branch.split("/")
    headList = head_branch.split("/")

    baseLayer = baseList[0]
    headLayer = headList[0]

    if headLayer == Layer.feature.value:
        if baseLayer == Layer.feature.value:
            baseTicket = baseList[1]
            headTicket = headList[1]

            if baseTicket == headTicket:
                title = prefix + " " + title
            else:
                title = generate_different_layer_title(base_branch, head_branch, title)

        elif baseLayer == Layer.deploy.value:
            title = generate_different_layer_title(base_branch, head_branch, title)

        elif baseLayer == Layer.release.value:
            title = generate_different_layer_title(base_branch, head_branch, title)

        #trunk based에서 사용할 규칙입니다.
        elif baseLayer == Layer.master.value:
            title = generate_trunk_based_title(head_branch, title)

    return title

def convert_auto_merge(title, is_auto_merge):

    # "(Auto"가 있는지 확인
    index = title.find(auto_text)

    if is_auto_merge:
        # 오토머지가 켜져있고, 타이틀에 오토머지 표시가 없을때
        if index < 0:
            random_emoji = random.choice(emoji_list)
            title = title + auto_text + random_emoji + ")"

    else:
        # 오토머지가 꺼져있고, 타이틀에 오토머지 표시가 있을때
        if index >= 0:
            cleaned_title = title[:index]
            title = cleaned_title

    return title

# 명령행 인수에서 값을 받음
if len(sys.argv) > 1:
    # 첫 번째 요소(sys.argv[0])는 스크립트의 경로입니다. 따라서 실제 값은 두 번째 요소부터 시작합니다.
    pr_number = sys.argv[1]
    github_token = sys.argv[2]
    print("값이 성공적으로 들어왔습니다.")
else:
    print("비정상적인 주입이 되어 로직이 동작하지 않습니다.")
    sys.exit(0)

# 해당 PR의 정보 가져오기
response = github_api.get_pr_info(pr_number, github_token)
title = response.title
base_branch = response.base_branch
head_branch = response.head_branch
is_auto_merge = response.is_auto_merge

# base_branch에 "base"가 있지 않거나, "master"가 아니라면 종료 합니다.
if base_branch.endswith("base") or base_branch == "master":
    print("/base, master 브랜치로의 동작이 이어집니다.")
else:
    print("/base, master 브랜치로의 동작이 아니기에 동작하지 않습니다.")
    sys.exit(0)

# layer에 맞는 타이틀 수정
convert_title = convert_layer_title(base_branch, head_branch, title)

# 오토머지 여부에 맞게 타이틀 수정
convert_title = convert_auto_merge(convert_title, is_auto_merge)

if title != convert_title:
    # PR title 업데이트하기
    github_api.update_pr_title(pr_number, github_token, convert_title)
else:
    print("타이틀 변경사항이 있지 않아 업데이트되지 않습니다.")
