{
  pkgs,
  config,
  lib,
  ...
}:
{
  imports = [
    ../../services/ly.nix
  ];

  services.xserver = {
    enable = true;
    windowManager.bspwm = {
      enable = true;
    };
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  environment.systemPackages = with pkgs; [
    dunst
    rofi
    copyq
    xarchiver
    blueman
    polybarFull
    feh
    flameshot
    pavucontrol

    sxhkd
    playerctl
    libnotify
    ffmpegthumbnailer

    xsetroot
    xprintidle
    xclip
  ];

  home-manager.users.kosero = {
    xdg.configFile."bspwm" = {
      source = ./.;
      recursive = true;
    };
  };

  # thunar
  programs.thunar.enable = true;
  programs.thunar.plugins = with pkgs; [
    thunar-archive-plugin
    thunar-volman
  ];
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}
