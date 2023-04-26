{ config, lib, pkgs, modulePatth, ... }:
{
  specialisation.vbox.configuration = {
    services.xserver.displayManager.gdm.wayland = false;
  };
}
