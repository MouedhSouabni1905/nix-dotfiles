{config, pkgs, ...}:

let

keybindings = [
        "$mod, L, exec, librewolf"
        "$mod shift, Q, killactive"
        "$mod shift, S, exec, sh -c 'REGION=$(slurp) || exit; grim -g \"$REGION\" - | wl-copy && wl-paste > ~/Pictures/screenshots"
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
];

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
        ) 9)
     );
};

}
