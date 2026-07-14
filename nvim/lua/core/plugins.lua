local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable", -- latest stable release
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {'nvim-treesitter/nvim-treesitter'},
{
    'rebelot/kanagawa.nvim',
    config = function()
        require('kanagawa').setup({
            transparent = true, -- Включает прозрачность фона
            
            -- Настройка цветов для прозрачности
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none", -- Убираем фон для LineNr, SignColumn, FoldColumn
                        }
                    },
                    -- Если используете тему wave (по умолчанию)
                    wave = {
                        ui = {
                            float = {
                                bg = "none", -- Прозрачные плавающие окна
                            },
                        },
                    },
                },
            },
            
            -- Переопределение хайлайтов для прозрачности
            overrides = function(colors)
                local theme = colors.theme
                return {
                    -- Делаем прозрачными стандартные элементы
                    Normal = { bg = "none" },
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle = { bg = "none" },
                    
                    -- Прозрачность для статусной строки
                    StatusLine = { bg = "none" },
                    StatusLineNC = { bg = "none" },
                    
                    -- Прозрачность для вкладок (tabline)
                    TabLine = { bg = "none" },
                    TabLineFill = { bg = "none" },
                    TabLineSel = { bg = "none" },
                    
                    -- Прозрачность для barbar.nvim вкладок
                    BufferTabpageFill = { bg = "none" },
                    BufferCurrent = { bg = "none" },
                    BufferCurrentMod = { bg = "none" },
                    BufferCurrentSign = { bg = "none" },
                    BufferCurrentIcon = { bg = "none" },
                    BufferCurrentTarget = { bg = "none" },
                    
                    BufferInactive = { bg = "none" },
                    BufferInactiveMod = { bg = "none" },
                    BufferInactiveSign = { bg = "none" },
                    BufferInactiveIcon = { bg = "none" },
                    BufferInactiveTarget = { bg = "none" },
                    
                    -- Для NeoTree
                    NeoTreeNormal = { bg = "none" },
                    NeoTreeNormalNC = { bg = "none" },
                    
                    -- Для Telescope
                    TelescopeNormal = { bg = "none" },
                    TelescopeBorder = { bg = "none" },
                    TelescopePromptNormal = { bg = "none" },
                    
                    -- Для Lualine
                    LualineNormal = { bg = "none" },
                    LualineInactive = { bg = "none" },
                    
                    -- Для автодополнения (cmp)
                    Pmenu = { bg = "none" },
                    PmenuSel = { bg = "none" },
                    PmenuSbar = { bg = "none" },
                    PmenuThumb = { bg = "none" },
                    
                    -- Для боковой панели
                    WinBar = { bg = "none" },
                    WinBarNC = { bg = "none" },
                }
            end,
        })
        
        -- Применяем тему
        vim.cmd('colorscheme kanagawa')
    end,
},
{
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
        require("toggleterm").setup({
            size = 15,
            open_mapping = [[<C-\>]],
            direction = "horizontal",
            start_in_insert = true,
            persist_mode = true,
            close_on_exit = false,
        })
    end,
},

-- В вашем plugins.lua
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'}, 
    {'hrsh7th/cmp-buffer'}, 
    {'hrsh7th/cmp-path'},
    { "tiagovla/scope.nvim" },
    {'hrsh7th/cmp-cmdline'},
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/vim-vsnip'},
    {
    "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons",
          "MunifTanjim/nui.nvim",
        }
    },
    {
      'romgrk/barbar.nvim',
      dependencies = {
        'lewis6991/gitsigns.nvim',
        'nvim-tree/nvim-web-devicons',
      },
      -- Убираем init, который отключает автозагрузку
      -- init = function() vim.g.barbar_auto_setup = false end,
      opts = {
        animation = false,
        insert_at_start = true,
        
        icons = {
          button = '',
          modified = {
            button = '',
          },
          filetype = {
            enabled = true,
          },
        separator = {left = '', right = ''},

        -- If true, add an additional separator at the end of the buffer list
        separator_at_end = false,
            },
          },
      version = '^1.0.0',
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        opts = {
            handlers = {},
            ensure_installed = {
                "codelldb",
            },
        },
    },
    {"mfussenegger/nvim-dap-python"},
    {'nvim-tree/nvim-web-devicons'},
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
    {"williamboman/mason.nvim", build = ":MasonUpdate"},
    {
        'numToStr/Comment.nvim',
    },
    {'theHamsta/nvim-dap-virtual-text'},
    {'nvim-telescope/telescope-dap.nvim'},
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "julianolf/nvim-dap-lldb"
        },
    },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} },
    -- Установка через lazy.nvim
    -- VimTeX для работы с LaTeX
    {
        "lervag/vimtex",
        lazy = false, -- загружаем сразу
        init = function()
            -- Настройки VimTeX
            vim.g.vimtex_view_method = "zathura"  -- или "general", "okular", "evince"
            vim.g.vimtex_compiler_method = "latexmk"
            vim.g.vimtex_quickfix_mode = 0
            vim.g.vimtex_compiler_latexmk = {
                options = {
                    '-pdf',
                    '-shell-escape',
                    '-verbose',
                    '-file-line-error',
                    '-synctex=1',
                    '-interaction=nonstopmode',
                },
            }
        end,
        config = function()
            -- Дополнительные настройки VimTeX
            vim.api.nvim_create_augroup("vimtex_custom", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                pattern = "tex",
                group = "vimtex_custom",
                callback = function()
                    -- Клавиши для VimTeX
                    vim.keymap.set("n", "<leader>lc", "<plug>(vimtex-compile)", { buffer = true, desc = "Compile LaTeX" })
                    vim.keymap.set("n", "<leader>lv", "<plug>(vimtex-view)", { buffer = true, desc = "View PDF" })
                    vim.keymap.set("n", "<leader>ll", "<plug>(vimtex-compile)", { buffer = true, desc = "Compile LaTeX" })
                    vim.keymap.set("n", "<leader>lk", "<plug>(vimtex-stop)", { buffer = true, desc = "Stop compilation" })
                    vim.keymap.set("n", "<leader>le", "<plug>(vimtex-errors)", { buffer = true, desc = "Show errors" })
                    vim.keymap.set("n", "<leader>lt", "<plug>(vimtex-toc-toggle)", { buffer = true, desc = "Toggle TOC" })
                    
                    -- Дополнительные удобства для LaTeX
                    vim.keymap.set("i", "$$", "$$<Left>", { buffer = true, desc = "Insert $$" })
                    vim.keymap.set("i", "``", "``<Left>", { buffer = true, desc = "Insert ``" })
                end,
            })
        end
    },

    -- Сниппеты для LaTeX (опционально)
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      build = "cd app && yarn install",
      init = function()
        vim.g.mkdp_filetypes = { "markdown" }
      end,
      ft = { "markdown" },
    },
})

