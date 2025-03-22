{ pkgs, ... }:

{

  # Global Configuration
  programs.neovim = {
    enable = true;
    # defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    configure = {
      customRC = ''
        set number
        set relativenumber
        set tabstop=2
        set shiftwidth=2
        set expandtab
        set cursorline
        set clipboard+=unnamedplus  " Use system clipboard
        set mouse=a  " Enable mouse support
        set updatetime=300  " Faster cursor hold
        " set list

        " Theme and appearance
        syntax enable
        " colorscheme gruvbox
        set termguicolors    " True colors support for better themes

        " Leader key setup
        let mapleader=" "    " Set leader key to space
      '';

      # Plugins section
      packages.myVimPackage = with pkgs.vimPlugins; {
        start = [
          # gruvbox               # Add the Gruvbox colorscheme here
          ctrlp
          # telescope-nvim
          # nvim-treesitter
          # nvim-lspconfig
          # cmp-nvim-lsp
          # luasnip
          # vimtex
          # gitsigns-nvim
          # lualine-nvim
          # nvim-tree-lua
        ];
      };
    };
  };
}