return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    },
    config = function()
      local ts = require('telescope')
      
      ts.setup{
        defaults = {
          -- Default configuration for telescope goes here:
          -- config_key = value,
          mappings = {
            i = {
              -- map actions.which_key to <C-h> (default: <C-/>)
              -- actions.which_key shows the mappings for your picker,
              -- e.g. git_{create, delete, ...}_branch for the git_branches picker
              -- ["<C-h>"] = "which_key"
            }
          }
        },
        pickers = {
          -- Default configuration for builtin pickers goes here:
          -- picker_name = {
          --   picker_config_key = value,
          --   ...
          -- }
          -- Now the picker_config_key will be applied every time you call this
          -- builtin picker
        },
        extensions = {
          fzf = {
              fuzzy = true,                    -- false will only do exact matching
              override_generic_sorter = true,  -- override the generic sorter
              override_file_sorter = true,     -- override the file sorter
              case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                              -- the default case_mode is "smart_case"
              }
        }
      }


      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = "Fuzzy find files in cwd"})
      vim.keymap.set('n', '<leader>fs', builtin.live_grep, {desc = "Find string in cwd"})
      vim.keymap.set('n', '<leader>fc', builtin.grep_string, {desc = "Find string under cursor in cwd"})
      vim.keymap.set('n', '<leader>fr', builtin.oldfiles, {desc = "Fuzzy find recent files"})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = "Find buffers"})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = "Find help tags"})
      require('telescope').load_extension('fzf')
  end,
}
