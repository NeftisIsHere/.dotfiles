{pkgs, ...}: 
let
  plugins-repo = pkgs.fetchFromGitHub {
    owner = "yazi-rs";
    repo = "plugins";
    rev = "d9bfa0b987714fd794f5a18b1cdf149dc86403dc";
    hash = "sha256-lbT8IkLoyK1OQK6srAIG5OBeHa2o06ywkv305hUs3AE=";
  };
in
{
  programs.yazi = {
    enable = true;
    enableBashIntegration = true;
    shellWrapperName = "yy";

    settings = {
      manager = {
        show_hidden = true;
      };
      preview = {
        max_width = 1000;
	max_height = 1000;
      };
    };

    plugins = {
      chmod = "${plugins-repo}/chmod.yazi";
      full-border = "${plugins-repo}/full-border.yazi";
      max-preview = "${plugins-repo}/max-preview.yazi";
      starship = pkgs.fetchFromGitHub {
        owner = "Rolv-Apneseth";
	repo = "starship.yazi";
	rev = "20d5a4d4544124bade559b31d51ad41561dad92b";
	hash = "sha256-0nritWu53CJAuqQxx6uOXMg4WiHTVm/i78nNRgGrlgg=";
      };
    };

    initLua = ''
      require("full-border"):setup()
      require("starship"):setup()
    '';

    keymap = {
      manager.prepend_keymap = [
        {
	  on = "T";
	  run = "plugin --sync max-preview";
	  desc = "Maximize or restore the preview pane";
	}
	{
	  on = [ "c" "m" ];
	  run = "plugin chmod";
	  desc = "Chmod on selected files";
	}
      ];
    };
  };
}
