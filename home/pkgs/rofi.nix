{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [ pkgs.rofi ];

  xdg.configFile."rofi/config.rasi".text = ''
    * {
        font:   "Iosevka Nerd Font Mono 11";

        bg-dark:          #272e33;
        bg-alt:           #2e343a;
        bg-brighter:      #3c4841;
        fg-0:             #d3c6aa;
        accent-color:     #a7c080;
        urgent-color:     #e67e80;

        background-color: transparent;
        text-color:       @fg-0;
    }

    window {
        location:         center;
        anchor:           center;
        transparency:     "real";
        width:            30%;
        padding:          6px;
        border:           0px;
        border-radius:    3px;

        background-color: transparent;
        spacing:          0;
        children:         [ mainbox ];
        orientation:      horizontal;
    }

    mainbox {
        spacing:  0;
        children: [ inputbar, message, listview ];
    }

    message {
        padding:          4px;
        border-color:     @accent-color;
        border:           0px 2px 2px 2px;
        background-color: @bg-dark;
        text-color:       @accent-color;
    }

    inputbar {
        padding:          8px 12px;
        background-color: @bg-alt;
        text-color:       @fg-0;

        border:           1px;
        border-radius:    3px 3px 0px 0px;
        border-color:     @bg-brighter;
        children:         [ prompt, entry, case-indicator ];
    }

    entry, prompt, case-indicator {
        text-color:       inherit;
    }

    prompt {
        margin:           0px 0.8em 0em 0em;
    }

    listview {
        padding:          5px;
        border-radius:    0px 0px 3px 3px;
        border-color:     @bg-brighter;
        border:           0px 1px 1px 1px;
        background-color: @bg-dark;
        dynamic:          false;
        lines:            8;
    }

    element {
        padding:          4px 6px;
        border-radius:    3px;
        children:         [ element-icon, element-text ];
        spacing:          8px;
    }

    element-icon {
        size:             1em;
        background-color: transparent;
        text-color:       inherit;
    }

    element normal.normal,
    element alternate.normal,
    element normal.active,
    element alternate.active,
    element normal.urgent,
    element alternate.urgent {
        background-color: transparent;
    }

    element-text normal.normal,
    element-text alternate.normal,
    element-text normal.active,
    element-text alternate.active,
    element-text normal.urgent,
    element-text alternate.urgent {
        text-color:       @fg-0;
    }

    element selected.normal,
    element selected.active,
    element selected.urgent {
        background-color: @accent-color;
    }

    element-text selected.normal,
    element-text selected.active,
    element-text selected.urgent {
        text-color:       @bg-dark;
    }

    element-text {
        background-color: transparent;
        text-color:       inherit;
        vertical-align:   0.5;
    }

    button {
        padding:          4px;
        text-color:       @fg-0;
        horizontal-align: 0.5;

        border:           2px 0px 2px 2px;
        border-radius:    4px 0px 0px 4px;
        border-color:     @bg-brighter;
    }

    button selected normal {
        border:           2px 0px 2px 2px;
        border-color:     @accent-color;
    }
  '';
}
