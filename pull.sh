git update-index --skip-worktree ./config/tsdproxy.yaml
# to undo the skip-worktree flag, use:
# git update-index --no-skip-worktree path/to/config.yml

git fetch origin
# prompt for user confirmation before pulling
read -p "Are you sure you want to resolve above conflicts and pull the latest changes? (y/n): " confirmation
if [[ $confirmation == "y" || $confirmation == "Y" ]]; then
    #git discard changes
    git reset --hard HEAD # discard local changes, gitignore not affected due to skip-worktree
    git pull origin main
else
    echo "Pull operation cancelled."
fi