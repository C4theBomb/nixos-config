{ pkgs, ... }: {
    programs.home-manager.enable = true;

    nixpkgs.config.allowUnfree = true;

    home = {
        username = "c4patino";
        homeDirectory = "/home/c4patino";
        stateVersion = "23.11";
    };
}
