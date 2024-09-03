{ config, lib, pkgs, inputs, ... }:
{
  # Hyprland
  security.polkit.enable = true;
  programs.hyprland.enable = true;
  
  # Thunar 
  programs = {
    xfconf.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
	thunar-volman ]; };
  };
  
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
}
