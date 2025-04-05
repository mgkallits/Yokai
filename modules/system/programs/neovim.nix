{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [ inputs.nvf.nixosModules.default ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;

        # Basic settings
        options = {
          number = true;
          relativenumber = true;
          tabstop = 2;
          shiftwidth = 2;
          expandtab = true;
          cursorline = true;
          clipboard = "unnamedplus";
          mouse = "a";
          updatetime = 300;
          termguicolors = true;
        };

        globals = {
          mapleader = " ";
        };

        # Add transparent.nvim plugin
        extraPlugins = with pkgs.vimPlugins; {
          transparent = {
            package = transparent-nvim;
            # The setup must be a string containing Lua code
            setup = ''
              require('transparent').setup({
                enable = true,  -- Automatically enable transparency

                groups = {
                  "Normal", "NormalNC", "Comment", "Constant", "Special", "Identifier",
                  "Statement", "PreProc", "Type", "Underlined", "Todo", "String", "Function",
                  "Conditional", "Repeat", "Operator", "Structure", "LineNr", "NonText",
                  "SignColumn", "CursorLine", "CursorLineNr", "StatusLine", "StatusLineNC",
                  "EndOfBuffer"
                },
                extra_groups = {},
                exclude_groups = {},
              })
            '';
          };
        };

        # Additional transparency tweaks
        # luaConfigRC.transparency-tweaks = ''
        #   vim.opt.winblend = 10  -- Makes floating windows slightly transparent
        #   vim.opt.pumblend = 10  -- Makes popup menu slightly transparent
        # '';
      };
    };
  };
}
