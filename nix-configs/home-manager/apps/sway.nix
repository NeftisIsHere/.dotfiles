{pkgs, ...}:
{
  # enable sway window manager
  wayland.windowManager.sway = {
    enable = true;
    package = pkgs.swayfx;
    checkConfig = false;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      # Use kitty as default terminal
      terminal = "kitty"; 
      startup = [
        # Launch Firefox on start
        {command = "kitty";}
      ];
      
      input = {
        "*" = { 
	  xkb_layout = "es"; 
	};
      };

      output = {
        eDP-1 = {
          bg = "/home/jazz/.dotfiles/wallpaper/wallpaper.png fill";
	};
      };
    };
  };
}
