foreach($file in Get-ChildItem -Path '~\Desktop\ConversionScriptsCreate\dbo.*.sql') {
    ((Get-Content -path $file.FullName) -Replace 'CREATE PROC','ALTER PROC') | Where-Object {$_ -notmatch "\/\*\*\*\*\*\* Object:.*Script Date:.*\*\*\*\*\*\*\/"} | Set-Content -Path "~\Desktop\ConversionScripts\$($file.Name)"
}