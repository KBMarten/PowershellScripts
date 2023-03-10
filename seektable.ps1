param(
    [parameter(Mandatory = $true)] $table,
    [alias("d")] $database
)

$text = ""

if ($database)
{
    $text = "use $database`n"
}

$text ="$($text)select distinct name
from sys.tables
where name like '%$table%'
order by name"

Write-Host $text
Set-Clipboard $text