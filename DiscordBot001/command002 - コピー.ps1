# $name = [System.Text.Encoding]::UTF8.GetString( [System.Text.Encoding]::GetEncoding("ISO-8859-1").GetBytes("???") )
chcp 65001
Write-Output "なまえ"
$name = [System.Text.Encoding]::UTF8.GetString( [System.Text.Encoding]::GetEncoding("UTF-8").GetBytes("てすと") )

echo $name
# Invoke-WebRequest -Headers @{"Content-Type"="application/json"} -Method Post -Body "{`"username`": `"$name`", `"content`": `"message`"}" $Args[0]
