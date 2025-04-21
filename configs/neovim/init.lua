-- keybindings

-- use ctrl-q instead of ctrl-w for window commands
vim.keymap.set('', '<C-q>', '<C-w>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-q>', '<C-w>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-q>', '<C-w>', { noremap = true, silent = true })
vim.keymap.set('c', '<C-q>', '<C-w>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-q>', '<C-w>', { noremap = true, silent = true })
vim.keymap.set('', '<C-w>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-w>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('v', '<C-w>', '<Nop>', { noremap = true, silent = true })
vim.keymap.set('c', '<C-w>', '<Nop>', { noremap = true, silent = true })

-- esc clears search highlights
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true })

-- mouse and clipboard
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 5

-- searches
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "nosplit"
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true })

-- whitespace
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.showmode = false

-- flash on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end,
})

-- everything below is skipped inside VSCode
-- if not vim.g.vscode then

-- everything below is skipped if version is 0.9.5
-- this is only for VSCode Neovim compatibility
local v = vim.version()
if not (v.major == 0 and v.minor == 9 and v.patch == 5) then

-- middle-click pastes at the cursor
vim.api.nvim_set_keymap('n', '<MiddleMouse>', '"*P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<MiddleMouse>', '"*P', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<MiddleMouse>', '<C-o>"*P', { noremap = true, silent = true })

-- line wrapping
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = "    "

-- undo history
vim.opt.undofile = true
vim.opt.undodir = vim.fn.stdpath("config") .. "/undo"

-- disable mouse context menu item
vim.cmd.aunmenu{'PopUp.How-to\\ disable\\ mouse'}
vim.cmd.aunmenu{'PopUp.-1-'}

-- ui enhancements

-- helper: center text in message area
local function center_text(text)
  local width = vim.o.columns
  local padding = math.floor((width - #text) / 2)
  return string.rep(" ", padding) .. text
end

-- show centered mode name in cmdline
vim.api.nvim_create_autocmd({ "CmdlineLeave", "BufEnter", "ModeChanged" }, {
  callback = function()
    if vim.opt.cmdheight:get() == 1 and vim.fn.getcmdline() == "" then
      vim.defer_fn(function()
        if vim.fn.getcmdline() == "" then
          local mode_map = {
            n = "normal", i = "insert", v = "visual", V = "visual line",
            [""] = "visual block", c = "command", R = "replace", s = "select",
          }
          local current_mode = vim.api.nvim_get_mode().mode
          local message = center_text(mode_map[current_mode] or "UNKNOWN")
          vim.cmd([[echomsg "]] .. message .. [["]])
        end
      end, 10)
    end
  end,
  pattern = "*",
})

-- remember cursor position on reopen
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

-- appearance

-- line numbers and status
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.numberwidth = 1
vim.opt.statuscolumn = "%=%{v:virtnum == 0 ? (v:relnum > 0 ? v:relnum : v:lnum) : ' '} "
vim.opt.statusline = "%-4l%=%f %2p%%%=%4c"
vim.opt.cmdheight = 1
vim.opt.fillchars = 'eob: '

-- cursorline highlight
vim.opt.cursorline = true

-- autoformat before save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- show buffer name in window title
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  callback = function()
    local filename = vim.fn.expand("%:t")
    vim.opt.titlestring = filename == "" and "[No Name]" or filename
    vim.opt.title = true
  end,
})

-- disable automatic comment insertion
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  command = "set formatoptions-=cro"
})

-- diagnostics

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  { underline = false }
)

vim.diagnostic.config({
  virtual_text = { prefix = '', spacing = 1 },
  underline = false,
  severity_sort = true,
})

local ns_id = vim.api.nvim_create_namespace("diagnostic_highlight")
local function highlight_diagnostics()
  vim.api.nvim_buf_clear_namespace(0, ns_id, 0, -1)
  for _, diagnostic in ipairs(vim.diagnostic.get(0)) do
    local group = ({
      [vim.diagnostic.severity.ERROR] = "DiagnosticError",
      [vim.diagnostic.severity.WARN]  = "DiagnosticWarn",
      [vim.diagnostic.severity.INFO]  = "DiagnosticInfo",
      [vim.diagnostic.severity.HINT]  = "DiagnosticHint",
    })[diagnostic.severity]
    if group then
      vim.api.nvim_buf_add_highlight(0, ns_id, group, diagnostic.lnum, diagnostic.col, diagnostic.end_col or diagnostic.col + 1)
    end
  end
end

vim.api.nvim_create_autocmd({ "CursorHold", "DiagnosticChanged" }, {
  callback = highlight_diagnostics,
})

-- plugins

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
  Plug 'Mofiqul/adwaita.nvim'
  call plug#end()
]])

-- theme and highlights

-- theme
vim.o.background = "light"
vim.cmd("colorscheme adwaita")

-- highlight styles
vim.api.nvim_set_hl(0, "Normal",        { ctermbg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = "#FFFFFF", fg = "#000000" })
vim.api.nvim_set_hl(0, "EndOfBuffer",   { ctermfg = "NONE", ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "Visual",        { bg = "#CCCCCC" })
vim.api.nvim_set_hl(0, "CursorLine",    { bg = "#ECECEC" })
vim.api.nvim_set_hl(0, "Cursor",        { bg = "#1f2328" })
vim.api.nvim_set_hl(0, "iCursor",       { bg = "#1f2328" })
vim.api.nvim_set_hl(0, "rCursor",       { bg = "#1f2328" })

-- diagnostic highlights
vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "#FFCCCC", fg = "#000000" })
vim.api.nvim_set_hl(0, "DiagnosticWarn",  { bg = "#FFF4CC", fg = "#000000" })
vim.api.nvim_set_hl(0, "DiagnosticInfo",  { bg = "#CCE5FF", fg = "#000000" })
vim.api.nvim_set_hl(0, "DiagnosticHint",  { bg = "#E6E6FF", fg = "#000000" })

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = { "c", "rust" },
    disable = function(lang, buf)
      local max = 100 * 1024
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      return ok and stats and stats.size > max
    end,
    additional_vim_regex_highlighting = false,
  },
}

-- lsp and cmp setup

local lspconfig = require('lspconfig')
local cmp = require'cmp'
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
end

-- setup servers
lspconfig.clangd.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.bashls.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.pyright.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.ts_ls.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.cssls.setup { capabilities = capabilities, on_attach = on_attach }
lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { html = { format = { wrapLineLength = 0 } } }
}

-- cmp config
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<Tab>'] = cmp.mapping(function(fb) if cmp.visible() then cmp.select_next_item() else fb() end end, {"i", "s"}),
    ['<S-Tab>'] = cmp.mapping(function(fb) if cmp.visible() then cmp.select_prev_item() else fb() end end, {"i", "s"})
  }),
  sources = cmp.config.sources({ { name = 'nvim_lsp' } }, { { name = 'buffer' }, { name = 'path' } })
})

-- large file performance

vim.api.nvim_create_augroup("LargeFile", { clear = true })
local large_file_size = 10 * 1024 * 1024

vim.api.nvim_create_autocmd("BufReadPre", {
  group = "LargeFile",
  callback = function()
    local file = vim.fn.expand("<afile>")
    local filesize = vim.fn.getfsize(file)
    if filesize > large_file_size then
      vim.cmd("set eventignore+=FileType")
      vim.opt_local.swapfile = false
      vim.opt_local.bufhidden = "unload"
      vim.opt_local.buftype = "nowrite"
      vim.opt_local.undolevels = -1
    else
      vim.cmd("set eventignore-=FileType")
    end
  end,
})

end
