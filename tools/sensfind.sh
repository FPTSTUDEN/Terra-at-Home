# SensFind.sh - Sensitivity Finder Script
# This script finds and lists files seeming to contain sensitive information (.env, .key, .pem, .crt).
# Usage: ./sensfind.sh <directory>
# output of this script can be piped to senscheck.sh for further analysis
find_sensitive_files() {
    local dir="$1"
    echo "Searching for sensitive files in directory: $dir"
    # Example file patterns to search for (can be expanded)
    local patterns=(
        "*.env"
        "*.key"
        "*.pem"
        "*.crt"
        "*.config"
    )
    for pattern in "${patterns[@]}"; do
        find "$dir" -type f -name "$pattern" -print
    done
}
# Main script execution
if [ -z "$1" ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi
find_sensitive_files "$1"