if (-Not (Test-Path '.\ConversionScriptsTest')) {
    $null = md ConversionScriptsTest
}

foreach($file in Get-ChildItem -Path '.\dbo.*.sql' -Recurse -Depth 3) {
    write-host "Writing $($file.Name) to ConversionScriptsTest folder... " -NoNewline
    ((Get-Content -path $file.FullName -Raw) -replace 'ConversionScripts\b','ConversionScriptsTest') | Set-Content -Path ".\ConversionScriptsTest\$($file.Name)"
    write-host "Done!"
}

foreach($file in Get-ChildItem -Path '.\ConversionScriptsTest\dbo.*.sql' -Recurse -Depth 3) {
    ((Get-Content -path $file.FullName -Raw) -replace 'CargasEnergy\b','CargasEnergyTest') | Set-Content -Path ".\ConversionScriptsTest\$($file.Name)"
}

write-host "Press any key to continue..."
[void][System.Console]::ReadKey($true)