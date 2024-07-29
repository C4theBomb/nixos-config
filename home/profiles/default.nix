{ inputs, self, ... }: 
let 
    extraSpecialArgs = { inherit inputs self; };

    homeImports = {
        desktop = [
            ../.
            ./desktop
        ];
    };

    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in
{
    _module.args = { inherit homeImports; };

    flake = {
        homeConfigurations = {
            "c4-desktop" = inputs.home-manager.lib.homeManagerConfiguration {
                modules = homeImports.desktop;
                inherit pkgs extraSpecialArgs;
            };
        };
    };

}
