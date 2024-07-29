{ inputs, ... }: {
    imports = [
        ./config/general.nix
        ./config/rules.nix
        ./config/keybinds.nix
        ./config/plugins.nix
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        xwayland.enable = true;
    };
}
