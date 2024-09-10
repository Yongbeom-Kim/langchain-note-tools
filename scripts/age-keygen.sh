#!/bin/bash
AGE_PUBLIC_KEY_FILE=${XDG_CONFIG_HOME:-$HOME/.config}/sops/age/keys.txt

if [ -f "$AGE_PUBLIC_KEY_FILE" ]; then
  echo "Public key file already exists: $AGE_PUBLIC_KEY_FILE"
  exit 1
fi

mkdir -p "$(dirname "$AGE_PUBLIC_KEY_FILE")"
age-keygen -o "$AGE_PUBLIC_KEY_FILE"