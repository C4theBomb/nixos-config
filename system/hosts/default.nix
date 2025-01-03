{
  inputs,
  homeImports,
  self,
  ...
}: {
  flake.nixosConfigurations = let
    inherit (inputs.nixpkgs.lib) nixosSystem;
    specialArgs = {inherit inputs self;};
  in {
    arisu = nixosSystem {
      inherit specialArgs;
      system = "x86_64-linux";
      modules = [./arisu];
    };
    kokoro = nixosSystem {
      inherit specialArgs;
      system = "x86_64-linux";
      modules = [./kokoro];
    };
    chibi = nixosSystem {
      inherit specialArgs;
      system = "aarch64-linux";
      modules = [./chibi];
    };
    hikari = nixosSystem {
      inherit specialArgs;
      modules = [
        ./hikari
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = specialArgs;
            users.nixos = {imports = homeImports."c4patino@hikari";};
          };
        }
      ];
    };
  };
}
