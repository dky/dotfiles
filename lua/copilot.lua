require('copilot').setup({
  panel = {
    enabled = false,
  },
  suggestion = {
    enabled = false,
  },
  filetypes = {
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    Dockerfile = false,
    ["."] = false,
  },
  copilot_node_command = 'node', -- Node.js version must be > 16.x
})
