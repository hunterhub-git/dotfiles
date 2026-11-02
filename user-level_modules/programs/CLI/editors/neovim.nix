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
        vim.g.mapleader = ","
        vim.g.maplocalleader = ","

        -- Basic settings
        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.tabstop = 2
        vim.opt.shiftwidth = 2
        vim.opt.expandtab = true
        vim.opt.termguicolors = true

        -- Initialize helper plugins
        require("nvim-autopairs").setup {}
        require("lualine").setup {
          options = { theme = 'auto' }
        }
        
        require('gitsigns').setup {
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
        -- <space> + e : Toggle File Explorer Tree
        -- <space> + s : Toggle Function/Symbol Outline Tree
        -- <space> + f : Find Files (Telescope)
        -- <space> + g : Live Grep Text Search (Telescope)
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', { silent = true })
        vim.keymap.set('n', '<leader>s', ':SymbolsOutline<CR>', { silent = true })
        vim.keymap.set('n', '<leader>f', '<cmd>Telescope find_files<CR>', { silent = true })
        vim.keymap.set('n', '<leader>g', '<cmd>Telescope live_grep<CR>', { silent = true })

        -- 3. Maximum Vibrancy Aesthetic Overrides (Orange, Blue, Pink, White, Gold)
        vim.api.nvim_set_hl(0, "Normal", { bg = "#0B0F15", fg = "#ECF4FF" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "#0B0F15", fg = "#ECF4FF" })
        
        -- High visibility line numbers & comments (Skipper Gold & Bright Slate)
        vim.api.nvim_set_hl(0, "LineNr", { fg = "#475569", bold = true })
        vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#F59E0B", bold = true })
        vim.api.nvim_set_hl(0, "Visual", { bg = "#1E293B" })
        vim.api.nvim_set_hl(0, "Comment", { fg = "#38BDF8", italic = true, bold = true }) -- Glowing Ice Blue comments
        
        -- Enhanced GitSigns Colors (Vibrant Gold & Tech Blue)
        vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#22C55E", bold = true })
        vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#F59E0B", bold = true })
        vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#FF4B45", bold = true })

        -- Standard Syntax Groups for Maximum Color Punch
        vim.api.nvim_set_hl(0, "Constant", { fg = "#0EA5E9", bold = true })
        vim.api.nvim_set_hl(0, "String", { fg = "#22C55E", bold = true }) -- Rich Rico Green for strings
        vim.api.nvim_set_hl(0, "Character", { fg = "#22C55E", bold = true })
        vim.api.nvim_set_hl(0, "Function", { fg = "#F59E0B", bold = true }) -- Skipper Gold functions
        vim.api.nvim_set_hl(0, "Statement", { fg = "#D946EF", bold = true }) -- Bold Magenta keywords
        vim.api.nvim_set_hl(0, "Type", { fg = "#0EA5E9", bold = true })
        vim.api.nvim_set_hl(0, "Special", { fg = "#F59E0B", bold = true })

        -- Treesitter Specific Color Overrides (Ensuring zero dull white text)
        vim.api.nvim_set_hl(0, "@variable", { fg = "#ECF4FF" })
        vim.api.nvim_set_hl(0, "@property", { fg = "#0EA5E9", bold = true }) -- Vibrant Blue properties
        vim.api.nvim_set_hl(0, "@parameter", { fg = "#F59E0B" }) -- Gold parameters
        vim.api.nvim_set_hl(0, "@keyword", { fg = "#D946EF", bold = true }) -- Pink keywords
        vim.api.nvim_set_hl(0, "@function", { fg = "#F59E0B", bold = true }) -- Gold functions
        vim.api.nvim_set_hl(0, "@string", { fg = "#22C55E", bold = true }) -- Green strings
        vim.api.nvim_set_hl(0, "@type", { fg = "#0EA5E9", bold = true })
        vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#F59E0B", bold = true }) -- Gold brackets
        vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = "#D946EF", bold = true }) -- Pink delimiters
      '';
    };
  };
}
