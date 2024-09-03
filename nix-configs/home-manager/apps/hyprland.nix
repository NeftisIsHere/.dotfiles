{pkgs, ...}:

{
  programs.hyprland = {
    enable = true;
    extraConfig = builtins.readFile ~/.dotfiles/.config/hypr/hyprland.conf;
  };
}

