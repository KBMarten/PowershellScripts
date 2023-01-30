foreach($file in Get-ChildItem -Path '~\Desktop\ConversionScripts\dbo.*.sql') {
    ((Get-Content -path $file.FullName -Raw) -replace 'ConversionScripts\b','ConversionScriptsTest') | Set-Content -Path "~\Desktop\ConversionScriptsTest\$($file.Name)"
}

foreach($file in Get-ChildItem -Path '~\Desktop\ConversionScriptsTest\dbo.*.sql') {
    ((Get-Content -path $file.FullName -Raw) -replace 'CargasEnergy\b','CargasEnergyTest') | Set-Content -Path "~\Desktop\ConversionScriptsTest\$($file.Name)"
}