{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "lubbaragaki";
  home.homeDirectory = "/home/lubbaragaki";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  
  
  
  xdg = {
  portal = {
        enable = true;
        extraPortals = with pkgs; [
                xdg-desktop-portal-hyprland
                xdg-desktop-portal-gtk
        ];
  };
  mime.enable = true;
  desktopEntries.phototonic = {
  name = "Phototonic";
  exec = "${pkgs.phototonic}/bin/phototonic";
  };
  mimeApps = {
    enable = true;
    defaultApplications = {
        "text/html" = "librewolf.desktop";
        "x-scheme-handler/http" = "librewolf.desktop";
        "x-scheme-handler/https" = "librewolf.desktop";
        "x-scheme-handler/about" = "librewolf.desktop";
        "x-scheme-handler/unknown" = "librewolf.desktop";
        "application/pdf" = "librewolf.desktop";
        "text/xml" = "nvim.desktop";
        "text/csv" = "nvim.desktop";
        "text/plain" = "nvim.desktop";
        "text/javascript" = "nvim.desktop";
        "text/markdown" = "nvim.desktop";
        "application/json" = "nvim.desktop";
        "video/mp4" = "vlc.desktop";
        "video/x-matroska" = "vlc.desktop";
        "image/png" = "phototonic.desktop";
        "image/jpeg" = "phototonic.desktop";
        "image/webp" = "phototonic.desktop";
        "image/svg" = "phototonic.desktop";
        "inode/directory" = "org.kde.dolphin.desktop";
    };
  };
};

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/lubbaragaki/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };
  
  wayland.windowManager.hyprland.enable = true;
  
  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";
    bind =
      [
        "$mod, L, exec, librewolf"
        "$mod shift, Q, killactive"
        "$mod shift, S, exec, sh -c 'REGION=$(slurp) || exit; grim -g \"$REGION\" - | wl-copy && wl-paste > ~/Pictures/screenshots/Screenshot-$(date +%F_%T).png'"
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
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
  };

  programs.zellij.enable = true;
  

  programs.zsh.enable = true;
  programs.zsh.autosuggestion.enable = true;
  programs.zsh.enableVteIntegration = true;
  programs.zsh.shellAliases = {
	ll = "ls -l";
  	".." = "cd ..";
	la = "ls -a";
  };
  programs.zsh.oh-my-zsh.enable = true;
  programs.zsh.oh-my-zsh.plugins = [
	"colored-man-pages"
	"colorize"
	"copybuffer"
	"copyfile"
	"extract"
	"jsontools"
	"rake-fast"
	"safe-paste"
	"sudo"
  ];
  programs.zsh.oh-my-zsh.theme = "candy";
  programs.zellij.enableZshIntegration = true;
   

          # Let Home Manager install and manage itself.
          programs.home-manager.enable = true;
        }
