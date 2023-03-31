-- lsp-config.lua

-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero').preset({
    name = 'minimal',
    set_lsp_keymaps = true,
    manage_nvim_cmp = true,
    suggest_lsp_servers = false,
})
-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()
lsp.skip_server_setup({ 'intelephense' })

lsp.format_on_save({
    format_opts = {
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['null-ls'] = { 'javascript', 'typescript', 'php', 'css', 'scss', 'html' },
    }
})

require('lspconfig').intelephense.setup({
    settings = {
        intelephense = {
            stubs = {
                "bcmath",
                "bz2",
                "Core",
                "curl",
                "date",
                "dom",
                "fileinfo",
                "filter",
                "gd",
                "gettext",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "libxml",
                "mbstring",
                "mcrypt",
                "mysql",
                "mysqli",
                "password",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_mysql",
                "Phar",
                "readline",
                "regex",
                "session",
                "SimpleXML",
                "sockets",
                "sodium",
                "standard",
                "superglobals",
                "tokenizer",
                "xml",
                "xdebug",
                "xmlreader",
                "xmlwriter",
                "yaml",
                "zip",
                "zlib",
                "wordpress-stubs",
                "woocommerce-stubs",
                "acf-pro-stubs",
                "wordpress-globals",
                "wp-cli-stubs",
                "genesis-stubs",
                "polylang-stubs",
            },
            environment = {
                includePaths = { "/home/chrisstickland/.config/nvim/stubs" },
            },
            files = {
                maxSize = 5000000,
            },
        },
    },
    root_dir = require("lspconfig").util.root_pattern("index.php", ".git"),
})

lsp.setup()

local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
    on_attach = function(client, bufnr)
        null_opts.on_attach(client, bufnr)
    end,
    sources = {
        --- Replace these with the tools you have installed
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier.with({
            filetypes = {
                "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "scss", "html", "json", "yaml",
                "markdown", "graphql", "md", "mdx", "txt",
            },
            extra_args = {
                "--no-semi", "--single-quote", "--jsx-single-quote"
            },
        }),
    }
})
