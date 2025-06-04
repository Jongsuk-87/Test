# auto-push.ps1
$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::UTF8
Set-Location "C:\Users\ok\Desktop\github"  # ← 본인 폴더 경로로 수정

while ($true) {
    $status = git status --porcelain
    if ($status) {
        Write-Output "`n📝 변경 감지됨 → 자동 커밋 & 푸시 진행..."

        git add .

        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        git commit -m "자동 커밋: $timestamp"

        git push
        Write-Output "✅ 푸시 완료: $timestamp"
    }
    Start-Sleep -Seconds 10
}
