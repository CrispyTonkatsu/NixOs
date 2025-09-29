{ ... }: {
  wayland.windowManager.hyprland = {
    enable = true;

    extraConfig = ''
      env = HYPRCURSOR_THEME, rose-pine-hyprcursor
      env = HYPRCURSOR_SIZE, 30

      env = AQ_DRM_DEVICES, /dev/dri/card1:/dev/dri/card0

      env = GDK_SCALE, 2
      env = XCURSOR_SIZE, 2
    '';

    settings = {
      decoration.blur =
        {
          enabled = false;
        };

      "$mod" = "SUPER";
      "$mod_alt" = "SUPER";

      monitor = [
        "eDP-1, preferred, auto, 2"
        "HDMI-A-3, preferred, auto-left, 1"
        "DP-1, preferred, auto-left, 2"
        "DP-4, preferred, auto, 2"
        "DP-5, preferred, auto, 2"
        "DP-6, preferred, auto, 2"
        "DP-7, preferred, auto, 2"
      ];

      exec-once = [
        "waybar"
        "pa-notify"
        "wpaperd"
      ];

      general = {
        border_size = 2;
        "col.active_border" = "rgb(944956) rgb(c0c5d4) 45deg";
        gaps_in = 2;
        gaps_out = 2;
      };

      input = {
        # NOTE: This is disabled given Fcitx5 is now handling the languages, we need to find a way to get the caps escape behavior there

        kb_layout = "us,us";
        kb_variant = ",intl";
        kb_options = "caps:swapescape, grp:alt_shift_toggle";

        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.2;
        };
      };

      decoration = {
        rounding = 3;
      };

      animation = [
        "workspaces, 1, 3, default, slidevert"
      ];


      workspace = [
        # TODO: Consider adding better named workspaces to have more
        # specific tasks (something like a quick panel or sth nice like that)
      ];

      bind = [
        # Locking the desktop
        "$mod, DELETE, exit"

        # Game Mode
        "$mod, F1, exec, ~/.nixos/home-modules/scripts/gamemode.sh"

        # Window management
        "$mod, Q, killactive"
        "$mod, M, fullscreen"
        "$mod, F, togglefloating"
        "$mod, C, centerwindow"

        "$mod CTRL, H, resizeactive, -20 0"
        "$mod CTRL, L, resizeactive, 20 0"

        # Focus movement
        "$mod, H, movefocus ,l"
        "$mod, L, movefocus ,r"
        "$mod, J, movefocus ,d"
        "$mod, K, movefocus ,u"
        "$mod CTRL, J, workspace, r+1"
        "$mod CTRL, K, workspace, r-1"

        # Window movement
        "$mod SHIFT, L, movewindow, r"
        "$mod SHIFT, H, movewindow, l"
        "$mod SHIFT, J, movewindow, d"
        "$mod SHIFT, K, movewindow, u"

        "$mod CTRL SHIFT, J, movetoworkspace, r+1"
        "$mod CTRL SHIFT, K, movetoworkspace, r-1"
        "ALT, TAB, workspace, previous"

        # Monitor management
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

        # Media Keys
        ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # Requires playerctl
        ", XF86AudioPlay, exec, playerctl play-pause"

        # Executing programs
        "$mod, SPACE, exec, rofi -show combi -modes combi -combi-modes \"window,drun\""
        "$mod, RETURN, exec, kitty"
        "$mod SHIFT, B, exec, rofi-bluetooth"
        "$mod, F6, exec, hyprshot -m window -o ~/images/screenshots/"
      ]
      ++ (
        # workspaces bindings
        # binds $mod + SHIFT to move between workspaces
        builtins.concatLists (builtins.genList
          (i:
            let ws = i + 1;
            in [
              "$mod_alt, code:1${toString i}, workspace, m~${toString ws}"
              "$mod_alt SHIFT, code:1${toString i}, movetoworkspace, m~${toString ws}"
            ]
          )
          9)
      );

      bindm = [
        "SUPER, mouse:272, movewindow"
        "SUPER, mouse:273, resizewindow"
      ];

      xwayland = {
        force_zero_scaling = true;
      };
    };
  };
}
