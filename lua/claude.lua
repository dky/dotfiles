require("claudecode").setup({
  terminal = {
    split_width_percentage = 0.4,
    cwd_provider = function(ctx)
      -- Prefer repo root; fallback to file's directory
      local cwd = require("claudecode.cwd").git_root(ctx.file_dir or ctx.cwd) or ctx.file_dir or ctx.cwd
      return cwd
    end,
  },
  focus_after_send = true,
})

-- Keybindings
local map = vim.keymap.set
map("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
map("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
map("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
map("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
map("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
map("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
map("v", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
map("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
map("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })

-- File explorer: <leader>as adds file (overrides visual mode mapping in these filetypes)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw" },
  callback = function()
    vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", { buffer = true, desc = "Add file" })
  end,
})

-- Auto-enter insert mode when clicking in terminal (fixes click-to-type after scrolling)
vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    -- Map mouse click in terminal normal mode to enter insert mode
    vim.keymap.set("n", "<LeftMouse>", "<LeftMouse>i", { buffer = buf, silent = true })
    vim.keymap.set("n", "<LeftRelease>", "<Nop>", { buffer = buf, silent = true })
  end,
})
