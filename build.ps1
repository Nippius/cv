##
# Misc
##
$FILENAME_PREFIX = "Tiago_Costa_"
$BASE_LOCATION = Get-Location
$OUTPUT_LOCATION = "$BASE_LOCATION\output"

##
# Xelatex configuration
##
$TEX_LOCATION = Join-Path -Path $env:TEXDIR -ChildPath '2025' 'bin' 'windows'
$XELATEX = "$TEX_LOCATION\xelatex.exe"
$XELATEX_FLAGS = "-output-directory","build"

##
# Files and folders to build
##
$FOLDERS = "en", "pt"
$FILES = "cv"

function moveFiles()
{
    If((Test-Path "$OUTPUT_LOCATION" -pathType container) -eq $false)
    {
        New-Item $OUTPUT_LOCATION -type directory | Out-Null
    }

    ForEach($folder in $FOLDERS)
    {
        ForEach($file in $FILES)
        {
            $origin = $folder+"\build\"+$file+".pdf"
            $destination = $OUTPUT_LOCATION+"\"+$FILENAME_PREFIX+$file.ToUpperInvariant()+"_"+$folder.ToUpperInvariant()+".pdf"
            Move-Item $origin $destination -Force
        }
    }
}

function buildFiles()
{
    ForEach($folder in $FOLDERS)
    {
        # Needed for xelatex to output to the correct folder.
		Set-Location $BASE_LOCATION\$folder

		If((Test-Path "build" -pathType container) -eq $false)
        {
            New-Item "build" -type directory | Out-Null
        }

		ForEach($file in $files){
			Write-Host -NoNewLine "Building $folder\$file... "
			& $XELATEX $XELATEX_FLAGS $file 2>&1 > build\build.log;
			Write-Output "Done!"
		}

        Set-Location $BASE_LOCATION
    }
}

try
{
    buildFiles;
    moveFiles;
}
finally{
	Set-Location $BASE_LOCATION
}