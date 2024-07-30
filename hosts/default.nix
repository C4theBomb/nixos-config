{ inputs, homeImports, ... }: {
    flake.nixosConfigurations = let
        inherit (inputs.nixpkgs.lib) nixosSystem;
        specialArgs = { inherit inputs; };
    in {
        arisu = nixosSystem {
            inherit specialArgs;
            modules = [ ./arisu ];
        };
        iso-graphical = nixosSystem {
            inherit specialArgs;
            modules = [ ./iso-graphical ];
        };
    };
}
