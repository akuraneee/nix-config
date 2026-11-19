{ pkgs, ... }:

{
  imports = [
    ./extensions.nix
    ./settings.nix
  ];

  dconf.enable = true;

  home.packages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
  ];
}
