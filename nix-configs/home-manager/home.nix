{ config, pkgs, inputs, ... }:
let
  gruvboxplus = import ./themes/icons/gruvbox-plus.nix;
in
{
  home.username = "jazz";
  home.homeDirectory = "/home/jazz";
  home.stateVersion = "23.11";
  
  imports = [
    ./apps/bash.nix
    ./apps/starship.nix
    ./apps/waybar.nix
    ./apps/yazi.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # The only important program here
    fastfetch
    btop
    eza
    bat
    glow
    networkmanagerapplet
    # Fonts
    iosevka
    roboto
    liberation_ttf
    font-awesome
    (pkgs.nerdfonts.override { fonts = [ "FiraMono" ]; })
    
    # Archives
    p7zip
    unzip
    xz
    zip

    # Utils
    ripgrep
    fzf
    cowsay
    file
    which
    pciutils
    usbutils
    # Hyprland 
    hyprpaper
    hyprlock
    hypridle
    swaynotificationcenter
    dconf
    grim
    slurp
    wl-clipboard
    fuzzel
    # Apps
    kitty
    firefox
    discord
  ];
  
  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };  

  programs.git = {
    enable = true;
    userName = "Jazmin Vallejos";
    userEmail = "jazmin.irene.vc@protonmail.com";
  };
  
  programs.neovim.enable = true;
  
  gtk = {
    enable = true;
    # theme = {
    #  package = pkgs.gruvbox-gtk-theme;
    #  name = "Gruvbox-Dark";
    # };
    iconTheme = {
      package = pkgs.gruvbox-plus-icons;
      name = "Gruvbox-Plus-Dark";
    };
   #  gtk3.extraConfig = {
   #    gtk-application-prefer-dark-theme = true;
   #  };

   #  gtk4.extraConfig = {
   #    gtk-application-prefer-dark-theme = true;
   #  };
   #  cursorTheme.name = "Bibata-Modern-Ice";
  };

}
