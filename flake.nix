{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        neovim-config = {
            url = "git+https://github.com/C4theBomb/neovim.git";
            flake = false;
        };
    };

    outputs = { self, nixpkgs, home-manager, neovim-config }@inputs: 
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        nixosConfigurations = {
            c4-desktop = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit system; };

                modules = [
                    ./desktop/configuration.nix
                    ./nixosModules
                ];
            };
        };

        homeConfigurations."c4patino" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;

            modules = [ 
                ./home.nix 
                ./homeManagerModules
            ];
        };
    };
}
