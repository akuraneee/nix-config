{ lib, ... }:

let
  schemes = map (scheme: "x-scheme-handler/${scheme}") [ "tg" "tonsite" "ton" ];
  associations = lib.genAttrs schemes (_: [ "org.telegram.desktop.desktop" ]);
in
{
  xdg.mimeApps.defaultApplications = associations;
  xdg.mimeApps.associations.added = associations;
}
