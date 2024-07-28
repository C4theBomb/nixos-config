{ lib, ... }: {
    imports = [
        ./virtualization
        ./nvidia.nix
        ./hyprland.nix
    ];

    hyprland.enable = lib.mkDefault true;
}
