SECRET_FILES=(
    ./tf/backend/terraform.tfstate
)

COMMAND=$!

encrypt() {
    for file in "${SECRET_FILES[@]}"; do
        if [ -f "$file" ]; then
            sops -e "$file" > $file.enc
        fi
    done
}

decrypt() {
    for file in "${SECRET_FILES[@]}"; do
        if [ -f "$file.enc" ]; then
            sops -d "$file.enc" > $file
        fi
    done
}

case $1 in
    encrypt)
        encrypt
        ;;
    decrypt)
        decrypt
        ;;
    *)
        echo "Usage: $0 <encrypt|decrypt>"
        exit 1
        ;;
esac