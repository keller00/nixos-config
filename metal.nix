{ config, lib, pkgs, modulePatth, ... }:
{
  config = lib.mkIf (config.specialisation != {}) {
    services.xserver.videoDrivers = ["nvidia"];
    hardware.opengl.enable = true;
    hardware.nvidia.modesetting.enable = true;
    services.xserver.displayManager.gdm.wayland = true;
  };
}
