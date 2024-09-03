{pkgs, ...}:
{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };
}
