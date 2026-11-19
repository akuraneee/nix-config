#!/usr/bin/env bash
set -euo pipefail

for dependency in dconf dconf2nix nix-instantiate; do
  if ! command -v "$dependency" >/dev/null; then
    printf 'Command not found: %s\n' "$dependency" >&2
    exit 1
  fi
done

dump=$(dconf dump /org/gnome/)
if [[ -z "$dump" ]]; then
  printf 'No dconf settings found under /org/gnome/. Run as your GNOME user.\n' >&2
  exit 1
fi

# File chooser history contains local paths and can produce duplicate Nix keys.
# dconf2nix 0.1.1 cannot parse the dictionaries in the Shell app grid layout.
nix_module=$(printf '%s\n' "$dump" |
  awk '
    /^\[/ {
      file_chooser = ($0 ~ /^\[portal\/filechooser([\/]|\])/)
      shell = ($0 == "[shell]")
    }
    file_chooser || (shell && /^app-picker-layout=/) { next }
    { print }
  ' |
  dconf2nix --root org/gnome/)

printf '%s\n' "$nix_module" | nix-instantiate --parse - >/dev/null
settings_file="$(dirname -- "${BASH_SOURCE[0]}")/home/gnome/settings.nix"
printf '%s\n' "$nix_module" > "$settings_file"
printf 'Saved %s\n' "$settings_file"
