{ config, lib, ... }:

{
  imports = [
    (if builtins.pathExists ./hardware-configuration.nix then
      ./hardware-configuration.nix
    else
      throw "Generate and git add hosts/laptop/hardware-configuration.nix on the laptop. See README.md.")
  ];

  networking.hostName = "laptop";
  system.stateVersion = "26.05";

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "btrfs" ];

  assertions = [
    {
      assertion = ((config.fileSystems."/" or { }).fsType or null) == "btrfs";
      message = "The laptop profile requires a Btrfs root filesystem.";
    }
    {
      assertion = config.boot.initrd.luks.devices != { };
      message = "Configure the laptop's LUKS2 root device in hosts/laptop/hardware-configuration.nix.";
    }
  ];

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    # The Pascal-based MX150 uses NVIDIA's proprietary 580 driver.
    open = false;
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    modesetting.enable = true;
    nvidiaSettings = true;

    prime = {
      intelBusId = lib.mkDefault "PCI:0:2:0";
      nvidiaBusId = lib.mkDefault "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
    };
  };
}
