vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt
opt.relativenumber = true
opt.number = true
-- vim.api.nvim_set_keymap("n", "<F4>", ":w<CR>:!python3 %<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("n", "<F5>", ":w<CR>:terminal python3 %<CR>", { noremap = true, silent = true })

-- Define the functions globally
_G.run_code = function()
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%")
  local output_name = vim.fn.expand("%:t:r")

  if filetype == "python" then
    vim.cmd(":w")
    vim.cmd(":!python3 " .. filename)
  elseif filetype == "c" then
    vim.cmd(":w")
    vim.cmd(":!gcc " .. filename .. " -o " .. output_name .. " && ./" .. output_name)
  elseif filetype == "cpp" then
    vim.cmd(":w")
    vim.cmd(":!g++ " .. filename .. " -o " .. output_name .. " && ./" .. output_name)
  elseif filetype == "java" then
    vim.cmd(":w")
    vim.cmd(":!javac " .. filename .. " && java -cp " .. vim.fn.expand("%:h") .. " " .. output_name)
  elseif filetype == "sh" then
    vim.cmd(":w")
    vim.cmd(":!bash " .. filename)
  else
    print("No run command defined for filetype: " .. filetype)
  end
end

_G.run_code_in_terminal = function()
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%")
  local output_name = vim.fn.expand("%:t:r")

  if filetype == "python" then
    vim.cmd(":w")
    vim.cmd(":terminal python3 " .. filename)
  elseif filetype == "c" then
    vim.cmd(":w")
    vim.cmd(":terminal gcc " .. filename .. " -o " .. output_name .. " && ./" .. output_name)
  elseif filetype == "cpp" then
    vim.cmd(":w")
    vim.cmd(":terminal g++ " .. filename .. " -o " .. output_name .. " && ./" .. output_name)
  elseif filetype == "java" then
    vim.cmd(":w")
    vim.cmd(":terminal javac " .. filename .. " && java -cp " .. vim.fn.expand("%:h") .. " " .. output_name)
  elseif filetype == "sh" then
    vim.cmd(":w")
    vim.cmd(":terminal bash " .. filename)
  else
    print("No run command defined for filetype: " .. filetype)
  end
end
_G.make_executable = function()
  local filetype = vim.bo.filetype
  local filename = vim.fn.expand("%")

  if filetype == "sh" then
    vim.cmd(":!chmod +x " .. filename)
    print("Made " .. filename .. " executable")
  else
    print("No make executable command defined for filetype: " .. filetype)
  end
end

-- Map the functions to keys
vim.api.nvim_set_keymap("n", "<F4>", ":lua _G.run_code()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F5>", ":lua _G.run_code_in_terminal()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-x>", [[:lua _G.make_executable()<CR>]], { noremap = true, silent = true })
-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for tokyonight colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false
