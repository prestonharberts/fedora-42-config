-- input

-- use ctrl-q instead of ctrl-w
vim.keymap.set('', '<C-q>', '<C-w>', { noremap = true }) -- Unmap in normal, visual, select, operator-pending modes
vim.keymap.set('i', '<C-q>', '<C-w>', { noremap = true }) -- Unmap in insert mode
vim.keymap.set('v', '<C-q>', '<C-w>', { noremap = true }) -- Unmap in visual mode
vim.keymap.set('c', '<C-q>', '<C-w>', { noremap = true }) -- Unmap in command mode
vim.keymap.set('n', '<C-q>', '<C-w>', { noremap = true, silent = true })
vim.keymap.set('', '<C-w>', '<Nop>', { noremap = true })
vim.keymap.set('i', '<C-w>', '<Nop>', { noremap = true })
vim.keymap.set('v', '<C-w>', '<Nop>', { noremap = true })
vim.keymap.set('c', '<C-w>', '<Nop>', { noremap = true })

-- look

-- gutter
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.statuscolumn = "%=%{v:virtnum == 0 ? (v:relnum > 0 ? v:relnum : v:lnum) : ' '} "
vim.opt.statusline = "%-4l%=%f %2p%%%=%4c"
vim.opt.cmdheight = 1
-- Set cmdheight to 1
vim.opt.cmdheight = 1
-- Set cmdheight to 1
vim.opt.cmdheight = 1

-- Helper function to center a message
local function center_text(text)
  local width = vim.o.columns -- Get the width of the current window
  local padding = math.floor((width - #text) / 2) -- Calculate the padding for centering
  return string.rep(" ", padding) .. text
end

-- Autocommand to display placeholder text with current mode when the command line is empty
vim.api.nvim_create_autocmd({ "CmdlineLeave", "BufEnter", "ModeChanged" }, {
  callback = function()
    if vim.opt.cmdheight:get() == 1 and vim.fn.getcmdline() == "" then
      vim.defer_fn(function()
        if vim.fn.getcmdline() == "" then
          local mode_map = {
            n = "normal",
            i = "insert",
            v = "visual",
            V = "visual line",
            [""] = "visual block",
            c = "command",
            R = "replace",
            s = "select",
          }
          local current_mode = vim.api.nvim_get_mode().mode
          local mode_text = mode_map[current_mode] or "UNKNOWN"
          local message = center_text("" .. mode_text .. "")
          vim.cmd([[echomsg "]] .. message .. [["]])
        end
      end, 10) -- Slight delay to avoid conflicts
    end
  end,
  pattern = "*",
})

vim.opt.fillchars='eob: '

-- cursor
vim.opt.cursorline = true
vim.opt.guicursor = "i:blinkon400-blinkoff400"
-- Set highlights for different cursors
vim.cmd([[
  highlight Cursor guibg=#5f87af ctermbg=67
  highlight iCursor guibg=#ffffaf ctermbg=229
  highlight rCursor guibg=#d70000 ctermbg=124
]])

-- Set cursor styles for different modes
vim.opt.guicursor = table.concat({
  "n-v-c:block-Cursor/lCursor",
  "i-ci-ve:ver100-iCursor",
  "r-cr:block-rCursor",
  "o:hor50-Cursor/lCursor",
  "sm:block-iCursor",
  "a:blinkwait1000-blinkon500-blinkoff250"
}, ",")

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- search
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true })

-- tabs and whitepsace
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.showmode = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.bo.softtabstop = 2

-- comments
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    command = "set formatoptions-=cro"
})

-- line wrapping
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "    "

-- disable unnecessary button in context menu
vim.cmd.aunmenu{'PopUp.How-to\\ disable\\ mouse'}
vim.cmd.aunmenu{'PopUp.-1-' }

-- undo history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"

-- middle click to paste anywhere on the screen only where the nvim cursor is at
vim.api.nvim_set_keymap('n', '<MiddleMouse>', '"*P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<MiddleMouse>', '"*P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<MiddleMouse>', '<C-o>"*P', { noremap = true, silent = true })

-- disable context menu
-- vim.api.nvim_set_keymap('n', '<RightMouse>', '<Nop>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<RightMouse>', '<Nop>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<RightMouse>', '<Nop>', { noremap = true, silent = true })

-- remember cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local line_count = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- flash when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})

-- autoformat on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- set window title to current filename when opening or switching buffers
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    callback = function()
        local filename = vim.fn.expand("%:t")  -- Gets the filename
        if filename == "" then
            filename = "[No Name]"  -- Handle empty buffer case
        end
        vim.cmd("let &titlestring = '" .. filename .. "'")
        vim.opt.title = true  -- Enable the terminal title
    end,
})

