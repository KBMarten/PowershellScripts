foreach($file in Get-ChildItem -Path .\*.sql)
{
	sqlcmd -d ConversionScripts -i $file.FullName
}

Write-Host -NoNewLine 'Press any key to continue...';
$Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown');