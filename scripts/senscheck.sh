# SensCheck.sh - Sensitivity Check Script
# This script checks for sensitive information in files.
# It scans for common sensitive data patterns such as passwords, API keys, and tokens.
# Usage: ./senscheck.sh <file1> <file2> ...

# Function to check for sensitive information
check_sensitivity() {
    local file="$1"
    echo "Checking file: $file"
    # Example patterns to check for (can be expanded)
    local patterns=(
        "password"
        "api_key"
        "secret"
        "token"
        "private_key"
    )
    for pattern in "${patterns[@]}"; do
        if grep -qi "${pattern}" "$file"; then
            echo "Sensitive information found in $file: $pattern"
        fi
    done
}
check_perms() {
    local file="$1"
    echo "Checking permissions for file: $file"
    local perms
    perms=$(stat -c "%a" "$file")
    if [[ "$perms" -gt 640 ]]; then
        echo "Warning: File $file has permissions $perms which may be too permissive."
    fi
}
# Main script execution
for file in "$@"; do
    check_sensitivity "$file"
    check_perms "$file"
done