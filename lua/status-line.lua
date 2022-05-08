local gl = require('galaxyline')
local colors = require("galaxyline.highlighting")
local condition = require('galaxyline.condition')

local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer'}

-- Colors
local colors = {
  bg = '#282a36',
  fg = '#f8f8f2',
  section_bg = '#38393f',
  yellow = '#f1fa8c',
  cyan = '#8be9fd',
  green = '#50fa7b',
  orange = '#ffb86c',
  magenta = '#ff79c6',
  blue = '#8be9fd',
  red = '#ff5555'
}

-- Local helper functions
local mode_color = function()
  local mode_colors = {
    n = colors.cyan,
    i = colors.green,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red
  }

  local color = mode_colors[vim.fn.mode()]

  if color == nil then color = colors.red end

  return color
end

local function trailing_whitespace()
    local trail = vim.fn.search("\\s$", "nw")
    if trail ~= 0 then
        return " "
    else
        return nil
    end
 end

gls.left[1] = {
  RainbowRed = {
    provider = function() return '▊ ' end,
    highlight = {colors.blue,colors.bg}
  },
}
gls.left[2] = {
  FileIcon = {
    provider = 'FileIcon',
    highlight = {
      require('galaxyline.providers.fileinfo').get_file_icon_color
    }
  }
}
gls.left[3] = {
  FileName = {
    provider = 'FileName',
    highlight = {colors.fg},
    separator = " ",
    separator_highlight = {colors.section_bg, colors.bg}
  }
}
gls.left[4] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = condition.check_git_workspace,
    highlight = {colors.red, colors.bg}
  }
}
gls.left[5] = {
  GitBranch = {
    provider = function()
      local vcs = require('galaxyline.providers.vcs')
      local branch_name = vcs.get_git_branch()
      if (string.len(branch_name) > 28) then
        return string.sub(branch_name, 1, 25) .. "..."
      end
      return branch_name .. " "
    end,
    condition = condition.check_git_workspace,
    highlight = {colors.fg, colors.bg}
  }
}
gls.left[6] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.check_git_workspace,
    icon = ' ',
    highlight = {colors.green, colors.bg}
  }
}
gls.left[7] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.check_git_workspace,
    icon = ' ',
    highlight = {colors.orange, colors.bg}
  }
}
gls.left[8] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.check_git_workspace,
    icon = ' ',
    highlight = {colors.red, colors.bg}
  }
}
gls.left[9] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red}
  }
}
gls.left[10] = {
  Space = {
    provider = function() return ' ' end,
    highlight = {colors.section_bg}
  }
}
gls.left[11] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.orange}
  }
}
gls.left[12] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = {colors.fg}
  }
}
gls.left[13] = {
  Space = {
    provider = function() return ' ' end,
    highlight = {colors.section_bg}
  }
}
gls.left[14] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = {colors.blue},
    separator_highlight = {colors.section_bg, colors.bg}
  }
}

gls.mid[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ':',
  }
}

gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}
gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.green,colors.bg,'bold'}
  }
}
gls.right[3] = {
  FileSize = {
    provider = 'FileSize',
    separator = ' ',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg}
  }
}
gls.right[4] = {
  PerCent = {
    provider = 'LinePercent',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg,'bold'},
  }
}
gls.right[5] = {
  LineInfo = {
    provider = 'LineColumn',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.fg,colors.bg},
  },
}
gls.right[6] = {
  RainbowBlue = {
    provider = function() return ' ▊' end,
    highlight = {colors.blue,colors.bg}
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {'NONE',colors.bg},
    highlight = {colors.blue,colors.bg,'bold'}
  }
}
gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
    highlight = {colors.fg,colors.bg,'bold'}
  }
}
gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {colors.fg,colors.bg}
  }
}
