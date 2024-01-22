return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
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
                init_options = {
                    preferences = {
                        disableSuggestions = false,
                    }
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
                                       js = "none",
                                       ts = "none"
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
