param(
    [alias("v")][parameter(Mandatory = $true)] $view,
    [alias("d")] $database
)

$text = ""

if ($database)
{
    $text = "use $database`n"
}

$text ="$($text)select v.name as View
from sys.views v
where v.name like '%$view%'
order by v.name"

Write-Host $text
Set-Clipboard $text