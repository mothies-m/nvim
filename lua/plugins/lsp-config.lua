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
                        disableSuggestions = true,
                    }
                }
            })
            --Python language server
            lspconfig.pyright.setup({
                on_attach = custom_attach,
                capabilities = capabilities,
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
