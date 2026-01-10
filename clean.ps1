$BASE_LOCATION = $PSScriptRoot
$BUILD_FOLDER = Join-Path $BASE_LOCATION "build"
$OUT_FOLDER = Join-Path $BASE_LOCATION "out"

Remove-Item $BUILD_FOLDER -Recurse
Remove-Item $OUT_FOLDER -Recurse