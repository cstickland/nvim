require("lazy").setup({
    { "folke/which-key.nvim" },
    { "folke/neodev.nvim" },
    { "nvim-lua/plenary.nvim" },
    { "nvim-tree/nvim-web-devicons" }, -- not strictly required, but recommended
    { "MunifTanjim/nui.nvim" },
    {
        "rcarriga/nvim-notify",
        keys = {
            {
                "<leader>un",
                function()
                    require("notify").dismiss({ silent = true, pending = true })
                end,
                desc = "Delete all Notifications",
            },
        },
        opts = {
            timeout = 1500,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
        },
    },
    { "EdenEast/nightfox.nvim" },
    {
        "nvim-neo-tree/neo-tree.nvim",
        keys = {
            { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
        },
        config = function()
            require("neo-tree").setup()
        end,
    },

    -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
    -- So for api plugins like devicons, we can always set lazy=true
    { "nvim-tree/nvim-web-devicons", lazy = true },
    { "folke/trouble.nvim" },
    {
        "nvim-treesitter/nvim-treesitter",
        version = false, -- last release is way too old and doesn't work on Windows
        build = ":TSUpdate",
    },
    { "windwp/nvim-ts-autotag" },
    { "jose-elias-alvarez/null-ls.nvim" },

    { "nvim-lualine/lualine.nvim" },
    {
        "nvim-telescope/telescope.nvim",
    },
    {
        "romgrk/barbar.nvim",
        dependencies = "nvim-tree/nvim-web-devicons",
        version = "^1.0.0", -- optional: only update when a new 1.x version is released
    },
    { "folke/noice.nvim" },
    {
        "numToStr/Comment.nvim",
    },
    {
        "folke/zen-mode.nvim",
    },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },         -- Required
            { 'hrsh7th/cmp-nvim-lsp' },     -- Required
            { 'hrsh7th/cmp-buffer' },       -- Optional
            { 'hrsh7th/cmp-path' },         -- Optional
            { 'saadparwaiz1/cmp_luasnip' }, -- Optional
            { 'hrsh7th/cmp-nvim-lua' },     -- Optional

            -- Snippets
            { 'L3MON4D3/LuaSnip' },             -- Required
            { 'rafamadriz/friendly-snippets' }, -- Optional
        }
    },
    {
        "goolord/alpha-nvim",
        lazy = true,
    },
    { 'brenoprata10/nvim-highlight-colors' },
    {
        "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
        config = function()
            require("lsp_lines").setup()
        end,
    },
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            -- char = "▏",
            char = "│",
            filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
            show_trailing_blankline_indent = false,
            show_current_context = false,
        },
    },
    {
        "echasnovski/mini.indentscope",
        version = false, -- wait till new 0.7.0 release to put it back on semver
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            -- symbol = "▏",
            symbol = "│",
            options = { try_as_border = true },
        },
        init = function()
            vim.api.nvim_create_autocmd("FileType", {
                pattern = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy", "mason" },
                callback = function()
                    vim.b.miniindentscope_disable = true
                end,
            })
        end,
        config = function(_, opts)
            require("mini.indentscope").setup(opts)
        end,
    },
    {
        "andrewferrier/wrapping.nvim",
        config = function()
            require("wrapping").setup()
        end
    },
})

require("noice").setup()
require('nvim-highlight-colors').setup({
})
require("Comment").setup()
