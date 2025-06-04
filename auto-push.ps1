# auto-push.ps1
Set-Location "C:\Users\ok\Desktop\github"  # 👉 여기를 본인 프로젝트 경로로 수정하세요

while ($true) {
    # 변경 사항이 있는지 확인
    $status = git status --porcelain

    if ($status) {
        Write-Output "`n📝 변경 감지됨 → 자동 커밋 & 푸시 진행 중..."

        git add .

        $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
        git commit -m "자동 커밋: $timestamp"

        git push
        Write-Output "✅ 푸시 완료: $timestamp"
    }

    Start-Sleep -Seconds 10  # ⏱ 10초마다 반복 확인
}
