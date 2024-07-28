{ pkgs, inputs, ... }:
let
    gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
in
{
    home.username = "c4patino";
    home.homeDirectory = "/home/c4patino";
    home.stateVersion = "23.11";

    nixpkgs.config = { allowUnfree = true; };
    programs.home-manager.enable = true;

    imports = [
        ../homeManagerModules
    ];

    qt.platformTheme.name = "gtk";
    qt.enable = true;

    gtk = {
        enable = true;
        cursorTheme = {
            package = pkgs.bibata-cursors;
            name = "Bibata-Modern-Ice";
        };
        theme = {
            package = pkgs.adw-gtk3;
            name = "adw-gtk3";
        };
        iconTheme = {
            package = gruvboxPlus;
            name = "GruvboxPlus";
        };
    };

    home.packages = with pkgs; [

    ];
}
