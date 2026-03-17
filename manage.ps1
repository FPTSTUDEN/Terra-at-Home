function Show-Menu {
    Clear-Host
    Write-Host "--- Project Control Center ---" -ForegroundColor Cyan
    Write-Host "1) Purge (Multipass delete & purge)"
    Write-Host "2) Recreate (Terraform destroy & apply)"
    Write-Host "3) Refresh (Terraform apply)"
    Write-Host "4) Status (List instances & TF state)"
    Write-Host "Q) Quit"
    Write-Host "------------------------------"
}

do {
    Show-Menu
    $userinput = Read-Host "Select an option"

    switch ($userinput) {
        '1' {
            Write-Host "`n[!] Purging Multipass instances..." -ForegroundColor Yellow
            multipass delete prod-sim-01
            multipass purge
            Write-Host "Done." -ForegroundColor Green
            Pause
        }
        '2' {
            Write-Host "`n[!] Recreating environment via Terraform..." -ForegroundColor Yellow
            terraform destroy -auto-approve
            terraform apply -auto-approve
            Write-Host "Recreation complete." -ForegroundColor Green
            Pause
        }
        '3' {
            Write-Host "`n[!] Running Terraform Apply..." -ForegroundColor Cyan
            terraform apply -auto-approve
            Pause
        }
        '4' {
            Write-Host "`n[i] Current Multipass Instances:" -ForegroundColor Blue
            multipass list
            Write-Host "`n[i] Terraform State Summary:" -ForegroundColor Blue
            terraform show -no-color | Select-String "resource" -Context 0,1
            Pause
        }
        'q' { exit }
    }
} while ($true)