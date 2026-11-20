{ config, pkgs, ... }:

{
  imports = [ ../../hardware-configuration.nix ];

  networking.hostName = "nixos";
  system.stateVersion = "26.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  hardware.i2c.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];

  programs.steam.enable = true;
  programs.nix-ld.enable = true;

  hardware.nvidia = {
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    modesetting.enable = true;
    nvidiaSettings = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
  };
}
