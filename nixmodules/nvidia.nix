{ config, lib, pkgs, ... }:
{
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
    open = false;
  };

  nixpkgs.config.cudaSupport = true;

  boot.blacklistedKernelModules = [ "kvm" "kvm_amd" ]; 

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  boot.kernelModules = [ "i2c-dev" ];

}