-- vim-plug
vim.cmd([[
  call plug#begin('~/.local/share/nvim/plugged')

  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'numToStr/Comment.nvim'

  Plug 'Mofiqul/adwaita.nvim'   " theme

  call plug#end()
]])

-- set to light theme
vim.o.background = "light"
vim.cmd("colorscheme adwaita")
vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
vim.cmd("highlight StatusLine ctermbg=NONE guifg=#000000 guibg=NONE")
vim.cmd("highlight EndOfBuffer ctermfg=NONE ctermbg=NONE")
vim.cmd("highlight Visual guibg=#CCCCCC guifg=NONE")
vim.cmd("highlight CursorLine guibg=#ECECEC guifg=NONE")

local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local cmp = require'cmp'
local lspconfig = require'lspconfig'

-- cmp setup
cmp.setup({
    mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item() -- Tab navigates to the next item
    else
      fallback() -- Use normal Tab behavior when no menu
    end
  end, { "i", "s" }),
  ['<S-Tab>'] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item() -- Shift-Tab navigates to the previous item
    else
      fallback() -- Use normal Shift-Tab behavior when no menu
    end
  end, { "i", "s" }),
}),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },   -- Use LSP as the source for autocompletion
  }, {
    { name = 'buffer' },     -- Use the current buffer for autocompletion
    { name = 'path' },       -- Autocomplete file paths
  })
})

-- setup LSP to work with nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- common on_attach function for key mappings
local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)         -- Go to definition
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)               -- Show hover info
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)     -- Go to implementation
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)     -- Rename symbol
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- Show code actions
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)         -- Show references
end

-- configure LSP servers

-- C++ (clangd)
lspconfig.clangd.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Bash (bash-language-server)
lspconfig.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Python (pyright)
lspconfig.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- JavaScript/TypeScript (tsserver)
lspconfig.ts_ls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- CSS (cssls)
lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- HTML (html)
lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    html = {
      format = {
        wrapLineLength = 0
      }
    }
  }

}

-- treesitter setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  sync_install = false,

  auto_install = true,

  ignore_install = { "javascript" },

  highlight = {
    enable = true,

    disable = { "c", "rust" },
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    additional_vim_regex_highlighting = false,
  },
}

-- remove underline from diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = false
  }
)

-- custom highlights for diagnostics
vim.cmd([[
  highlight DiagnosticError guibg=#FFCCCC guifg=#000000 gui=NONE
  highlight DiagnosticWarn guibg=#FFF4CC guifg=#000000 gui=NONE
  highlight DiagnosticInfo guibg=#CCE5FF guifg=#000000 gui=NONE
  highlight DiagnosticHint guibg=#E6E6FF guifg=#000000 gui=NONE
]])

-- update diagnostics to use background highlight
vim.diagnostic.config({
  virtual_text = {
    prefix = '',
    spacing = 1,
  },
  underline = false,
  severity_sort = true,
})

-- custom handler to apply background highlight
local ns_id = vim.api.nvim_create_namespace("diagnostic_highlight")
local function highlight_diagnostics()
  vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)  -- clear previous highlights

  for _, diagnostic in ipairs(vim.diagnostic.get(0)) do
    local line = diagnostic.lnum
    local start_col = diagnostic.col
    local end_col = diagnostic.end_col or start_col + 1
    local severity = diagnostic.severity
    local group = ''

    if severity == vim.diagnostic.severity.ERROR then
      group = 'DiagnosticError'
    elseif severity == vim.diagnostic.severity.WARN then
      group = 'DiagnosticWarn'
    elseif severity == vim.diagnostic.severity.INFO then
      group = 'DiagnosticInfo'
    elseif severity == vim.diagnostic.severity.HINT then
      group = 'DiagnosticHint'
    end

    if group ~= '' then
      vim.api.nvim_buf_add_highlight(0, ns_id, group, line, start_col, end_col)
    end
  end
end

-- Use an autocommand to refresh the highlight on CursorHold and DiagnosticChanged
vim.api.nvim_create_autocmd({ "CursorHold", "DiagnosticChanged" }, {
  callback = highlight_diagnostics,
})


-- Create an augroup for large files
vim.api.nvim_create_augroup("LargeFile", { clear = true })

-- Define the size threshold for large files (10MB)
local large_file_size = 10485760

-- Define an autocmd to handle large files
vim.api.nvim_create_autocmd("BufReadPre", {
    group = "LargeFile",
    callback = function()
        local file = vim.fn.expand("<afile>")
        local filesize = vim.fn.getfsize(file)

        if filesize > large_file_size then
            -- Apply settings for large files
            vim.cmd("set eventignore+=FileType")
            vim.opt_local.swapfile = false
            vim.opt_local.bufhidden = "unload"
            vim.opt_local.buftype = "nowrite"
            vim.opt_local.undolevels = -1
        else
            -- Remove the eventignore for FileType
            vim.cmd("set eventignore-=FileType")
        end
    end
})
