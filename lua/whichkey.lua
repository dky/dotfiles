local wk = require("which-key")

wk.setup({})

wk.add({
  -- localleader mappings
  { "<localleader>t", "<cmd>FloatermNew --autoclose=0 pytest .<cr>", desc = "run pytest" },
  { "<localleader>p", "<cmd>FloatermNew --autoclose=0 python3 %<cr>", desc = "run current buffer with python in float" },
  { "<localleader>cd", "<cmd>lcd %:p:h<cr>", desc = "cd to current dir" },

  -- ClaudeCode group
  { "<localleader>c", group = "ClaudeCode" },
  { "<localleader>cc", "<cmd>ClaudeCodeFocus<cr>", desc = "Show or Hide claude" },

  -- Leader mappings
  { "<leader>f", "<cmd>Files<cr>", desc = "Search all files in current Git Repo" },
  { "<leader>p", "\"_dP", desc = "Paste without overwrite" },
  { "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Search and replace word under cursor" },
  { "<leader><leader>", "<cmd>FloatermToggle<cr>", desc = "Toggle floatterm" },
  { "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Go to buffer 1" },
  { "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Go to buffer 2" },
  { "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Go to buffer 3" },
  { "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Go to buffer 4" },
  { "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Go to buffer 5" },

  -- Non-leader mappings
  { "n", "nzzzv", desc = "Next search result and center" },
  { "N", "Nzzzv", desc = "Previous search result and center" },
})

