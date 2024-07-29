{ inputs, homeImports, ... }: {
    flake.nixosConfigurations = let
        inherit (inputs.nixpkgs.lib) nixosSystem;
        specialArgs = { inherit inputs; };
    in {
        c4-desktop = nixosSystem {
            inherit specialArgs;
            modules = [ ./deskop ];
        };
        iso-graphical = nixosSystem {
            inherit specialArgs;
            modules = [ ./iso ];
        };
    };
}
