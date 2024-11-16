import urllib.request
import json

owner = "bejewel-amondz"  # 레포지토리 소유자 이름
repo = "amondz-user-ios"  # 레포지토리 이름

class PullRequestResponse:
    def __init__(self, title, body, base_branch, head_branch, labels, auto_merge):
        self.title = title
        self.body = body
        self.base_branch = base_branch
        self.head_branch = head_branch
        self.labels = [label['name'] for label in labels]
        self.is_auto_merge = auto_merge is not None

# PR 정보 요청 및 PullRequestResponse로 돌려줍니다.
# https://docs.github.com/en/rest/pulls/pulls#get-a-pull-request
def get_pr_list(access_token):
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Accept": "application/vnd.github.v3+json"
    }

    url = f"https://api.github.com/repos/{owner}/{repo}/pulls"
    req = urllib.request.Request(url, headers=headers)

    try:
        with urllib.request.urlopen(req) as response:
            pr_datas = json.loads(response.read().decode())

            list = []
            for pr_data in pr_datas:
                list.append(PullRequestResponse(
                    pr_data['title'], 
                    pr_data['body'], 
                    pr_data['base']['ref'], 
                    pr_data['head']['ref'],
                    pr_data['labels'],
                    pr_data['auto_merge']
                ))
            
            return list
        
    except urllib.error.HTTPError as e:
        print(f"Failed to fetch PR data: {e.code}")
        return None
    
# PR 정보 요청 및 PullRequestResponse로 돌려줍니다.
# https://docs.github.com/en/rest/pulls/pulls#get-a-pull-request
def get_pr_info(pr_number, access_token):
    headers = {
        "Authorization": f"Bearer {access_token}",
        "Accept": "application/vnd.github.v3+json"
    }

    url = f"https://api.github.com/repos/{owner}/{repo}/pulls/{pr_number}"
    req = urllib.request.Request(url, headers=headers)

    try:
        with urllib.request.urlopen(req) as response:
            pr_data = json.loads(response.read().decode())
            
            return PullRequestResponse(
                pr_data['title'], 
                pr_data['body'], 
                pr_data['base']['ref'], 
                pr_data['head']['ref'],
                pr_data['labels'],
                pr_data['auto_merge']
                )
        
    except urllib.error.HTTPError as e:
        print(f"Failed to fetch PR data: {e.code}")
        return None


# PR의 title을 업데이트 합니다.
# https://docs.github.com/en/rest/pulls/pulls?apiVersion=2022-11-28#update-a-pull-request
def update_pr_title(pr_number, github_token, title):

    base_url = "https://api.github.com"
    pr_url = f"{base_url}/repos/{owner}/{repo}/pulls/{pr_number}"

    # PR title 업데이트
    patch_data = {"title": title}
    req = urllib.request.Request(pr_url, data=json.dumps(patch_data).encode("utf-8"), headers={"Authorization": f"token {github_token}"}, method="PATCH")
    with urllib.request.urlopen(req) as response:
        if response.code == 200:
            print(f"PR {pr_number}의 title 정보가 성공적으로 업데이트되었습니다.")
        else:
            print(f"PR {pr_number}의 title 정보 업데이트에 실패했습니다. 상태 코드: {response.code}")

# PR의 body를 업데이트 합니다.
# https://docs.github.com/en/rest/pulls/pulls?apiVersion=2022-11-28#update-a-pull-request
def update_pr_body(pr_number, github_token, body):

    base_url = "https://api.github.com"
    pr_url = f"{base_url}/repos/{owner}/{repo}/pulls/{pr_number}"

    # PR body 업데이트
    patch_data = {"body": body}
    req = urllib.request.Request(pr_url, data=json.dumps(patch_data).encode("utf-8"), headers={"Authorization": f"token {github_token}"}, method="PATCH")
    with urllib.request.urlopen(req) as response:
        if response.code == 200:
            print(f"PR {pr_number}의 body 정보가 성공적으로 업데이트되었습니다.")
        else:
            print(f"PR {pr_number}의 body 정보 업데이트에 실패했습니다. 상태 코드: {response.code}")

# base_branch로 PR한 list의 html_urls를 컨버팅해 string으로 돌려줍니다.
# https://docs.github.com/en/rest/pulls/pulls#get-a-pull-request
def get_related_prs_html_urls(pr_number, search_text, base_branch, github_token):
    base_url = "https://api.github.com"
    prs_url = f"{base_url}/repos/{owner}/{repo}/pulls"
    headers = {"Authorization": f"token {github_token}"}
    
    # PR 목록 가져오기
    req = urllib.request.Request(f"{prs_url}?base={base_branch}&state=all&per_page=100", headers=headers)
    with urllib.request.urlopen(req) as response:
        prs_data = json.loads(response.read().decode("utf-8"))
    
    # search_text를 title에 포함하는 PR의 html_url 목록 만들기
    matching_prs = [pr['html_url'] for pr in prs_data if search_text in pr['title']]
    print(matching_prs)
    filtered_urls = [url for url in matching_prs if f"{pr_number}" not in url]
    print(filtered_urls)
    formatted_urls = ["- " + url for url in filtered_urls]

    return formatted_urls
