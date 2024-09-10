return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v4.x',
        lazy = true,
        config = false
    },

    -- Autocompletion
    {
        'hrsh7th/nvim-cmp',
        event = 'InsertEnter',
        dependencies = {
            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
            {'hrsh7th/cmp-buffer'},
            {'hrsh7th/cmp-path'},
            {'saadparwaiz1/cmp_luasnip'},
        },
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    {name = 'nvim_lsp'},
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),
                    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                }),
                snippet = {
                    expand = function(args)
                        vim.snippet.expand(args.body)
                    end,
                },
            })
        end
    },

    -- LSP
    {
        'neovim/nvim-lspconfig',
        cmd = 'LspInfo',
        event = {'BufReadPre', 'BufNewFile'},
        dependencies = {
            {'hrsh7th/cmp-nvim-lsp'},
        },
        config = function()
            local lsp_zero = require('lsp-zero')

            -- lsp_attach is where you enable features that only work
            -- if there is a language server active in the file
            local lsp_attach = function(client, bufnr)
                local opts = {buffer = bufnr}

                vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
                vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
                vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
                vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
                vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
                vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
                vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
                vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
                vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
                vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
            end

            lsp_zero.extend_lspconfig({
                sign_text = true,
                lsp_attach = lsp_attach,
                capabilities = require('cmp_nvim_lsp').default_capabilities()
            })

            opts = {
                servers = {
                    ansiblels = {},
                    dockerls = {},
                    docker_compose_language_service = {},
                    jsonls = {
                      -- lazy-load schemastore when needed
                        on_new_config = function(new_config)
                            new_config.settings.json.schemas = new_config.settings.json.schemas or {}
                            vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
                        end,
                        settings = {
                            json = {
                                format = {
                                    enable = true,
                                },
                                validate = { enable = true },
                            },
                        },
                    },
                    ruff = {
                        cmd_env = { RUFF_TRACE = "messages" },
                        init_options = {
                            settings = {
                                logLevel = "error",
                            },
                        },
                        keys = {
                            {
                                "<leader>co",
                                LazyVim.lsp.action["source.organizeImports"],
                                desc = "Organize Imports",
                            },
                        },
                    },
                    ruff_lsp = {
                        keys = {
                            {
                                "<leader>co",
                                LazyVim.lsp.action["source.organizeImports"],
                                desc = "Organize Imports",
                            },
                        },
                    },
                    terraformls = {},
                },
            }

        end
    },

    -- Mason
    {
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            local mason = require("mason")

            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                },
                ensure_installed = {
                    "ansible-lint",
                    "ansible-language-server",
                    "cfn-lint",
                    "circleci-yaml-language-server",
                    "docker-compose-language-service",
                    "dockerfile-language-server",
                    "gitlab-ci-ls",
                    "jinja-lsp",
                    "jq",
                    "json-lsp",
                    "jsonlint",
                    "markdown-oxide",
                    "markdownlint-cli2",
                    "marksman",
                    "prettierd",
                    "ruff",
                    "ruff-lsp",
                    "shfmt",
                    "snyk",
                    "sonarlint-language-server",
                    "sqlfluff",
                    "sqlfmt",
                    "terraform-ls",
                    "tflint",
                    "yaml-language-server",
                    "yamlfmt",
                    "yamllint",
                }
            })
        end
    }
}
