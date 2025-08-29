{ config, pkgs, ... }:

{
  home.username = "lazar";
  home.homeDirectory = "/home/lazar";

  # версия home-manager
  home.stateVersion = "24.05";

  # включаем нужные пакеты (можно добавить свои)
  home.packages = with pkgs; [
    kitty
    hyprland
    hyprpaper
    hyprlock
    waybar
  ];

  # kitty
  programs.kitty = {
    enable = true;
    settings = builtins.readFile ./kitty/kitty.conf;
  };

  # hyprland (можно указать через xdg.configFile, т.к. он ищет в ~/.config/hypr)
  xdg.configFile."hypr/hyprland.conf".source = ./hypr/hyprland.conf;

  # hyprlock
  xdg.configFile."hypr/hyprlock.conf".source = ./hypr/hyprlock.conf;

  # hyprpaper
  xdg.configFile."hypr/hyprpaper.conf".source = ./hypr/hyprpaper.conf;

  # waybar
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = builtins.fromJSON (builtins.readFile ./waybar/waybar.jsonc);
    };
    style = builtins.readFile ./waybar/style.css;
  };

  # xdg base dirs (чтобы всё складывалось красиво в ~/.config)
  xdg.enable = true;
}
