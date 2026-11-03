{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.defaultEditor == "neovim") {
    programs.neovim = {
      enable = true;

      plugins = with pkgs.vimPlugins; [
        everforest
        telescope-nvim
        nvim-treesitter.withAllGrammars
        lualine-nvim
        nvim-autopairs
        gitsigns-nvim
        nvim-tree-lua
        symbols-outline-nvim
        which-key-nvim
      ];

      initLua = ''
        -- 1. Set Space as the Leader Key BEFORE setting any keymaps
        vim.g.mapleader = " "
        vim.g.maplocalleader = ","

        -- Basic settings
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.expandtab = true
        vim.opt.termguicolors = true

        -- Everforest Theme Setup
        vim.g.everforest_background = 'hard'
        vim.g.everforest_enable_italic = 1
        vim.cmd([[colorscheme everforest]])

        -- Initialize helper plugins
        require("nvim-autopairs").setup {}
        require("lualine").setup {
          options = { theme = 'everforest' }
        }
        
        require("gitsigns").setup {
          signs = {
            add          = { text = '┃' },
            change       = { text = '┃' },
            delete       = { text = '_' },
            topdelete    = { text = '‾' },
            changedelete = { text = '~' },
          },
        }

        require("nvim-tree").setup {}
        require("symbols-outline").setup {}
        require("which-key").setup {}

        -- 2. Explicit Plugin Keybindings with Leader (<space>)
        vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { silent = true })
        vim.keymap.set('n', '<leader>s', '<cmd>SymbolsOutline<CR>', { silent = true })
        vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>', { silent = true })
        vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<CR>', { silent = true })
      '';
    };
  };
}
