-- options
vim.opt.termguicolors = false
vim.opt.signcolumn = "number"
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 0
vim.opt.pumheight = 5
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "nv"
vim.opt.mousemodel = "extend"
vim.opt.scrolloff = 1
vim.opt.path:append("**/*")
vim.opt.winborder = "rounded"
vim.opt.completeopt = { "menuone", "noselect", "fuzzy" }
vim.opt.listchars = { tab = "<>", space = "_", eol = "$" }
vim.opt.statusline = "%!v:lua.StatusLine()"

vim.cmd.colorscheme('default')

-- keymaps
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {})
vim.keymap.set("n", "<Space>e", ":Oil<CR>")
vim.keymap.set("n", "<Space>p", ":find ")
vim.keymap.set("n", "<Space>f", ":silent lgrep! -soE ")
vim.keymap.set("n", "<Space>F", ":silent lgrep! -soE -v ")
vim.keymap.set("n", "<Space>b", ":ls<CR>:b ")
vim.keymap.set("n", "<Space>co", ":bo copen<CR>")
vim.keymap.set("n", "<Space>cc", ":cclose<CR>")
vim.keymap.set("n", "]c", ":cnext<CR>")
vim.keymap.set("n", "[c", ":cprevious<CR>")

vim.keymap.set('n', '<C-w><Space>', function()
  local loclist_winid = vim.fn.getloclist(0, { winid = 0 }).winid

  if loclist_winid ~= 0 then
    vim.cmd("lclose")
  else
    local status, _ = pcall(vim.cmd, "lopen")
    if not status then
      print("Location list is empty")
    end
  end
end)

-- autocmd
vim.api.nvim_create_autocmd('FileType', {
  pattern = {
    "sh", "go", "typescript", "javascript",
    "css", "scss", "html", "htmlangular",
    "json", "yaml", "markdown", "markdown_inline",
  },
  callback = function() 
    vim.treesitter.start() 
  end,
})

vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { "*.json", "*.css", "*.scss", "*.html", },
  callback = function()
    vim.cmd(":silent !npx prettier % --write")
  end,
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})

vim.api.nvim_create_autocmd('DiagnosticChanged', {
  callback = function()
    vim.cmd("redrawstatus")
  end
})


-- user commands
vim.api.nvim_create_user_command('Blame', function()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))

    local bufnr = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_option(bufnr, 'filetype', vim.bo.filetype)
    vim.api.nvim_buf_set_option(bufnr, 'bufhidden', 'wipe')

    vim.api.nvim_set_current_buf(bufnr)

    vim.cmd("0r !git blame #");

    vim.api.nvim_win_set_cursor(0, {row, col})
end, {})

vim.api.nvim_create_user_command('Open', function(opts)
    local target = vim.fn.expand(opts.args)
    
    vim.cmd('edit ' .. target)

    if vim.fn.isdirectory(target) == 0 then
      target = vim.fn.fnamemodify(target, ':p:h')
    end

    vim.api.nvim_set_current_dir(target)
end, { nargs = 1, complete = "dir" })

-- lsp
vim.lsp.config.gopls = {
  cmd = { "gopls" },
  root_markers = { "go.mod", "go.work", ".git" },
  filetypes = { "go" }
}

vim.lsp.config.tsls = {
  cmd = { "typescript-language-server", "--stdio" },
  root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
  filetypes = { "typescript", "javascript" },
  on_init = function(client, _)
    client.server_capabilities.semanticTokensProvider = nil  -- turn off semantic tokens
  end,
}

vim.lsp.enable({ "gopls", "tsls" })

-- statusline
function StatusLine()
  local bufid = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
  local clients = vim.lsp.get_clients({ bufnr = bufid })
  local diagnostics = "" 

  if #clients > 0 then
    local dc = vim.diagnostic.count(bufid)
    if next(dc) ~= nil then
      local s = vim.diagnostic.severity
      diagnostics = string.format("%s%s%s%s",
        dc[s.ERROR] and "%#DiagnosticError#" .. dc[s.ERROR] .. "E%* " or "",
        dc[s.WARN] and "%#DiagnosticWarn#" .. dc[s.WARN] .. "W%* " or "",
        dc[s.INFO] and "%#DiagnosticInfo#" .. dc[s.INFO] .. "I%* " or "",
        dc[s.HINT] and "%#DiagnosticHint#" .. dc[s.HINT] .. "H%* " or ""
      )
    end
  end

  return "%f%h%w%m%r%="..diagnostics.."%l,%c/%L"
end

require("oil").setup({
  view_options = {
    show_hidden = true
  }
})
