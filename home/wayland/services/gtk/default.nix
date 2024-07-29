{ pkgs, ... }: 
let
    gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
in
{

    qt = {
        enable = true;
        platformTheme.name = "gtk";
    };

    gtk = {
        enable = true;
        theme = {
            package = pkgs.adw-gtk3;
            name = "adw-gtk3";
        };
        iconTheme = {
            package = gruvboxPlus;
            name = "GruvboxPlus";
        };
    };
}
