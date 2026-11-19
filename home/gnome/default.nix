{ pkgs, ... }:

{
  imports = [
    ./extensions.nix
    ./settings.nix
  ];

  dconf.enable = true;

  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 24;
    x11.enable = true;
  };

  home.packages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
  ];
}
