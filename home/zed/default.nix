{
  xdg.configFile."zed/settings.json".text = builtins.toJSON {
    vim_mode = true;
    ui_font_size = 16;
    buffer_font_size = 15;
    theme = {
      mode = "system";
      light = "Ayu Light";
      dark = "macOS Classic Dark";
    };
  };
}
