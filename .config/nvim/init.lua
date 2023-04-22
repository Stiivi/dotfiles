-- require('plugins')

-- Colors
--
vim.opt.termguicolors = true
vim.opt.syntax = 'on'
vim.opt.background = 'dark'
vim.cmd('colorscheme kanagawa')


-- Layout and display
--
vim.opt.linebreak = true
vim.opt.textwidth = 79
vim.opt.colorcolumn = '80'
vim.opt.number = true

-- Editing
--
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.spelllang = "en_gb"
vim.opt.backspace = "indent,eol,start"
vim.opt.whichwrap = "b,s,<,>"
vim.opt.completeopt:remove { 'preview' }

-- Swap File and Backup
vim.opt.swapfile = false
vim.opt.backupdir = "~/tmp"
vim.opt.writebackup = false
vim.opt.backup = false


-- MacOS Terminal Title - proxy icon to edited document
vim.opt.title = true
-- vim.opt.t_ts = "]6;"
-- vim.opt.t_fs = ""
vim.opt.titlestring = "%{bufname('%')==''?'':'file://'.hostname().expand('%:p:gs/ /%20/')}"
vim.opt.titlelen =  0

-- Keymap
--
vim.keymap.set('n', '<f2>', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('i', '<f2>', '<esc><cmd>write<cr>', {desc = 'Save'})
vim.keymap.set('n', 'te', '<cmd>NvimTreeToggle<cr>', {desc = 'Tree Toggle'})

-- Plugins
--
require('plugins')
require('nvim-tree').setup()
require('telescope').setup {
    defaults = {
        layout_config = {
            vertical = { width = 0.5 },
        },
    },
    pickers = {
    },
}
require('lualine').setup()
require('nvim-autopairs')
require('Comment').setup()
local comment_api = require('Comment.api')
vim.keymap.set('n', '<c-/>', comment_api.toggle.linewise.current, {})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<c-P>', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>fd', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>fw', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, {})

vim.keymap.set('n', '<leader>d', 'pu=strftime(\'%Y-%m-%d\')', {})


require('kanagawa').setup({
    compile = false,             -- enable compiling the colorscheme
    undercurl = true,            -- enable undercurls
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true},
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = false,         -- do not set background color
    dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
    terminalColors = true,       -- define vim.g.terminal_color_{0,17}
    colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
    },
    overrides = function(colors) -- add/modify highlights
        return {}
    end,
    theme = "wave",              -- Load "wave" theme when 'background' option is not set
    background = {               -- map the value of 'background' option to a theme
        dark = "wave",           -- try "dragon" !
        light = "lotus"
    },
})


-- Trouble
--
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {silent = true, noremap = true})
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", {silent = true, noremap = true})


-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.pyright.setup {
  settings = {
    python = {
      exclude = {"build", "dist"},
    }
  }

}
lspconfig.tsserver.setup {}
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          exclude = {"build", "dist"},
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    },
  }
}

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

-- Semantic highlight
--
-- Source: https://sbulav.github.io/til/til-neovim-highlight-references/
-- Server capabilities spec:
-- https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#serverCapabilities
-- vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
-- vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
-- vim.api.nvim_create_autocmd("CursorHold", {
--     callback = vim.lsp.buf.document_highlight,
--     buffer = bufnr,
--     group = "lsp_document_highlight",
--     desc = "Document Highlight",
-- })
-- vim.api.nvim_create_autocmd("CursorMoved", {
--     callback = vim.lsp.buf.clear_references,
--     buffer = bufnr,
--     group = "lsp_document_highlight",
--     desc = "Clear All the References",
-- })

-- require("neotest").setup({
--   adapters = {
--     require("neotest-python")
--   }
-- })

