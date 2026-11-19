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
    equibop
    fastfetch
    codex
    bubblewrap
    dconf2nix
    inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    prismlauncher
    obsidian
    zed-editor
  ];

  perHost = {
    pc = [ pkgs.ddcutil ];
    laptop = [ ];
  };
in
common ++ perHost.${host}
