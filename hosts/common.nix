{ pkgs, ... }:

{
  hardware.graphics.enable = true;

  # Networking and VPN
  networking.networkmanager.enable = true;
  services.mullvad-vpn.enable = true;

  # Time zone, system locale, and keyboard layouts
  time.timeZone = "Europe/Minsk";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb.layout = "us, ru";

  # GNOME desktop and GDM login screen
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # PipeWire audio with PulseAudio compatibility and support for 32-bit ALSA apps.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Printing with CUPS
  services.printing.enable = true;

  # Steam runtime integration
  programs.steam.enable = true;

  # Local user and shell
  programs.fish.enable = true;
  users.users.akurane = {
    isNormalUser = true;
    description = "akurane";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
    packages = with pkgs; [ ];
  };

  # Allow unfree packages and enable Nix flakes.
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Git module enabling
  programs.git.enable = true;
}
