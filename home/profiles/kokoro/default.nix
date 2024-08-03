{ inputs, pkgs, ... }: {
    imports = [
        ./stylix.nix

        ../../programs
        ../../wayland
    ];

    home.packages = with pkgs; [
        curl
        wget
        xclip
        mpv
        imv
        jq
    ];

    wayland.windowManager.hyprland.settings.monitor = [
        ", preferred, auto, auto"
    ];
} 
