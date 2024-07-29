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
    ];
} 
