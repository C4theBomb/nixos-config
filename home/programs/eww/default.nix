{ pkgs, inputs, ... }: {
    home.packages = with pkgs; [
        eww
        playerctl
        imagemagick
    ];

    home.file.".assets/" = {
        source = inputs.dotfiles + "/assets";
        recursive = true;
    };

    programs.eww = {
        enable = true;
        package = pkgs.eww;
        configDir = ./config;
    };
}
