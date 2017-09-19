# Grab initial location so that we can return here at the end.
$BASE_LOCATION = Get-Location

$FOLDERS = "en", "pt"

function cleanup()
{
	# Clean build output
	ForEach($folder in $FOLDERS)
	{
        $folderToRemove = "$BASE_LOCATION\$folder\build";
        If((Test-Path $folderToRemove -pathType container))
        {
		    Remove-Item $folderToRemove -Recurse
            Write-Output "Cleaned: $folderToRemove"
        }
	}
	
	# Clean output
    $outputFolder = "$BASE_LOCATION\output"
    If((Test-Path $outputFolder -pathType container))
    {
        Remove-Item $outputFolder -Recurse
        Write-Output "Cleaned: $outputFolder"
    }
}

try
{
    cleanup;
}
finally{
	Set-Location $BASE_LOCATION
}


