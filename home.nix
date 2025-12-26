{ config, pkgs, ... }:

{
	home.username = "optimidev";
	home.homeDirectory = "/home/optimidev";
	programs.git.enable = true;
	home.stateVersion = "25.11";
	programs.bash = {
		enable = true;
		shellAliases = {
			opti-rebuild = "sudo nixos-rebuild switch --flake ~/.nixos-dotfiles#optipxc";
		};
	};
  home.file.".config/alacritty".source = ./config/alacritty;
  home.file.".config/oxwm".source = ./config/oxwm;
  home.file.".config/nvim".source = ./config/nvim;
  programs.neovim = {
    enable = true;
  };
   fonts.fontconfig.enable = true;
  
  # Home packages :p
	home.packages = with pkgs; [
    flatpak
    pavucontrol
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka
    xdg-desktop-portal
    xdg-desktop-portal-gtk
    fd
    unityhub
    git
    cargo
    go
    prismlauncher
    scrot
    discord
    dmenu
		ripgrep
		nil
		nixpkgs-fmt
		nodejs
		gcc
    rpi-imager
	];
}
