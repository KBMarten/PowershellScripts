foreach($file in Get-ChildItem -Path .\*.sql)
{
	sqlcmd -d ConversionScripts -i $file.FullName
}