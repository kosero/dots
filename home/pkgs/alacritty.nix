{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.alacritty = {
    enable = true;

    settings = {
      general = {
        live_config_reload = true;
        # working_directory "None" -> omit, alacritty defaults to shell's cwd
      };

      env = {
        TERM = "xterm-256color";
        WINIT_X11_SCALE_FACTOR = "1.0";
      };

      window = {
        dimensions = {
          columns = 100;
          lines = 30;
        };
        dynamic_padding = true;
        padding = {
          x = 12;
          y = 12;
        };
        decorations = "Full";
        opacity = 1.0;
        title = "Alacritty@NixOS";
        class = {
          instance = "Alacritty";
          general = "Alacritty";
        };
        decorations_theme_variant = "Dark";
      };

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      font = {
        normal = {
          family = "Iosevka Nerd Font Mono";
          style = "Regular";
        };
        bold = {
          family = "Iosevka Nerd Font Mono";
          style = "Bold";
        };
        italic = {
          family = "Iosevka Nerd Font Mono";
          style = "Italic";
        };
        bold_italic = {
          family = "Iosevka Nerd Font Mono";
          style = "Bold Italic";
        };
        size = 12.0;
      };

      # Everforest Dark Hard
      colors = {
        draw_bold_text_with_bright_colors = true;

        primary = {
          background = "#272e33";
          foreground = "#d3c6aa";
        };

        normal = {
          black = "#414b50";
          red = "#e67e80";
          green = "#a7c080";
          yellow = "#dbbc7f";
          blue = "#7fbbb3";
          magenta = "#d699b6";
          cyan = "#83c092";
          white = "#d3c6aa";
        };

        bright = {
          black = "#414b50";
          red = "#e67e80";
          green = "#a7c080";
          yellow = "#dbbc7f";
          blue = "#7fbbb3";
          magenta = "#d699b6";
          cyan = "#83c092";
          white = "#d3c6aa";
        };

        selection = {
          background = "#4c3743";
          text = "#d3c6aa";
        };

        search = {
          matches = {
            background = "#a7c080";
            foreground = "#272e33";
          };
          focused_match = {
            background = "#e67e80";
            foreground = "#272e33";
          };
        };
      };

      selection = {
        semantic_escape_chars = ",│`|:\"' ()[]{}<>\t";
        save_to_clipboard = true;
      };

      cursor = {
        style = {
          shape = "Beam";
          blinking = "Off";
        };
        unfocused_hollow = true;
        thickness = 0.15;
      };
    };
  };
}
