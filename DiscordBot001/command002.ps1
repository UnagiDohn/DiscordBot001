# $name = [System.Text.Encoding]::UTF8.GetString( [System.Text.Encoding]::GetEncoding("ISO-8859-1").GetBytes("???") )
chcp 65001
$OutputEncoding = [System.Text.Encoding]::UTF8
# Invoke-WebRequest -Headers @{"Content-Type"="application/json"} -Method Post -Body "{`"username`": `"なまえ`", `"content`": `"message`"}" $Args[0]
# $body = '{"username": "namae", "content": "message" }'

# $name = [System.Text.Encoding]::UTF8.GetString( [System.Text.Encoding]::GetEncoding("UTF-8").GetBytes("てすと") )
# $name = [System.Text.Encoding]::UTF8.GetString( [System.Text.Encoding]::GetEncoding("ISO-8859-1").GetBytes($name) )

# Invoke-WebRequest -Headers @{"Content-Type"="application/json"} -Method Post -Body $body $Args[0]


# $body = ' {\"username\": \"test\", \"content\": \"hello\"} '
# $body = @{ username = "test"; content = "hello" } | ConvertTo-Json
# $command = 'curl -X POST "' + $Args[0] + '" -H "Content-Type: application/json" -d ' + $body

.\command003.ps1

$memberText = Get-Content -Encoding utf8 "json.txt" | ConvertFrom-Json
Write-Output $memberText
$memberJson = Get-Content -Encoding utf8 "json.txt"
Write-Output $memberJson

$command = 'curl -X POST -H "Content-Type: application/json" --data-binary @json.txt ' + $Args[0]

# $command = 'curl -X POST -F content="あああい" '+$Args[0] これは送れた.
Write-Output "今回はこのコマンドを送った"
Write-Output $command
Write-Output "コマンドを実際に送信した"
cmd.exe /c $command


# $body = 'curl -X POST -F content=' + $name + " " + $Args[0]
# Write-Output $body
# cmd.exe /c $body


# cmd.exe /c  'curl -H "Content-Type: application/json" -X POST -d' + '{"username": "test", "content": "hello"} $Args[0]' 

# curl -H "Content-Type: application/json" -X POST -d '{"content": "message"}' "https://discord.com/api/webhooks/1294410759958298665/NsinS1PTNjGS8J8GFl_m37V36xB-1GzZNSfnoaTEF_LnwnUIqWqoMcWA_Gv3L15iFcxL"