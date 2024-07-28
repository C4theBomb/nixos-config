{ pkgs, inputs, config, lib, ... }: {
    options = {
        hyprland.enable = lib.mkEnableOption "enables hyprland";
    };


    config = lib.mkIf config.hyprland.enable {
        environment.systemPackages = with pkgs; [
            kitty

            (waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ]; }))

            dunst
            libnotify

            swww
            rofi-wayland
        ];

        wayland.windowManager.hyprland = {
            enable = true;

            settings = {
                "$mod" = "SUPER";

                "$terminal" = "kitty";
                "$menu" = "rofi --show drun";

                exec-once = [
                    "$terminal"
                    "dunst &"
                    "hyprpaper &"
                ];

                env = [
                    "XCURSOR_SIZE,24"
                    "HYPRCURSOR_SIZE,24"
                    "LIBVA_DRIVER_NAME,nvidia"
                    "XDG_SESSION_TYPE,wayland"
                    "GBM_BACKEND,nvidia-drm"
                    "__GLX_VENDOR_LIBRARY_NAME,nvidia"
                ];

                cursor = {
                    no_hardware_cursors = true;
                }

                general = {
                    gaps_in = 5;
                    gaps_out = 20;

                    border_size = 2;

                    "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
                    "col.inactive_border" = "rgba(595959aa)";

                    resize_on_border = false;

                    allow_tearing = false;

                    layout = "dwindle";
                };

                decoration = {
                    rounding = 10;

                    active_opacity = 1.0;
                    inactive_opacity = 1.0;
                    fullscree_opacity = 1.0;

                    drop_shadow = true;
                    shadow_range = 60;
                    shadow_offset = "0 5";
                    shadow_render_power = 4;
                    "col.shadow" = "rgba(00000099)";

                    blur {
                        enabled = true;
                        size = 6;
                        passes = 3;
                        new_optimizations = true;
                    };
                };

                
                animations {
                    enabled = true;

                    bezier = [
                        "fastBezier, 0.05, 1.1, 0.2, 1.0"
                        "linear, 0.0, 0.0, 1.0, 1.0"
                        "liner, 1, 1, 1, 1"
                    ];

                    animation = [
                        "windows, 1, 7, fastBezier, slide"
                        "windowsOut, 1, 7, fastBezier, slide"
                        "border, 1, 10, fastBezier"
                        "fade, 1, 7, fastBezier"
                        "workspaces, 1, 6, fastBezier"
                        "border, 1, 1, liner"
                        "borderangle, 1, 40, liner, loop"
                        "borderangle, 1, 100, linear, loop"
                    ];
                };

                dwindle = {
                    pseudotile = true;
                    preserve_split = true;
                };

                master = {
                    new_status = master;
                };

                gestures = {
                    workspace_swipe = false;
                };

                misc = {
                    disable_hyprland_logo = true;
                    mouse_move_enables_dpms = true;
                    key_press_enables_dpms = false;
                };

                bind = [
                    "$mainMod, S, exec, rofi -show drun -show-icons"

                    "$mainMod, Q, exec, $terminal"
                    "$mainMod, C, killactive,"
                    "$mainMod, M, exit,"
                    "$mainMod, E, exec, $fileManager"
                    "$mainMod, V, togglefloating,"
                    "$mainMod, R, exec, $menu"
                    "$mainMod, P, pseudo, # dwindle"
                    "$mainMod, J, togglesplit, # dwindle"

                    # Move focus with mainMod + arrow keys
                    "$mainMod, left, movefocus, l"
                    "$mainMod, right, movefocus, r"
                    "$mainMod, up, movefocus, u"
                    "$mainMod, down, movefocus, d"

                    # Switch workspaces with mainMod + [0-9]
                    "$mainMod, 1, workspace, 1"
                    "$mainMod, 2, workspace, 2"
                    "$mainMod, 3, workspace, 3"
                    "$mainMod, 4, workspace, 4"
                    "$mainMod, 5, workspace, 5"
                    "$mainMod, 6, workspace, 6"
                    "$mainMod, 7, workspace, 7"
                    "$mainMod, 8, workspace, 8"
                    "$mainMod, 9, workspace, 9"
                    "$mainMod, 0, workspace, 10"

                    # Move active window to a workspace with mainMod + SHIFT + [0-9]
                    "$mainMod SHIFT, 1, movetoworkspace, 1"
                    "$mainMod SHIFT, 2, movetoworkspace, 2"
                    "$mainMod SHIFT, 3, movetoworkspace, 3"
                    "$mainMod SHIFT, 4, movetoworkspace, 4"
                    "$mainMod SHIFT, 5, movetoworkspace, 5"
                    "$mainMod SHIFT, 6, movetoworkspace, 6"
                    "$mainMod SHIFT, 7, movetoworkspace, 7"
                    "$mainMod SHIFT, 8, movetoworkspace, 8"
                    "$mainMod SHIFT, 9, movetoworkspace, 9"
                    "$mainMod SHIFT, 0, movetoworkspace, 10"

                    # Scroll through existing workspaces with mainMod + scroll
                    "$mainMod, mouse_down, workspace, e+1"
                    "$mainMod, mouse_up, workspace, e-1"
                ];

                bindm = [
                    "$mainMod, mouse:272, movewindow"
                    "$mainMod, mouse:273, resizewindow"
                ];

                windowrulev2 = "suppressevent maximize, class:.*";
            };
        };
    };
}
