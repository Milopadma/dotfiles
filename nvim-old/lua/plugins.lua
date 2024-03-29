local status, packer = pcall(require, "packer")
if not status then
    print("Packer is not installed!")
    return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
    -- plugin manager
    use("wbthomason/packer.nvim")

    -- code autocomplete
    use("github/copilot.vim")

    -- file finder
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        requires = { { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" } },
    })

    -- fast cursor movement
    use("ggandor/lightspeed.nvim", {})

    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":tsupdate" })

    -- code runner
    use({ "crag666/code_runner.nvim", requires = "nvim-lua/plenary.nvim" })

    -- indent blanklines
    use({ "lukas-reineke/indent-blankline.nvim", config = function()
        require("indent_blankline").setup({
            -- for example, context is off by default, use this to turn it on
            show_current_context = true,
            show_current_context_start = true,
        })
    end })

    -- coc plugins
    use({ "neoclide/coc.nvim", branch = "release" })

    -- non-coc plugins
    -- nvim-jdtls
    -- use('mfussenegger/nvim-jdtls')
    -- use("jose-elias-alvarez/null-ls.nvim") -- null-ls for lsp
    -- use("muniftanjim/prettier.nvim") -- prettier plugin
    -- use("lukas-reineke/lsp-format.nvim") -- for formatting lsp
    -- use("neovim/nvim-lspconfig") -- language server protocol
    -- use("williamboman/mason.nvim") -- LSP manager
    -- use 'l3mon4d3/luasnip' -- snippets
    -- use("glepnir/lspsaga.nvim") -- lsp uis
    -- use 'hrsh7th/cmp-buffer' -- buffer source
    -- use 'hrsh7th/cmp-nvim-lsp' -- lsp source for nvim-cmp
    -- use 'hrsh7th/nvim-cmp' -- autocompletion
    -- use("williamboman/mason-lspconfig.nvim") -- LSP manager config
    -- use("onsails/lspkind-nvim") -- vscode-like pictograms for neovim lsp completion items

    -- which key plugin
    use({
        "folke/which-key.nvim",
    })

    -- tab out plugin
    use({
        "abecodes/tabout.nvim",
        wants = { "nvim-treesitter" }, -- or require if not used so far
        after = { "nvim-cmp", "copilot" }, -- if a completion plugin is using tabs load it before
    })

    -- harpoon
    use({
        "theprimeagen/harpoon",
        config = function()
            require("harpoon").setup({
                global_settings = {
                    save_on_toggle = false,
                    save_on_change = true,
                },
                projects = {
                    ["/home/username/projects"] = {
                        term = {},
                        files = {},
                        git = {},
                    },
                },
            })
        end,
    })

    -- for the tpope's surround plugin
    use("tpope/vim-surround")

    -- autosave plugin
    use({
        "pocco81/auto-save.nvim",
        config = function()
            require("auto-save").setup({
                --
            })
        end,
    })

    -- autoclose bracket pairs
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })

    -- bufferline tabs
    use({ "akinsho/bufferline.nvim", tag = "v3.*", requires = "kyazdani42/nvim-web-devicons" })

    -- smooth scrolling
    use("karb94/neoscroll.nvim")

    -- for nvim-neo-tree
    use({
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "muniftanjim/nui.nvim",
            {
                -- only needed if you want to use the commands with "_with_window_picker" suffix
                "s1n7ax/nvim-window-picker",
                tag = "v1.*",
                config = function()
                    require("window-picker").setup({
                        autoselect_one = true,
                        include_current = false,
                        filter_rules = {
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { "terminal", "quickfix" },
                            },
                        },
                        other_win_hl_color = "#e35e4f",
                    })
                end,
            },
        },
        config = function()
            -- unless you are still migrating, remove the deprecated commands from v1.x
            vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
            -- if you want icons for diagnostic errors, you'll need to define them somewhere:
            vim.fn.sign_define("diagnosticsignerror", { text = " ", texthl = "diagnosticsignerror" })
            vim.fn.sign_define("diagnosticsignwarn", { text = " ", texthl = "diagnosticsignwarn" })
            vim.fn.sign_define("diagnosticsigninfo", { text = " ", texthl = "diagnosticsigninfo" })
            vim.fn.sign_define("diagnosticsignhint", { text = "", texthl = "diagnosticsignhint" })
            -- vim.cmd([[nnoremap \ :neotree reveal<cr>]])
        end,
    })

    use("lewis6991/gitsigns.nvim") -- git signs

    -- for commenting toggles
    use("terrortylor/nvim-comment")
    use("joosepalviste/nvim-ts-context-commentstring")


    -- color theme 1 (tokyonight-night)
    -- use {
    --     'folke/tokyonight.nvim',
    --     requires = { 'tjdevries/colorbuddy.nvim' }
    -- }
    --
    -- vim.cmd [[colorscheme tokyonight-night]]

    -- color theme 2 (gruvbox)
    -- use 'morhetz/gruvbox'
    -- vim.cmd [[colorscheme gruvbox]]

    -- -- color theme 3 (everforest-hard)
    -- use 'sainnhe/everforest'
    -- vim.g.everforest_background = 'soft'
    -- vim.g.everforest_enable_italic = 1
    -- vim.g.everforest_diagnostic_text_highlight = 1
    -- vim.g.everforest_better_performance = 1
    -- vim.cmd [[colorscheme everforest]]

    -- color theme 4 (sonokai)
    -- use 'sainnhe/sonokai'
    -- vim.g.sonokai_style = 'atlantis'
    -- vim.g.sonokai_enable_italic = 1
    -- vim.g.sonokai_diagnostic_text_highlight = 1
    -- vim.g.sonokai_better_performance = 1
    -- vim.cmd [[colorscheme sonokai]]

    -- color theme 5 (onedark)
    -- use 'navarasu/onedark.nvim'
    -- vim.cmd [[colorscheme onedark]]

    -- color theme 6 (dracula)
    -- use 'dracula/vim'
    -- vim.cmd [[colorscheme dracula]]

    -- color theme 7 (nightfox)
    -- use 'edeneast/nightfox.nvim'
    -- vim.cmd [[colorscheme nightfox]]

    -- color theme 8 {poimandres-olivercederborg}
    -- use {
    --     'olivercederborg/poimandres.nvim',
    --     config = function()
    --         require('poimandres').setup {
    --             bold_vert_split = true, -- use bold vertical separators
    --             dim_nc_background = true, -- dim 'non-current' window backgrounds
    --             disable_background = false, -- disable background
    --             disable_float_background = false, -- disable background for floats
    --             disable_italics = false, -- disable italics
    --         }
    --     end
    -- }
    -- vim.cmd [[colorscheme poimandres]]

    -- color theme 9 (horizon)
    use("lunarvim/horizon.nvim")
    vim.cmd([[colorscheme horizon]])
end)

-- vim.cmd [[colorscheme poimandres]]

vim.g.copilot_node_command = "~/.nvm/versions/node/v16.18.0/bin/node"
