{ pkgs, ... }:

{
  imports = [
    ./home/gnome
  ];

  home.username = "akurane";
  home.homeDirectory = "/home/akurane";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    gnome-tweaks
    gnome-extension-manager
  ];
}
