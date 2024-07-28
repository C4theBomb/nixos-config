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
}
