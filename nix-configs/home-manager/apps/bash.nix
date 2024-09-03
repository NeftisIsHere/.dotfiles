{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      alias ls='ls -A --group-directories-first --color=auto'
      export dotfiles="/home/$USER/.dotfiles"
      fastfetch
    '';
  };
}
