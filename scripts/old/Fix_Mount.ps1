# Write-Host "--- Stage 1: Guest Cleanup ---" -ForegroundColor Yellow
# # Run the first half of the playbook to stop services
# ansible-playbook -i inventory.ini fix_bridge.yml --start-at-task="1. Stop locking services" --end-at-task="3. Lazy unmount (Internal)"

Write-Host "--- Stage 2: Host Remount ---" -ForegroundColor Yellow
multipass umount prod-sim-01:/srv/storage
multipass mount ./FileServerData prod-sim-01:/srv/storage

# Write-Host "--- Stage 3: Guest Restore ---" -ForegroundColor Yellow
# # Run the second half to bring everything back up
# ansible-playbook -i inventory.ini fix_bridge.yml --start-at-task="5. Restart Services"