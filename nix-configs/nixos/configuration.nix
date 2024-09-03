# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./modules/hyprland.nix
      ./modules/stylix.nix
    ];
  home-manager.backupFileExtension = "backup";
  # Nix Specific settings 
  nixpkgs.config.allowUnfree = true;
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    trusted-users = [ "@wheel" ];
    auto-optimise-store = true;
  };
  
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
  # Bootloader & disk mounting
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };

    supportedFilesystems = [ "ntfs" ];

    plymouth.enable = true;
    # Quiet mode
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [ 
      "quiet" 
      "splash" 
      "boot.shell_on_fail" 
      "loglevel=3" 
      "rd.systemd.show_status=false" 
      "rd.udev.log_level=3" 
      "udev.log_priority=3" 
    ];
  };

  fileSystems."/mnt/data" =
  { 
    device = "/dev/sda1";
    fsType = "ntfs-3g";
    options = [ "rw" "uid=1000" "gid=100" "dmask=022" "fmask=133" "windows_names" ];
  };

  # Sleep mode and power management.
  services.logind = { 
    extraConfig = "HandlePowerKey=suspend"; 
    lidSwitch = "suspend"; 
  }; 
 
  powerManagement.enable = true; 
  services.tlp = { 
    enable = true; 
    settings = { 
      CPU_SCALING_GOVERNOR_ON_AC = "performance"; 
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave"; 
 
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power"; 
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance"; 
 
      CPU_MIN_PERF_ON_AC = 0; 
      CPU_MAX_PERF_ON_AC = 100; 
      CPU_MIN_PERF_ON_BAT = 0; 
      CPU_MAX_PERF_ON_BAT = 20; 
 
      START_CHARGE_THRESH_BAT0 = 40; # 40 and bellow it starts to charge 
      STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging 
 
    }; 
  };


  # Networking and time zone
  networking.hostName = "jazz-nixos";
  networking.networkmanager.enable = true;

  time.timeZone = "America/Santiago";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "es";
  };
  services.xserver.xkb.layout = "es";

  # SDDM
  services.displayManager = {
    enable = true;
    
    sddm.enable = true;
    sddm.wayland.enable = true;
    sddm.theme = "${import ./modules/sddm-theme.nix { inherit pkgs; }}";
  };
  environment.pathsToLink = [ "/share/bash-completion" ];
  

  services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };
  environment.systemPackages = with pkgs; [
    psmisc
    vim
    neovim
    git
    wget
    curl
    tree
    # Important for SDDM Theme
    libsForQt5.qt5.qtgraphicaleffects
    libsForQt5.qt5.qtquickcontrols2
  ];
  users.users.jazz = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.bash;

  };
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

