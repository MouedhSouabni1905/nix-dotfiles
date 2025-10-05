{config, pkgs, ...}:

let

keybindings = [
        "$mod shift, Q, killactive"
        "$mod shift, S, exec, sh -c 'REGION=`slurp` || exit; grim -g \"$REGION\" - | wl-copy && wl-paste > ~/Pictures/screenshots/Screenshot-`date +%F_%T`.png'"
        "$mod, return, exec, alacritty"
        "$mod, space, togglefloating"
        "$mod, F, fullscreen"
        "$mod, up, movefocus, u"
        "$mod, right, movefocus, r"
        "$mod, down, movefocus, d"
        "$mod, left, movefocus, l"
        "$mod shift, up, movewindow, u"
        "$mod shift, right, movewindow, r"
        "$mod shift, down, movewindow, d"
        "$mod shift, left, movewindow, l"
        "$mod, D, exec, rofi -show drun"
        "$mod, V, exec, pamixer -i 5"
        "$mod shift, V, exec, pamixer -d 5"
        "$mod, k, resizeactive, 0 -10" # minimize vertically
        "$mod, l, resizeactive, 10 0" # maximize horiontally
        "$mod, j, resizeactive, 0 10" # maximize vertically
        "$mod, h, resizeactive, -10 0" # minimize horizontally
];

colorscheme = {
        primarycolor = "472499";
};

in

{


wayland.windowManager.hyprland.enable = true;

wayland.windowManager.hyprland.settings = {
        "$mod" = "SUPER";
        bind = keybindings ++ (
                # workspaces
                # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
                builtins.concatLists (builtins.genList (i:
                let ws = i + 1;
                in [
                        "$mod, code:1${toString i}, workspace, ${toString ws}"
                        "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
                        ]
                ) 9) );
        general = {
                border_size = "2";
                gaps_in = "2";
                gaps_out = "35,2,2,2";
                float_gaps = "35 2 2 2";
                "col.active_border" = "rgb(${colorscheme.primarycolor})";
                resize_on_border = true;
                snap.enabled = true;
        };
        decoration = {
                rounding = 3;
                # inactive_opacity = 0.7;
                # blur.size = 15;
                shadow.range = 15;
                shadow.color = "rgb(${colorscheme.primarycolor})";
                shadow.color_inactive = "rgba(ee1a1a1a)";
        };
        animations = {
                enabled = true;
        };
        misc.font-family = "noto";
        cursor.inactive_timeout = 15.0;
        debug.suppress_errors = true;


};

# a few programs to enable
programs.asciinema.enable = true;

# hyprland configuration services / options
services.hyprsunset.enable = true;
services.hyprsunset.settings = {
        max-gamma = 150;

        profile = [
                {
                        time = "7:30";
                        identity = true;
                }
                {
                        time = "21:00";
                        temperature = 5000;
                        gamma = 0.8;
                }
        ];
};
wayland.windowManager.hyprland.extraConfig = '' 
        
''; # add extra lines to the hyprland config file

# quickshell configuration
programs.quickshell.enable = true;
# programs.quickshell.activeConfig = ;

}
