{ pkgs, inputs, host }:

let
  common = with pkgs; [
    neovim
    wget
    gearlever
    ghostty
    mullvad-vpn
    curl
    telegram-desktop
    fastfetch
    codex
    bubblewrap
    dconf2nix
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    prismlauncher
    obsidian
    zed-editor
    zip
    unzip
    adw-gtk3
    fzf
    vesktop
    ffmpeg
    uv
    python3
    flatpak
    rustc
    cargo
    gcc
  ];

  perHost = {
    pc = with pkgs; [ 
      ddcutil 
      feishin
    ];

    laptop = with pkgs; [ 
    ];
  };
in
common ++ perHost.${host}
