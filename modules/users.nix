{ pkgs, ... }: {
  users.users."kosero" = {
    isNormalUser = true;
    description = "kosero";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    hashedPassword = "$6$KtlLUu2wrkxuZP3U$VZsxpRBn1vpj2.907cecMDNwHgDA0axHo4h4Y8CNwPcF1AwbIZ81g4/Uq.GpNPPKDuzXQDLBqI2Utey3CGMWo0";
    shell = pkgs.fish;
  };
}
