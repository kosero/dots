{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.services.discord-flatpak-rpc;
in
{
  options.services.discord-flatpak-rpc = {
    enable = mkEnableOption "Discord Flatpak RPC Bridge";
  };

  config = mkIf cfg.enable {
    systemd.user.sockets."discord-flatpak-rpc-bridge" = {
      Unit = {
        Description = "Discord Native-to-Flatpak RPC Bridge Socket";
      };
      Socket = {
        Priority = 6;
        ListenStream = "%t/discord-ipc-0";
      };
      Install = {
        WantedBy = [ "sockets.target" ];
      };
    };

    systemd.user.services."discord-flatpak-rpc-bridge" = {
      Unit = {
        Description = "Discord Flatpak-to-Native RPC Bridge Service";
        Requires = [ "discord-flatpak-rpc-bridge.socket" ];
        After = [ "discord-flatpak-rpc-bridge.socket" ];
      };
      Service = {
        Type = "notify";
        ExecStart = "${pkgs.systemd}/lib/systemd/systemd-socket-proxyd %t/app/com.discordapp.Discord/discord-ipc-0";
        PrivateTmp = true;
        PrivateNetwork = true;
      };
      Install = {
        WantedBy = [ "default.target" ];
      };
    };
  };
}
