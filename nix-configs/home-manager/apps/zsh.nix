{config, ...}:
{
  programs.zsh = {
    enable = true;
    # enableCompletion = true;
    # syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/.local/state/zsh/history";
      append = true;
      ignoreDups = true;
    };
   #  zstyle :compinstall filename '"$ZDOTDIR"/.zshrc'                                                          
   #  setopt auto_pushd                                                                                      
   #  autoload -U compinit && compinit -u                                                                       
   #  zstyle ':completion:*' menu select                                                                        
   #  # Auto complete with case insenstivity                                                                    
   #  zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'             
   #                                                                                                        
   #  # Completion files: Use XDG dirs                                                                          
   #  [ -d "$XDG_CACHE_HOME"/zsh ] || mkdir -p "$XDG_CACHE_HOME"/zsh                                            
   #  zstyle ':completion:*' cache-path "$XDG_CACHE_HOME"/zsh/zcompcache                                        
   #  compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-$ZSH_VERSION                                                  
   #                                                                                                        
   #  zmodload zsh/complist                                                                                     
   #  compinit                                                                                                  
   #  _comp_options+=(globdots)               # Include hidden files.
   #  '';
  };
}

