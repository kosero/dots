{ ... }: {
  imports = [
    ../services/sddm.nix
  ];

  services.xserver.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}
