param(
    [Parameter(Position=0)][alias("t")][String]$table,
    [Parameter(ValueFromRemainingArguments=$true,Position=1)][alias("c")][String[]]$columns,
    [alias("d")][String]$database
)

$text = ""

if ($database)
{
    $text = "use $database `n"
}

$text = $text + "select"

if ($columns)
{
    $text = $text + " $($columns -join ", "),"
}


$text = "$text count(*) `nfrom $table"

if ($columns)
{
    $text = $text + "`ngroup by $($columns -join ", ")"
}

$text = $text + "`nhaving count(*) > 1"

Write-Host $text
Set-Clipboard $text