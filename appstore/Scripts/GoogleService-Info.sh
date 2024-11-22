case "${CONFIGURATION}" in
  "DEV" )
cp -r "$SRCROOT/Resources/GoogleService-Info-Dev.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
  "QA" )
cp -r "$SRCROOT/Resources/GoogleService-Info-QA.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
  "RELEASE" )
cp -r "$SRCROOT/Resources/GoogleService-Info-Prod.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
*)
;;
esac
