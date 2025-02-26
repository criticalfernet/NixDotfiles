{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; 
  #networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Universal";

  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  #   useXkbConfig = true; # use xkb.options in tty.
  # };

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "catppuccin-mocha";
  services.ollama.enable = true;


  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # services.printing.enable = true;

  #hardware.pulseaudio.enable = true;
   services.pipewire = {
     enable = true;
     pulse.enable = true;
   };

  services.libinput.enable = true;

  nixpkgs.config.allowUnfree = true;

   users.users.critfer = {
   	shell = pkgs.zsh;
     isNormalUser = true;
     extraGroups = [ "wheel" ];
     packages = with pkgs; [
     ];
   };

  # programs.firefox.enable = true;
  programs.nix-ld.enable = true;

  programs.hyprland = {
	enable = true;
	xwayland.enable = true;
  };
  programs.zsh.enable = true;


  hardware = {
	nvidia.modesetting.enable = true;
  };
  
  hardware.graphics.enable = true;

  hardware.bluetooth.enable = true;
	



  # List packages installed in system profile. To search, run:

  # $ nix search wget
  environment.systemPackages = with pkgs; [
		bat
		cargo
		catppuccin-sddm
		cava
		cbonsai
		clang
		clang-tools
		cmatrix
		fastfetch
		firefox
		fzf
		gcc
		git
		gtop
		htop
		hypridle
		hyprlock
		hyprpaper
		jq
		killall
		kitty
		lazygit
		libreoffice
		neovim
		nodejs_23
		ollama
		pipes
		playerctl
		python314
		rofi
		rustup
		spotify
		starship
		stow
		unzip
		vim 
		waybar
		wget
		yazi
		zip
		zoxide
		zsh
  ];

  fonts.packages = with pkgs; [
		font-awesome
	  noto-fonts
	  noto-fonts-cjk-sans
	  noto-fonts-emoji
		(nerdfonts.override { fonts = ["DroidSansMono"]; })
	];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  services.openssh.enable = true;
  services.blueman.enable = true;


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11";

}

