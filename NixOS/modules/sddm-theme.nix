{ pkgs }:
let 
  image_repo = pkgs.fetchFromGitHub {
    owner = "NeftisIsHere";
    repo = ".dotfiles";
    rev = "472ba3405b496c138340c5e9481cd66dbbb11a47";
    hash = "sha256-9fgyMcGWr3FeLszyNSrnBnNyq6r0607W+XnTgBI0JY4=";
  };
in

pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r "${image_repo}/wallpaper/"wallpaper.jpg $out/Background.jpg
   '';
}
