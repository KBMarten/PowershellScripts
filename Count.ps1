param(
    [alias("t")][Parameter(Position=0)][String]$table,
    [alias("c")][Parameter(ValueFromRemainingArguments=$true,Position=1)][String[]]$columns,
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
    $text = $text + "`ngroup by $($columns -join ", ")" + "`nhaving count(*) > 1" + "`norder by count(*) desc"
}


Write-Host $text
Set-Clipboard $text