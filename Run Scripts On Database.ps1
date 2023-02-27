foreach($file in Get-ChildItem -Path .\*.sql -Recurse -Depth 3)
{
    #Write-Host "Executing $($file.Name)..." -NoNewline
	sqlcmd -d ConversionScripts -i $file.FullName
}

Write-Host -NoNewLine 'Press any key to continue...';
$Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');