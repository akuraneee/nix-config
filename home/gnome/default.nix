{ pkgs, ... }:

{
  imports = [
    ./extensions.nix
    ./settings.nix
  ];

  dconf.enable = true;
  xdg.mimeApps.defaultApplications."inode/directory" = [ "org.gnome.Nautilus.desktop" ];

  # Mutter's GTK4 helper draws the server-side titlebars for XWayland windows.
  xdg.configFile."gtk-4.0/gtk.css".text = ''
    .ssd-frame headerbar,
    headerbar.ssd-frame {
      background-image: none;
      box-shadow: none;
      min-height: 42px;
    }

    .ssd-frame headerbar windowcontrols button,
    headerbar.ssd-frame windowcontrols button {
      border-radius: 999px;
      background-color: alpha(currentColor, 0.08);
    }

    .ssd-frame headerbar windowcontrols button:hover,
    headerbar.ssd-frame windowcontrols button:hover {
      background-color: alpha(currentColor, 0.16);
    }
  '';

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
