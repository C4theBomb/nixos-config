{ pkgs, inputs, config, lib, ... }: {
    options = {
        hyprland.enable = lib.mkenalbeOption "enables hyprland"
    };

    environment.systemPackages = with pkgs; [
        
    ];

    config = lib.mkIf config.hyprland.enable {
        programs.hyprland = {
            enable = true;
            package = inputs.hyprland.packages."${pkgs.system}".hyprland;
            xwayland.enable = true;
        };
    };
}
