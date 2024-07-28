{ pkgs, inputs, config, lib, ... }: {
    options = {
        hyprland.enable = lib.mkEnableOption "enables hyprland";
    };


    config = lib.mkIf config.hyprland.enable {
        programs.hyprland = {
            enable = true;
            package = inputs.hyprland.packages."${pkgs.system}".hyprland;
            xwayland.enable = true;
        };

        xdg.portal = {
            enable = true;
            extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
        };

        environment.sessionVariables = {
            WLR_NO_HARDWARE_CURSORS = "1";
            NIXOS_OZONE_WL = "1";
        };
    };
}
