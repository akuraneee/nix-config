{ config, pkgs, inputs, ... }:

{
  # Hardware and boot
  # Disk mounts and hardware modules are defined in hardware-configuration.nix.
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Networking and VPN
  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  services.mullvad-vpn.enable = true;

  # Time zone, system locale, and keyboard layouts
  time.timeZone = "Europe/Minsk";
  i18n.defaultLocale = "en_US.UTF-8";
  services.xserver.xkb.layout = "us, ru";

  # GNOME desktop and GDM login screen
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  # NVIDIA graphics
  hardware.graphics.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # Use the proprietary kernel module and the stable driver for the selected kernel.
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    nvidiaSettings = true;

    # Keep experimental power management disabled.
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };

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

  # Packages available to all users
  environment.systemPackages = with pkgs; [
    neovim
    fish
    wget
    gearlever
    ghostty
    mullvad-vpn
    git
    starship
    curl
    telegram-desktop
    equibop
    fastfetch
    codex
    bubblewrap
    dconf2nix
    inputs.helium.packages.${system}.default
    steam
    prismlauncher
    obsidian
    zed-editor
  ];

  # System data compatibility version. Keep this value when upgrading NixOS.
  system.stateVersion = "26.05";
}
