{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.defaultEditor == "neovim") {
    programs.neovim = {
      enable = true;

      plugins = with pkgs.vimPlugins; [
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

        -- CRT RGB Phosphor Theme & Highlights
        vim.cmd([[
          colorscheme habamax
          highlight Normal guibg=#121212 guifg=#d0d0d0
          highlight StatusLine guibg=#1f1f1f guifg=#00ff66
          highlight SignColumn guibg=#121212
          highlight TelescopeBorder guifg=#00ccff
          highlight NvimTreeNormal guibg=#121212
        ]])

        -- Initialize helper plugins
        require("nvim-autopairs").setup {}
        require("lualine").setup {
          options = { theme = 'auto' }
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

        -- 2. Plugin Keybindings with Leader (<space>)
        vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { silent = true })
        vim.keymap.set('n', '<leader>s', '<cmd>SymbolsOutline<CR>', { silent = true })
        vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>', { silent = true })
        vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<CR>', { silent = true })
      '';
    };
  };
}
