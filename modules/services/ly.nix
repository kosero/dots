{
  pkgs,
  config,
  lib,
  ...
}:
let
  blackholeDur = pkgs.fetchurl {
    url = "https://codeberg.org/fairyglade/ly-community/raw/branch/main/animations/dur/blackhole-smooth-240x67.dur";
    sha256 = "05a48i16lbsykdny0qrgkqrag8j20wv0slmlzlh2p037zg6cb3f2";
  };
in
{
  services.displayManager.ly = {
    enable = true;
    settings = {
      animation = "dur_file";
      dur_file_path = "${blackholeDur}";
      dur_offset_alignment = "center";
      full_color = true;
    };
  };
}
