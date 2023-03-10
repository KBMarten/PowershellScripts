param(
    [parameter(Mandatory = $true)] $view,
    [alias("d")] $database
)

$text = ""

if ($database)
{
    $text = "use $database`n"
}

$text ="$($text)select v.name AS ViewName, c.name AS ColName
from sys.views v
join sys.columns c on c.object_id = v.object_id
where c.name like '%$view%'
order by v.name, c.name"

Write-Host $text
Set-Clipboard $text