-- Parsers must be installed manually via :TSInstall
local M = {}

M.config = function()
  local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')

  if not status_ok then
    return
  end

  treesitter.setup {
    ensure_installed = {
      'css',
      'graphql',
      'html',
      'javascript',
      'typescript',
      'python',
      'regex',
      'bash',
      'toml',
      'yaml',
      'json',
      'lua',
      'tsx'
    },

    highlight = {
      enable = true, -- false will disable the whole extension
      use_languagetree = true,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = 'gnn',
        node_incremental = 'grn',
        scope_incremental = 'grc',
        node_decremental = 'grm',
      },
    },

    indent = {
      enable = true,
    },

    textobjects = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },

      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },

        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },

        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },

        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
    },

    context_commentstring = {
      enable = true
    },

    refactor = {
      smart_rename = {
        enable = true,
        keymaps = {
          smart_rename = "grr",
        },
      },

      navigation = {
        enable = true,
        keymaps = {
          goto_definition = "<leader>td",
          list_definitions = "<leader>tl"
        }
      },
    },

    rainbow = {
      enable = true,
      extended_mode = true,
      max_file_lines = 1000,
    },

    autotag = {
      enable = true,
      filetypes = {
        'html',
        'javascriptreact',
        'typescriptreact',
      },

      skip_tags = {
        'input',
        'link',
        'img',
      },
    },

    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner'
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner'
      }
    },

    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer'
      },
      goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer'
      },
      goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer'
      },
      goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer'
      }
    }
  }
end

return M

