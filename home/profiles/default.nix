{ inputs, self, ... }: 
let 
    extraSpecialArgs = { inherit inputs self; };

    homeImports = {
        "c4patino@arisu" = [
            ../.
            ./arisu
        ];
    };

    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in
{
    _module.args = { inherit homeImports; };

    flake = {
        homeConfigurations = {
            "c4patino_arisu" = inputs.home-manager.lib.homeManagerConfiguration {
                modules = homeImports."c4patino@arisu";
                inherit pkgs extraSpecialArgs;
            };
        };
    };

}
