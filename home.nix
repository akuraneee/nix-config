{
  imports = [
    ./home/fish
    ./home/ghostty
    ./home/gnome
    ./home/helium
    ./home/mullvad
    ./home/starship
    ./home/telegram
    ./home/zed
    ./home/git
  ];

  home.username = "akurane";
  home.homeDirectory = "/home/akurane";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
  xdg.mimeApps.enable = true;
}
