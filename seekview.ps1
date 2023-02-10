param(
    [parameter(Mandatory = $true)]$search
)

$text = "select v.name AS ViewName, c.name AS ColName
from sys.views v
join sys.columns c on c.object_id = v.object_id
where c.name like '%$search%'
order by v.name, c.name"

Write-Host $text
Set-Clipboard $text