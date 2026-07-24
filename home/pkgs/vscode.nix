{ pkgs, lib, ... }:
let
  vscodeSettings = builtins.toJSON {
    "nix.enableLanguageServer" = true;
    "nix.serverPath" = "nixd";
    "nix.serverSettings" = {
      nixd = {
        formatting = {
          command = [ "nixfmt" ];
        };
      };
    };

    "clangd.path" = "clangd";
    "clangd.arguments" = [
      "--background-index"
      "--clang-tidy"
      "--completion-style=detailed"
    ];

    "rust-analyzer.server.path" = "rust-analyzer";
    "rust-analyzer.check.command" = "clippy";

    "editor.stickyScroll.enabled" = false;
    "terminal.integrated.stickyScroll.enabled" = false;
  };
in
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode.fhsWithPackages (
      ps: with ps; [
        llvmPackages.clang-tools
        nixd
        nixfmt-rfc-style
        rust-analyzer
        cargo
        rustc
        gcc
        pkg-config
      ]
    );

    profiles.default = {
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        llvm-vs-code-extensions.vscode-clangd
        rust-lang.rust-analyzer
      ];
    };
  };

  # Writable copy instead of read-only Nix store symlink
  home.activation.vscodeSettings = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    settings_file="$HOME/.config/Code/User/settings.json"
    if [ ! -f "$settings_file" ] || [ -L "$settings_file" ]; then
      mkdir -p "$(dirname "$settings_file")"
      rm -f "$settings_file"
      echo '${vscodeSettings}' > "$settings_file"
    fi
  '';
}
