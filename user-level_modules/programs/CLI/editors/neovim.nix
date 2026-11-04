{ config, lib, pkgs, ... }: {
  config = lib.mkIf (config.myUserControlPanel.defaultEditor == "neovim") {
    programs.neovim = {
      enable = true;
      viAlias = true;
      vimAlias = true;

      plugins = with pkgs.vimPlugins; [
        everforest
        neo-tree-nvim
        nui-nvim
        plenary-nvim
        nvim-web-devicons
        aerial-nvim
        lualine-nvim
        nvim-dap
        nvim-dap-ui
        nvim-lspconfig
        nvim-treesitter.withAllGrammars
      ];

      initLua = ''
        -- --- Leader Key Setup ---
        vim.g.mapleader = " "
        vim.g.maplocalleader = " "

        -- --- Everforest Soft Theme & UI Settings ---
        vim.opt.termguicolors = true
        vim.g.everforest_background = "soft"
        vim.g.everforest_enable_italic = 1
        vim.cmd([[colorscheme everforest]])

        vim.opt.number = true
        vim.opt.relativenumber = true
        vim.opt.signcolumn = "yes"
        vim.opt.expandtab = true
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
        vim.opt.cursorline = true

        -- --- Neo-tree Auto-Open on Startup ---
        vim.api.nvim_create_autocmd("VimEnter", {
          callback = function()
            require("neo-tree.command").execute({ action = "show" })
            vim.cmd("wincmd p")
          end,
        })

        -- --- File Explorer & Outline Keymaps ---
        vim.keymap.set('n', '<leader>e', '<cmd>Neotree toggle<CR>', { silent = true })

        require("aerial").setup({
          backends = { "lsp", "treesitter", "markdown", "man" },
          layout = {
            default_direction = "right",
            min_width = 30,
          },
        })
        vim.keymap.set('n', '<leader>o', '<cmd>AerialToggle!<CR>', { silent = true })

        -- --- Statusline ---
        require('lualine').setup {
          options = {
            theme = 'everforest',
            section_separators = { left = '', right = '' },
            component_separators = { left = '', right = '' },
          }
        }

        -- --- DAP Debugging Setup (C/C++, Rust & Python) ---
        local dap = require("dap")
        local dapui = require("dapui")
        dapui.setup()

        -- LLDB Adapter for C/C++/Rust
        dap.adapters.lldb = {
          type = 'executable',
          command = 'lldb-dap',
          name = 'lldb'
        }

        dap.configurations.cpp = {
          {
            name = 'Compile & Launch C/C++',
            type = 'lldb',
            request = 'launch',
            program = function()
              local file = vim.fn.expand('%:p')
              local exe = vim.fn.expand('%:p:r')
              local cmd = string.format('gcc -g %s -o %s', vim.fn.shellescape(file), vim.fn.shellescape(exe))
              local result = vim.fn.system(cmd)
              if vim.v.shell_error ~= 0 then
                vim.api.nvim_echo({{ 'Compilation failed:\n' .. result, 'ErrorMsg' }}, true, {})
                return nil
              end
              return exe
            end,
            cwd = vim.fn.getcwd(),
            stopOnEntry = false,
            args = {},
          },
        }
        dap.configurations.c = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp

        -- Python Adapter via debugpy
        dap.adapters.python = {
          type = 'executable',
          command = 'python3',
          args = { '-m', 'debugpy.adapter' },
        }

        dap.configurations.python = {
          {
            type = 'python',
            request = 'launch',
            name = 'Launch current python file',
            program = "''${file}",
            pythonPath = function()
              return 'python3'
            end,
          },
        }

        dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
        dap.listeners.after.event_terminated["dapui_config"] = function() dapui.close() end
        dap.listeners.after.event_exited["dapui_config"] = function() dapui.close() end

        vim.keymap.set('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>', { silent = true })
        vim.keymap.set('n', '<leader>dc', '<cmd>DapContinue<CR>', { silent = true })
        vim.keymap.set('n', '<leader>di', '<cmd>DapStepInto<CR>', { silent = true })
        vim.keymap.set('n', '<leader>do', '<cmd>DapStepOver<CR>', { silent = true })

        -- --- Quick Code Runner Keymap (<leader>r) ---
        vim.keymap.set('n', '<leader>r', function()
          local ft = vim.bo.filetype
          if ft == 'rust' then
            vim.cmd('split | terminal cargo run')
          elseif ft == 'cpp' or ft == 'c' then
            vim.cmd('split | terminal gcc % -o %< && ./%<')
          elseif ft == 'python' then
            vim.cmd('split | terminal python3 %')
          elseif ft == 'go' then
            vim.cmd('split | terminal go run %')
          else
            print('No runner configured for filetype: ' .. ft)
          end
        end, { silent = true })

        -- --- Native LSP Config & Root Markers ---
        vim.lsp.config('*', {
          root_markers = { '.git', 'flake.nix', 'Cargo.toml', 'go.mod', 'pyproject.toml' },
        })

        vim.lsp.enable('nil_ls')
        vim.lsp.enable('rust_analyzer')
        vim.lsp.enable('gopls')
        vim.lsp.enable('pyright')
        vim.lsp.enable('clangd')
      '';
    };
  };
}
