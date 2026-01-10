$BASE_LOCATION = $PSScriptRoot
$TEX_LOCATION = Join-Path -Path $env:TEXDIR -ChildPath '2025' 'bin' 'windows'
$XELATEX = "$TEX_LOCATION\xelatex.exe"
$XELATEX_FLAGS = "-output-directory", "build"
$BUILD_FOLDER = Join-Path $BASE_LOCATION "build"
$OUT_FOLDER = Join-Path $BASE_LOCATION "out"


if ((Test-Path $BUILD_FOLDER -pathType container) -eq $false) {
    New-Item $BUILD_FOLDER -type directory | Out-Null
}
if ((Test-Path $OUT_FOLDER -pathType container) -eq $false) {
    New-Item $OUT_FOLDER -type directory | Out-Null
}

$texFiles = Get-ChildItem -Recurse -Filter "*.tex"
foreach ($file in $texFiles) {
    Write-Host -NoNewLine "Building $file... "
    & $XELATEX $XELATEX_FLAGS $file 2>&1 > (Join-Path $BUILD_FOLDER "build.log")

    $language = $file.Directory.Name
    Rename-Item -Path (Join-Path $BUILD_FOLDER "$($file.BaseName).pdf") -NewName "Tiago_Costa_CV_$($language.ToUpper()).pdf"
    Write-Output "Done!"
}

Get-ChildItem -Recurse -Filter "*.pdf" | Move-Item -Destination $OUT_FOLDER -Force
