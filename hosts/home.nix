{ pkgs, inputs, ... }:
{
    home.username = "c4patino";
    home.homeDirectory = "/home/c4patino";
    home.stateVersion = "23.11";

    nixpkgs.config = { allowUnfree = true; };
    programs.home-manager.enable = true;

    imports = [
        ../homeManagerModules
    ];

    home.packages = with pkgs; [

    ];

    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;

        settings = {
            "$mod" = "SUPER";
            "$terminal" = "kitty";
            "$fileManager" = "dolphin";
            "$menu" = "rofi --show drun";

            monitor = [
                "DP-1,2560x1440@120,2560x0,1"
                "DP-2,2560x1440@120,0x0,1"
                ",preferred,auto,auto"
            ];

            "plugin:borders-plus-plus" = {
                add_borders = 1;

                "col.border_1" = "rgb(ffffff)";
                "col.border_2" = "rgb(2222ff)";

                border_size_1 = 10;
                border_size_2 = 1;

                natural_rounding = "yes";
            };
        };

        plugins = [
            inputs.hyprland-plugins.packages."${pkgs.system}".borders-plus-plus
        ];
    };
}
