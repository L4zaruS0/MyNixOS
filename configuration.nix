# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

#Defining root
#fileSystems. "/" = {
 # device = "/dev/disk/by-uuid/9421b200-b008-4ce6-991c-cbadba5d1c88";
 # fsType = "ext4";
#};

#Defining boot
#fileSystems."/boot" = {
 # device = "/dev/disk/by-uuid/1D6E-7A66";
  #fsType = "vfat";
#};

#Adding various settings (flakes)
 nix.settings.experimental-features = [ "nix-command" "flakes" ]; 

#Making superuser (not using sudo and passwords all the time)
security.sudo = {
  enable = true;
  wheelNeedsPassword = false;
};
#Enabling programs
programs = {
  hyprland.enable = true;
  steam.enable = true;
  git.enable = true;
  neovim.enable = true;
};
environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "L"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Configure network proxy if necessary
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
 # services.xserver.enable = true;
 # services.xserver.displayManager.sddm.enable = true;
 
  environment.etc."wayland-sessions/hyprland.desktop".text = ''
	[Desktop Entry]
	Name=Hyprland
	Comment=Hyprland Wayland Compositor
	Exec=Hyprland
	Type=Application
	'';

  

  # Configure keymap in X11
  # services.xserver.xkb.layout = "us";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
   services.pipewire = {
    enable = true;
     pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
   users.users.L = {
     isNormalUser = true;
     extraGroups = [ "wheel" "audio" "video" "networkmanager" ]; # Enable ‘sudo’ for the user.
     packages = with pkgs; [
  #     tree
     ];
   };

nixpkgs.config.allowUnfree = true;
  # programs.firefox.enable = true;
  #Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  # List packages installed in system profile. To search, run:
  # $ nix search wget
   environment.systemPackages = with pkgs; [
        vim 
        wget
	steam
	gcc
	git
	wine
	spotify
	spotifywm
	nmap
	python3
	python312Packages.pip
	clang
	cmake
	brave
	wineWow64Packages.waylandFull
	hyprland
	hyprpaper
	hyprshot
	hyprlock
	waybar
	protonplus
	protonup-qt
	kitty
	hyprland-protocols
	cava
	neofetch
	cmatrix
	catppuccin	
	lutris
	telegram-desktop
	wofi
	swww
	htop
	obs-studio
	font-awesome
	virtualbox
	zoom-us
	vscode
	gamescope
	neovim	
   ];
#video 
services.xserver.videoDrivers = ["nvidia"];
services.displayManager.sddm.enable = true;
services.desktopManager.plasma6.enable = true;
services.xserver.screenSection = ''
Section "Monitor"
Identifier "Monitor0" 
Option "PreferredMode" "2560x1440_144.01"
EndSection
'';
#for old versions
 #hardware.opengl.enable = true;
 #hardware.opengl.driSupport = true;
 #hardware.opengl.driSupport32Bit = true;
 #hardware.nvidia.modesetting.enable = true;
 #services.xserver.videoDrivers = [ "nvidia" ];

#For new versions 
hardware.graphics.enable = true;
hardware.nvidia = {
  modesetting.enable = true;
  powerManagement.enable = true;
  open = false; 
  package = config.boot.kernelPackages.nvidiaPackages.beta;
  nvidiaSettings = true;
  forceFullCompositionPipeline = true;
};
environment.sessionVariables.NVD_BACKEND = "direct";



  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
   system.copySystemConfiguration = false;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?

}

