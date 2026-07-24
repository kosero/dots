{ ... }: {
  services.flatpak = {
    enable = true;
    remotes = [
      {
        name = "flathub";
        location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      }
    ];
    packages = [
      "net.davidotek.pupgui2"
      "com.usebottles.bottles"
      "com.discordapp.Discord"
    ];
  };

  services.discord-flatpak-rpc.enable = true;
}
