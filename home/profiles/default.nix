{ inputs, self, ... }: 
let 
    extraSpecialArgs = { inherit inputs self; };

    homeImports = {
        "c4patino@arisu" = [
            ../.
            ./arisu
        ];
        "c4patino@kokoro" = [
            ../.
            ./kokoro
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
            "c4patino_kokoro" = inputs.home-manager.lib.homeManagerConfiguration {
                modules = homeImports."c4patino@kokoro";
                inherit pkgs extraSpecialArgs;
            };
        };
    };

}
