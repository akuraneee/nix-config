{ pkgs, ... }:

{
  home.packages = with pkgs.gnomeExtensions; [
    clipboard-indicator
    appindicator
  ];

  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;

    enabled-extensions = [
      pkgs.gnomeExtensions.appindicator.extensionUuid
      pkgs.gnomeExtensions.clipboard-indicator.extensionUuid
          ];
  };
}
