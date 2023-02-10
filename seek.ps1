param(
    $search,
    [alias("t")] $table,
    [alias("d")] $database
)

$text = ""

if ($database)
{
    $text = "use $database`n"
}

$text ="$($text)select t.name AS TableName, c.name AS ColName
from sys.tables t
join sys.columns c on c.object_id = t.object_id
where c.name like '%$search%'"

if ($table) 
{
    $text = "$text`nand t.name like '%$table%'"
}

$text = "$text`norder by t.name, c.name"

Write-Host $text
Set-Clipboard $text