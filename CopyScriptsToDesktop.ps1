param ($DataConversionFolder = $null)


$DataConversion = '~\Repos\DataConversion\'
$Destination = '~\Desktop\ConversionScripts\'


$Directory = ''

if ($null -eq $DataConversionFolder) 
{
    $Directory = $pwd
}
else
{
    $Directory = $DataConversion+$DataConversionFolder
}



if (!(Test-Path ($Destination)))
{
    New-Item -Path $Destination -ItemType 'directory' | Out-Null
}


Copy-Item -Path "$Directory\*.sql" -Destination $Destination