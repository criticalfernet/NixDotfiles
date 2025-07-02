{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      /etc/nixos/hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

	boot = {
		initrd.kernelModules = [ "nvidia" "i915" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
		kernelParams = [ "nvidia-drm.fbdev=1" ];
	};

  networking.hostName = "nixos"; 
  #networking.wireless.enable = true;
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Kolkata";

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
	#services.xserver.enable = true;
  #services.xserver.displayManager.sddm.enable = true;
	#services.displayManager.sddm.enable = true;
	#services.displayManager.sddm.theme = "catppuccin-mocha";
	
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
	services.xserver.desktopManager.xterm.enable = false;
	services.xserver.desktopManager.gnome.extraGSettingsOverridePackages = [ pkgs.mutter ];
	programs.dconf.enable = true;

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
   	shell = pkgs.fish;
     isNormalUser = true;
     extraGroups = [ "wheel" ];
   };

  # programs.firefox.enable = true;
  programs.nix-ld.enable = true;

	#programs.hyprland = {
	#enable = true;
	#xwayland.enable = true;
	#};
	#programs.zsh.enable = true;
	programs.fish.enable = true;
	programs.steam.enable = true;
	programs.gamemode.enable = true;


	services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
		prime = {
			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:1:0:0";
			offload = {
				enable = true;
				enableOffloadCmd = true;
			};
			sync.enable = false;
			reverseSync.enable = false;
		};
		#package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  hardware.graphics.enable = true;

  hardware.bluetooth.enable = true;
	


  # List packages installed in system profile. To search, run:

  # $ nix search wget
	environment.gnome.excludePackages = with pkgs; [
		baobab
		epiphany
		evince
		file-roller
		geary
		gnome-calendar
		gnome-connections
		gnome-console
		gnome-contacts
		gnome-disk-utility
		gnome-logs
    gnome-maps
    gnome-music
		gnome-system-monitor
		gnome-text-editor
		gnome-tour
		gnome-user-docs
		gnome-weather
		seahorse
		simple-scan
		xterm
		yelp
	];

  environment.systemPackages = with pkgs; [
		adwaita-icon-theme
		albert
		amberol
		bat
		blender
		cargo
		catppuccin-gtk
		catppuccin-sddm
		cava
		cbonsai
		clang
		clang-tools
		cmatrix
		cmus
		discord
		eza
		fastfetch
		ffmpeg
		figlet
		firefox
		fish
		flat-remix-gnome
		flat-remix-gtk
		fselect
		fzf
		gcc
		gdb
		ghidra-bin
		git
		gitui
		gnome-tweaks
		gnomeExtensions.just-perfection
		gnomeExtensions.space-bar
		#gnomeExtensions.switcher
		gnomeExtensions.tactile
		gnomeExtensions.spotify-tray
		gnome-themes-extra
		gruvbox-dark-gtk
		gruvbox-dark-icons-gtk
		gtop
		#htop
		hyperfine
		hypridle
		hyprlock
		hyprpaper
		jdk
		jq
		killall
		kitty
		lazygit
		libreoffice
		lshw
		mesa-demos
		neovim
		nodejs_23
		obsidian
		ollama
		openvpn
		pipes
		playerctl
		protonup
		protonvpn-gui
		pwntools
		python314
		#rofi
		ripgrep
		rustup
		spotify
		starship
		steam
		stow
		unzip
		vim 
		waybar
		wget
		wiki-tui
		wine64
		xdg-utils
		#yazi
		zip
		zoxide
		zsh
  ];

  fonts.packages = with pkgs; [
		font-awesome
	  noto-fonts
	  noto-fonts-cjk-sans
	  noto-fonts-emoji
		(nerdfonts.override { fonts = ["FiraCode" "DroidSansMono" "JetBrainsMono"]; })
	];

	environment.sessionVariables = {
		#STEAM_EXTRA_COMPAT_TOOLS_PATHS = 
		#	”\${HOME}/.steam/root/compatibilitytools.d”;
  };


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  services.openssh.enable = true;
  services.blueman.enable = true;
	services.flatpak.enable = true;
	systemd.services.flatpak-repo = {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
  };


  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11";

}

