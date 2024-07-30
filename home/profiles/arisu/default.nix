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
        "DP-2, 2560x1440@120, 0x0, 1"
        "DP-1, 2560x1440@120, 2560x0, 1"
        ", preferred, auto, auto"
    ];
} 
