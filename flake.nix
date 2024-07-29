{
    description = "A very basic flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
        hyprpaper.url = "github:hyprwm/hyprpaper";
        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            inputs.hyprland.follows = "hyprland";
        };
        neovim-config = {
            url = "git+https://github.com/C4theBomb/neovim.git";
            flake = false;
        };
        dotfiles = {
            url = "git+https://github.com/C4theBomb/dotfiles.git";
            flake = false;
        };
    };

    outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
        system = "x86_64-linux";
        pkgs = nixpkgs.legacyPackages.${system};
    in
    {
        nixosConfigurations = {
            c4-desktop = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };

                modules = [
                    ./hosts/desktop/configuration.nix
                    ./nixosModules
                ];
            };
            iso-graphical = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs; };

                modules = [
                    ./hosts/iso-graphical/configuration.nix
                    ./nixosModules
                ];
            };
        };

        homeConfigurations."c4patino" = home-manager.lib.homeManagerConfiguration {
            inherit pkgs;
            extraSpecialArgs = { inherit inputs; };

            modules = [ 
                ./hosts/home.nix 
                ./homeManagerModules
            ];
        };
    };
}
