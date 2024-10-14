chcp 65001
$OutputEncoding = [System.Text.Encoding]::UTF8
# 現在の日直表、現在の番号に基づいて、jsonを作る.
$memberJson = Get-Content "member.json" | ConvertFrom-Json
$currentNumber = Get-Content "currentNumber.txt"
$maxNumber = 0


foreach ($mem in $memberJson.member) {
    if($currentNumber -eq $mem.id){
        Write-Host $mem.name
        $todayMember = $mem.id + "番 " + $mem.name
        $jsonString = @{ username = "今日の日直"; content = $todayMember } | ConvertTo-Json
        # Write-Host $jsonString


        # Set-Content -Encoding utf8 -Path "json.txt" -Value $jsonString 

        [IO.File]::WriteAllLines("C:\work\DiscordDeveloper\GitHubAction\actions-runner\_work\DiscordBot001\DiscordBot001\json.txt", $jsonString)
    }
    $maxNumber = $mem.id
}


$currentNumber = [int]$currentNumber + 1
if( $currentNumber -gt $maxNumber ){
    $currentNumber = 1
}

Set-Content "currentNumber.txt" $currentNumber