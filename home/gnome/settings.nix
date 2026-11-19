# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/Console" = {
      last-window-maximised = false;
      last-window-size = mkTuple [ 732 528 ];
    };

    "org/gnome/control-center" = {
      last-panel = "keyboard";
      window-state = mkTuple [ 980 640 false ];
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = [ "System" "YaST" "Pardus" "de1a2eb7-795f-4f76-a061-50fd16e4d439" ];
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = [ "X-Pardus-Apps" ];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/System" = {
      apps = [ "org.gnome.baobab.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Logs.desktop" "org.gnome.SystemMonitor.desktop" ];
      name = "X-GNOME-Shell-System.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/de1a2eb7-795f-4f76-a061-50fd16e4d439" = {
      apps = [ "vim.desktop" "nvim.desktop" "it.mijorus.gearlever.desktop" "cups.desktop" "org.gnome.Yelp.desktop" "org.gnome.Showtime.desktop" "firefox.desktop" "org.gnome.Snapshot.desktop" "org.gnome.Characters.desktop" "org.gnome.Console.desktop" "org.gnome.Tour.desktop" "org.gnome.Contacts.desktop" "org.gnome.Calculator.desktop" "org.gnome.Weather.desktop" "org.gnome.clocks.desktop" "org.gnome.Maps.desktop" "org.gnome.Extensions.desktop" "org.gnome.SimpleScan.desktop" "org.gnome.Settings.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.font-viewer.desktop" "org.gnome.Loupe.desktop" "org.gnome.Decibels.desktop" "org.gnome.Connections.desktop" "org.gnome.Papers.desktop" "org.gnome.Epiphany.desktop" "org.gnome.Calendar.desktop" "org.gnome.Music.desktop" "org.gnome.TextEditor.desktop" "nvidia-settings.desktop" ];
      name = "trash";
      translate = false;
    };

    "org/gnome/desktop/input-sources" = {
      mru-sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ru" ]) ];
      sources = [ (mkTuple [ "xkb" "us" ]) (mkTuple [ "xkb" "ru" ]) ];
      xkb-options = [ "grp:caps_toggle" ];
    };

    "org/gnome/desktop/interface" = {
      accent-color = "slate";
      color-scheme = "prefer-dark";
      gtk-theme = "adw-gtk3-dark";
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-console" "gnome-power-panel" "mullvad-vpn" "org-telegram-desktop" "com-mitchellh-ghostty" "gnome-about-panel" "helium" "steam" ];
    };

    "org/gnome/desktop/notifications/application/com-mitchellh-ghostty" = {
      application-id = "com.mitchellh.ghostty.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-about-panel" = {
      application-id = "gnome-about-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/helium" = {
      application-id = "helium.desktop";
    };

    "org/gnome/desktop/notifications/application/mullvad-vpn" = {
      application-id = "mullvad-vpn.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-telegram-desktop" = {
      application-id = "org.telegram.desktop.desktop";
    };

    "org/gnome/desktop/notifications/application/steam" = {
      application-id = "steam.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.7;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/wm/keybindings" = {
      close = [ "<Super>q" ];
      minimize = [ "<Super>z" ];
      switch-to-workspace-left = [ "<Super>h" ];
      switch-to-workspace-right = [ "<Super>l" ];
      toggle-fullscreen = [ "<Super>f" ];
    };

    "org/gnome/desktop/wm/preferences" = {
      resize-with-right-button = true;
    };

    "org/gnome/login-screen" = {
      enable-smartcard-authentication = false;
      enable-switchable-authentication = false;
    };

    "org/gnome/nautilus/preferences" = {
      migrated-gtk-settings = true;
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = mkTuple [ 890 550 ];
      initial-size-file-chooser = mkTuple [ 890 550 ];
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/housekeeping" = {
      donation-reminder-last-shown = mkInt64 1795086096926436;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" ];
      mic-mute = [ "Pause" ];
      screensaver = [ "<Shift><Super>l" ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>w";
      command = "helium";
      name = "helum";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
      binding = "<Super>Return";
      command = "ghostty";
      name = "ghostty";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>e";
      command = "nautilus";
      name = "nautilus";
    };

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com" "clipboard-indicator@tudmotu.com" "appindicatorsupport@rgcjonas.gmail.com" "clipboard-indicator@tudmotu.com" ];
      favorite-apps = [ "helium.desktop" "com.mitchellh.ghostty.desktop" "org.gnome.Nautilus.desktop" "org.telegram.desktop.desktop" "mullvad-vpn.desktop" "dev.zed.Zed.desktop" ];
      welcome-dialog-last-shown-version = "50.6";
    };

    "org/gnome/shell/extensions/clipboard-indicator" = {
      toggle-menu = [ "<Super>v" ];
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ "<Shift><Super>s" ];
      toggle-message-tray = [];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };

    "org/gnome/tweaks" = {
      show-extensions-notice = false;
    };

  };
}
