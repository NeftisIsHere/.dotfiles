{pkgs, lib, config, ...}:
{
  stylix = {
    enable = true;
    image = /home/jazz/.dotfiles/wallpaper/wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 20;
    };
    polarity = "dark";
  };
}
