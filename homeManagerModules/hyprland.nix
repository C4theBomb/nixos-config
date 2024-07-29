{ pkgs, inputs, config, lib, ... }: {
    options = {
        hyprland.enable = lib.mkEnableOption "enables hyprland";
    };

    imports = [

    ];

    config = lib.mkIf config.hyprland.enable {
        home.packages = with pkgs; [
            kitty

            (waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ]; }))

            dunst
            libnotify

            rofi-wayland
            anyrun

            swaybg
            variety

            wireplumber

            polkit

            hyprpicker

            wl-clipboard
            cliphist
        ];
        
        home.file = {
            ".desktops/" = {
                source = inputs.dotfiles + "/desktops";
                recursive = true;
            };
        };

        wayland.windowManager.hyprland = {
            enable = true;
            xwayland.enable = true;

            plugins = with pkgs.hyprlandPlugins; [
                hyprexpo
            ];

            settings = {
                "$mainMod" = "SUPER";

                "$terminal" = "kitty";
                "$menu" = "rofi -show drun -show-icons";

                plugin = {
                    hyprexpo = {
                        columns = 3;
                        gap_size = 5;
                        bg_col = "rgb(111111)";
                        workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1

                        enable_gesture = true; # laptop touchpad
                        gesture_fingers = 3;  # 3 or 4
                        gesture_distance = 300; # how far is the "max"
                        gesture_positive = true; # positive = swipe down. Negative = swipe up.
                    };
                };

                exec-once = [
                    "$terminal"
                    "dunst &"

                    "swaybg &"
                    "variety &"
                    
                    "waybar &"

                    "wireplumber"

                    "wl-paste --type text --watch cliphist store"
                    "wl-paste --type image --watch cliphist store"

                    "dbus-update-activation-environment --systmd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
                    "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
                ];

                env = [
                    "GDK_BACKEND,wayland,x11,*"
                    "QT_QPA_PlATFORM,wayland;xcb"
                    "SDLVIDEODRIVER,wayland"
                    "CLUTTER_BACKEND,wayland"
                    "XDG_CURRENT_DESKTOP,Hyprland"
                    "XDG_SESSION_TYPE,wayland"
                    "XDG_SESSION_DESKTOP,Hyprland"

                    "QT_AUTO_SCREEN_SCALE_FACTOR,1"
                    "QT_QPA_PLATOFMR,wayland;xcb"
                    "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
                    "QT_QPA_PLATFORMTHEME,qt5ct"

                    "XCURSOR_SIZE,24"
                    "HYPRCURSOR_SIZE,24"

                    "GBM_BACKEND,nvidia-drm"
                    "__GLX_VENDOR_LIBRARY_NAME,nvidia"
                    "LIBVA_DRIVER_NAME,nvidia"
                ];

                monitor = [
                    "DP-2, 2560x1440@120, 0x0, 1"
                    "DP-1, 2560x1440@120, 2560x0, 1"
                    ", preferred, auto, auto"
                ];

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
                    fullscreen_opacity = 1.0;

                    drop_shadow = true;
                    shadow_range = 60;
                    shadow_offset = "0 5";
                    shadow_render_power = 4;
                    "col.shadow" = "rgba(00000099)";

                    blur = {
                        enabled = true;
                        size = 6;
                        passes = 3;
                        new_optimizations = true;
                    };
                };

                
                animations = {
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
                    new_status = "master";
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
                    "$mainMod, Q, exec, $terminal"
                    "$mainMod, C, killactive,"
                    "$mainMod, M, exit,"
                    "$mainMod, E, exec, $fileManager"
                    "$mainMod, F, togglefloating,"
                    "$mainMod, R, exec, $menu"
                    "$mainMod, P, pseudo,"
                    "$mainMod, J, togglesplit,"

                    "$mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

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

                    "$mainMod, grave, hyprexpo:expo, toggle"
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
