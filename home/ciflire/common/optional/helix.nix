{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  # packages needed to build forge plugin
  home.packages = with pkgs; [
    steel
  ];

  # stylix.targets.helix.enable = true;
  programs.helix = {
    package = inputs.helix.packages.${pkgs.stdenv.hostPlatform.system}.helix.overrideAttrs (oa: {
      cargoBuildFeatures = (oa.cargoBuildFeatures or [ ]) ++ [ "steel" ];
    });
    # package = pkgs.helix;
    enable = true;
    settings = lib.mkForce {
      theme = "gruvbox_dark_hard";

      editor = {
        lsp = {
          display-inlay-hints = true;
        };
        inline-diagnostics = {
          cursor-line = "hint";
          other-lines = "error";
        };
        line-number = "relative";
        mouse = true;
        cursorline = true;
        cursorcolumn = true;
        auto-save = true;
        # completion-replace = true;
        bufferline = "multiple";
        color-modes = true;
        completion-trigger-len = 1;
        preview-completion-insert = false;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        statusline = {
          left = [
            "mode"
            "spinner"
            "diagnostics"
          ];
          center = [ "file-name" ];
          right = [
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];
          separator = "│";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
        file-picker = {
          hidden = false;
          git-ignore = true;
          follow-symlinks = true;
        };
        soft-wrap = {
          enable = true;
        };
      };
      keys = {
        normal = {
          C-A-j = [
            "ensure_selections_forward"
            "extend_to_line_bounds"
            "extend_char_right"
            "extend_char_left"
            "delete_selection"
            "add_newline_below"
            "move_line_down"
            "replace_with_yanked"
          ];
          C-A-k = [
            "ensure_selections_forward"
            "extend_to_line_bounds"
            "extend_char_right"
            "extend_char_left"
            "delete_selection"
            "move_line_up"
            "add_newline_above"
            "move_line_up"
            "replace_with_yanked"
          ];
          "space" = {
            h = "signature_help";
          };
          X = "extend_line_above";
          up = "no_op";
          down = "no_op";
          left = "no_op";
          right = "no_op";
          C-p = '':lsp-workspace-command tinymist.pinMain "%sh{pwd}/%{buffer_name}"'';
        };
        insert = {
          C-backspace = "delete_word_backward";
        };
      };
    };
  };
}
