{
  programs.fish = {
    enable = true;
    shellInit = ''
      fish_add_path -g ~/.local/bin ~/.spicetify
    '';
    shellAliases = {
      z = "cd ..";
      mbs1 = "ddcutil --bus 2 setvcp 10";
      mbs2 = "ddcutil --bus 3 setvcp 10";
      mbsp1 = "ddcutil --bus 3 setvcp 10 100 && ddcutil --bus 2 setvcp 10 70";
      mbsp2 = "ddcutil --bus 3 setvcp 10 50 && ddcutil --bus 2 setvcp 10 30";
    };
  };
}
