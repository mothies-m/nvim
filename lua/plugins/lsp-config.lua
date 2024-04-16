return {
    {
    'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = vim.lsp.protocol.make_client_capabilities()
            capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
            local custom_attach = function(client, bufnr)
                print('Lsp Attached.')
            end
            --Lua language server
            lspconfig.lua_ls.setup ({
                on_attach = custom_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            enable = true,
                            -- enable = false,
                        },
                        workspace = {
                            checkThirdParty = false,
                            library = {
                              vim.env.VIMRUNTIME,
                            },
                        },
                        telemetry = { enable = false },
                    },
                },
            })
            --Cpp language server
            lspconfig.clangd.setup({
                on_attach = custom_attach,
                capabilities = capabilities,
                settings = {
                    ccls = {
                        completion = {
                            filterAndSort = false
                        }
                    },
                    clangd = {
                        cmd = { 'clangd', '--background-index', '--header-insertion=iwyu' },
                        filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
                    },
                }
            })
            --TS language server 
            lspconfig.tsserver.setup({
                on_attach = custom_attach,
                capabilities = capabilities,
                maxTsServerMemory = 16000,
            }) 
            lspconfig.emmet_ls.setup({
                --on_attach = custom_attach,
                capabilities = capabilities,
                filetypes = {
                    "css",
                    "eruby",
                    "html",
                    "javascript",
                    "javascriptreact",
                    "javascript.jsx",
                    "less",
                    "sass",
                    "typescript",
                    "typescript.tsx",
                    "scss",
                    "svelte",
                    "pug",
                    "typescriptreact",
                    "vue",
                },
                init_options = {
                    html = {
                        options = {
                            ["bem.enabled"] = true,
                        },
                    },
                },
            })

            --html language server
            lspconfig.html.setup({
                on_attach = custom_attach,
                capabilities = capabilities,
                settings = {
                    cmd = { "vscode-html-language-server", "--stdio" },
                    filetypes = { "html", "typescriptreact", "javascriptreact", "typescript.tsx", "javascript.jsx", "css", "sass", "scss", "less", "svelte" },
                    init_options = {
                        configurationSection = { "html", "css", "javascript", "javascriptreact", "typescriptreact" },
                        embeddedLanguages = {
                            css = true,
                            javascript = true
                        }
                    },
                }
            })
            --Python language server
            lspconfig.pyright.setup({
                on_attach = custom_attach,
                capabilities = capabilities,
            })
            --Tailwind language server
            lspconfig.tailwindcss.setup({
                 on_attach = custom_attach,
                capabilities = capabilities,
            })
            --Vue.js language server
            lspconfig.vuels.setup({
               on_attach = custom_attach,
               capabilities = capabilities,
               settings = {
                   cmd = { "vls" },
                   filetypes = { "vue" },
                   init_options = {
                       config = {
                           css = {},
                           emmet = {},
                           html = {
                               suggest = {}
                           },
                           javascript = {
                               format = {}
                           },
                           stylusSupremacy = {},
                           typescript = {
                               format = {}
                           },
                           vetur = {
                               completion = {
                                   autoImport = false,
                                   tagCasing = "kebab",
                                   useScaffoldSnippets = false
                               },
                               format = {
                                   defaultFormatter = {
                                       js = "prettier",
                                       ts = "prettier"
                                   },
                                   defaultFormatterOptions = {},
                                   scriptInitialIndent = false,
                                   styleInitialIndent = false
                               },
                               useWorkspaceDependencies = false,
                               validation = {
                                   script = true,
                                   style = true,
                                   template = true
                               }
                           }
                       }
                   }
               }
            })
            --CSS language server
            lspconfig.cssls.setup({
                  on_attach = custom_attach,
                  capabilities = capabilities,
            })
            lspconfig.cssmodules_ls.setup({
                 on_attach = custom_attach,
                  capabilities = capabilities,
                  settings = {
                    cssmodules_ls = {
                        cmd = { "cssmodules-language-server" },
                        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
                    },
                }
            })
            -- new server goes here:
            -- lspconfig.SERVER.setup({
            --    on_attach = custom_attach,
            --    capabilities = capabilities
            --    COPY PASTE SERVER SETTINGS HERE
            --})
        end
       }
   }
