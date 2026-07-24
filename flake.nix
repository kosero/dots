{
  description = "My nix dotfiles";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cachyos-kernel = {
      url = "github:xddxdd/nix-cachyos-kernel";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    freesmlauncher.url = "github:FreesmTeam/FreesmLauncher";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };
  outputs =
    {
      nixpkgs,
      home-manager,
      nix-cachyos-kernel,
      freesmlauncher,
      nix-flatpak,
      ...
    }:
    {
      nixosConfigurations.ln-82s9 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./devices/ln-82s9
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              sharedModules = [ nix-flatpak.homeManagerModules.nix-flatpak ];
              extraSpecialArgs = { inherit freesmlauncher; };
              users.kosero = import ./home;
            };
          }
          { nixpkgs.overlays = [ nix-cachyos-kernel.overlays.pinned ]; }
        ];
      };
    };
}
