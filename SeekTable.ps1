param(
    [alias("t")][parameter(Mandatory = $true)] $table,
    [alias("d")] $database
)

$text = ""

if ($database)
{
    $text = "use $database`n"
}

$text ="$($text)select t.Name as Table
from sys.tables t
where t.name like '%$table%'
order by t.name"

Write-Host $text
Set-Clipboard $text