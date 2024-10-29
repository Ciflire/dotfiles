{
  inputs,
  lib,
  pkgs,
  ...
}:
{
  stylix.targets.helix.enable = true;
  programs.helix = {
    package = inputs.helix.packages.${pkgs.system}.helix;
    enable = true;
    languages = {
      language-server = {
        tinymist = {
          command = "${pkgs.tinymist}/bin/tinymist/";
        };
        ruff.command = "${pkgs.ruff}/bin/ruff";
        ruff.args = [ "server" ];
        ruff.config = {
          settings.lineLength = 80;
          settings.format.preview = true;
        };
        pylyzer.command = "${pkgs.pylyzer}/bin/pylyzer";
        pylyzer.args = [ "--server" ];
        # typst-lsp = {
        #   command = "${pkgs.typst-lsp}/bin/typst-lsp";
        # };
      };
      languages = [
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
        }
        {
          name = "typst";

          scope = "source.typst";
          injection-regex = "typ(st)?";
          file-types = [
            "typst"
            "typ"
          ];
          comment-token = "//";
          block-comment-tokens = {
            start = "/*";
            end = "*/";
          };
          language-servers = [
            "typst-lsp"
            "tinymist"
          ];
          indent = {
            tab-width = 2;
            unit = "  ";
          };
          auto-format = true;
          formatter.command = "${pkgs.typstyle}/bin/typstyle";
        }
        {
          name = "markdown";
          auto-format = true;
          formatter.command = "dprint";
          formatter.args = [
            "fmt"
            "--stdin"
            "md"
          ];
        }
        {
          name = "python";
          language-servers = [
            "pylyzer"
            "ruff"
          ];
          auto-format = true;
          formatter.command = "{pkgs.ruff}/bin/ruff";
          formatter.args = ["format" "-"];
        }
      ];
    };
    settings = lib.mkForce {
      theme = "stylix";

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

        };
        insert = {
          C-backspace = "delete_word_backward";
        };
      };
    };
  };
}
