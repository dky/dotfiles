local nvim_lsp = require("lspconfig")

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings
    local opts = {noremap = true, silent = true}
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
    buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap(
        "n",
        "<space>e",
        '<cmd>lua vim.diagnostic.open_float(0, { scope = "line", border = "single" })<CR>',
        opts
    )

    buf_set_keymap("n", "<C-n>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "<C-p>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

local servers = {"pylsp", "rust_analyzer", "solargraph", "bashls", "dockerls", "cmake", "clangd", "html"}
for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = on_attach
    }
end

nvim_lsp.rust_analyzer.setup {
    on_attach = on_attach,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importMergeBehavior = "last",
                importPrefix = "by_self"
            },
            diagnostics = {
                disabled = {"unresolved-import"}
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
            checkOnSave = {
                command = "clippy"
            }
        }
    }
}

-- vscode-html-language-server even though this doesn't really work.
nvim_lsp.html.setup {
    capabilities = capabilities
}

-- Golang
nvim_lsp.gopls.setup {
    cmd = {"gopls"},
    capabilities = capabilities,
    settings = {
        gopls = {
            experimentalPostfixCompletions = true,
            analyses = {
                unusedparams = true,
                shadow = true
            },
            staticcheck = true
        }
    },
    --By default gopls will not attach unless a .git or a .go.mod file is present. I'm including the current directory with "."
    root_dir = require("lspconfig").util.root_pattern(".git", "go.mod", "."),
    on_attach = on_attach
}

-- Terraform lsp on it's own to see how I could do this outside of the for loop of languages above, use this in the future if we need to extend.
nvim_lsp.terraformls.setup {
    on_attach = on_attach
}

nvim_lsp.helm_ls.setup {
  settings = {
    ['helm-ls'] = {
      yamlls = {
        path = "yaml-language-server",
      }
    }
  }
}

-- Setup pylsp
nvim_lsp.pylsp.setup {
    enable = false,
    cmd = {"pylsp"},
    on_attach = on_attach,
    settings = {
        pylsp = {
            configurationSources = {"flake8"},
            plugins = {
                flake8 = {enabled = false},
                mypy = {enabled = false},
                pycodestyle = {enabled = false},
                pyflakes = {enabled = false}
            }
        }
    }
}

require "nvim-treesitter.configs".setup {
    highlight = {
        enable = true
    }
}

nvim_lsp.ruff.setup {
    on_attach = on_attach,
    init_options = {
        settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {}
        }
    }
}

-- Setup diagnostics formaters and linters for non LSP provided files
nvim_lsp.diagnosticls.setup {
    on_attach = on_attach,
    cmd = {"diagnostic-languageserver", "--stdio"},
    filetypes = {
        "markdown",
        "json"
    },
    init_options = {
        linters = {
            jsonlint = {
                command = "jsonlint",
                isStderr = true,
                debounce = 100,
                args = {"--compact"},
                offsetLine = 0,
                offsetColumn = 0,
                sourceName = "jsonlint",
                formatLines = 1,
                formatPattern = {
                    "^line (\\d+), col (\\d*), (.+)$",
                    {
                        line = 1,
                        column = 2,
                        message = {3}
                    }
                }
            },
            markdownlint = {
                command = "markdownlint",
                isStderr = true,
                debounce = 100,
                args = {"--stdin"},
                offsetLine = 0,
                offsetColumn = 0,
                sourceName = "markdownlint",
                formatLines = 1,
                formatPattern = {
                    "^.*?:\\s?(\\d+)(:(\\d+)?)?\\s(MD\\d{3}\\/[A-Za-z0-9-/]+)\\s(.*)$",
                    {
                        line = 1,
                        column = 3,
                        message = {4}
                    }
                }
            }
        },
        filetypes = {
            markdown = "markdownlint",
            json = "jsonlint"
        },
        formatters = {
            shfmt = {
                command = "shfmt",
                args = {"-i", "2", "-bn", "-ci", "-sr"}
            },
            prettier = {
                command = "prettier",
                args = {"--stdin-filepath", "%filepath"}
            }
        },
        formatFiletypes = {
            sh = "shfmt",
            markdown = "prettier"
        }
    }
}

-- Vim diagnostics, more to do here
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        -- Enable virtual text popup for errors/warnings, if disable use hover space-e to popup float--
        virtual_text = true,
        update_in_insert = true
    }
)

vim.diagnostic.config(
    {
        underline = false,
        virtual_text = {
            spacing = 2,
            prefix = "●",
        },
        update_in_insert = false,
        severity_sort = true,
        signs = {
            text = {
                -- Alas nerdfont icons don't render properly on Medium!
                [vim.diagnostic.severity.ERROR] = " ", 
                [vim.diagnostic.severity.WARN] = " ",
                [vim.diagnostic.severity.HINT] = " ",
                [vim.diagnostic.severity.INFO] = " ",
            },
        },
    }
)
