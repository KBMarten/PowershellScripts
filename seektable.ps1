param($search)

$text = "select distinct name
from sys.tables
where name like '%$search%'
order by name"

Write-Host $text
Set-Clipboard $text