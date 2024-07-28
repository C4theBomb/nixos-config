{pkgs, inputs, ... }:
{
    home.username = "c4patino";
    home.homeDirectory = "/home/c4patino";
    home.stateVersion = "23.11";

    nixpkgs.config = { allowUnfree = true; };
    programs.home-manager.enable = true;

    imports = [
        ../homeManagerModules
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            plugins = [
                inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
            ];

            settings = {
                "plugin:borders-plus-plus" = {
                    add_borders = 1

                    "col.border_1" = "rgb(ffffff)";
                    "col.border_2" = "rgb(2222ff)";

                    border_size_1 = 10;
                    border_size_2 = 1;

                    natural_rounding = "yes";
                };
            };
        };
    };
}
