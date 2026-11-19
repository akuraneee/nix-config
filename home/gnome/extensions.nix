{ pkgs, ... }:

{
  home.packages = with pkgs.gnomeExtensions; [
    clipboard-indicator
    appindicator
    ddc-brightness-controller
  ];


  dconf.settings."org/gnome/shell" = {
    disable-user-extensions = false;

    enabled-extensions = [
      pkgs.gnomeExtensions.appindicator.extensionUuid
      pkgs.gnomeExtensions.clipboard-indicator.extensionUuid
      pkgs.gnomeExtensions.ddc-brightness-controller.extensionUuid
          ];
  };
}
