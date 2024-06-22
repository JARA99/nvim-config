-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'akinsho/toggleterm.nvim',
    opts = {
      vim.keymap.set({ 'n', 't' }, 'tt', function()
        require('toggleterm').toggle()
      end, { desc = '[T]oggle[T]erm' }),
    },
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.g.codeium_manual = true

      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function()
        return vim.fn['codeium#Accept']()
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-.>', function()
        return vim.fn['codeium#CycleCompletions'](1)
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-,>', function()
        return vim.fn['codeium#CycleCompletions'](-1)
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-x>', function()
        return vim.fn['codeium#Clear']()
      end, { expr = true, silent = true })
      vim.keymap.set('i', '<C-/>', function()
        return vim.fn['codeium#Complete'](1)
      end, { expr = true, silent = true })
    end,
  },
  {
    'mechatroner/rainbow_csv',
  },
  {
    'goerz/jupytext.vim',
    config = function()
      vim.g.jupytext_fmt = 'py'
    end,
  },
  -- {
  --   'Vigemus/iron.nvim',
  --   config = function()
  --     require('iron.core').setup {
  --       config = {
  --         -- Whether a repl should be discarded or not
  --         scratch_repl = true,
  --         -- Your repl definitions come here
  --         repl_definition = {
  --           sh = {
  --             -- Can be a table or a function that
  --             -- returns a table (see below)
  --             command = { 'zsh' },
  --           },
  --           python = {
  --             command = { 'ipython' },
  --           },
  --         },
  --         -- How the repl window will be displayed
  --         -- See below for more information
  --         repl_open_cmd = require('iron.view').bottom(40),
  --       },
  --       -- Iron doesn't set keymaps by default anymore.
  --       -- You can set them here or manually add keymaps to the functions in iron.core
  --       keymaps = {
  --         send_motion = '<space>xc',
  --         visual_send = '<space>xc',
  --         send_file = '<space>xf',
  --         send_line = '<space>xl',
  --         send_paragraph = '<space>xp',
  --         send_until_cursor = '<space>xu',
  --         send_mark = '<space>xm',
  --         mark_motion = '<space>xmc',
  --         mark_visual = '<space>xmc',
  --         remove_mark = '<space>xmd',
  --         cr = '<space>x<cr>',
  --         interrupt = '<space>x<space>',
  --         exit = '<space>xq',
  --         clear = '<space>xl',
  --       },
  --       -- If the highlight is on, you can change how it looks
  --       -- For the available options, check nvim_set_hl
  --       highlight = {
  --         italic = true,
  --       },
  --     }
  --
  --     local view = require 'iron.view'
  --
  --     -- iron.setup {...
  --
  --     -- One can always use the default commands from vim directly
  --     repl_open_cmd = 'vertical botright 80 split'
  --
  --     -- But iron provides some utility functions to allow you to declare that dynamically,
  --     -- based on editor size or custom logic, for example.
  --
  --     -- Vertical 50 columns split
  --     -- Split has a metatable that allows you to set up the arguments in a "fluent" API
  --     -- you can write as you would write a vim command.
  --     -- It accepts:
  --     --   - vertical
  --     --   - leftabove/aboveleft
  --     --   - rightbelow/belowright
  --     --   - topleft
  --     --   - botright
  --     -- They'll return a metatable that allows you to set up the next argument
  --     -- or call it with a size parameter
  --     repl_open_cmd = view.split.vertical.botright(50)
  --
  --     -- If the supplied number is a fraction between 1 and 0,
  --     -- it will be used as a proportion
  --     repl_open_cmd = view.split.vertical.botright(0.61903398875)
  --
  --     -- The size parameter can be a number, a string or a function.
  --     -- When it's a *number*, it will be the size in rows/columns
  --     -- If it's a *string*, it requires a "%" sign at the end and is calculated
  --     -- as a percentage of the editor size
  --     -- If it's a *function*, it should return a number for the size of rows/columns
  --
  --     repl_open_cmd = view.split '40%'
  --
  --     -- You can supply custom logic
  --     -- to determine the size of your
  --     -- repl's window
  --     repl_open_cmd = view.split.topleft(function()
  --       if some_check then
  --         return vim.o.lines * 0.4
  --       end
  --       return 20
  --     end)
  --
  --     -- An optional set of options can be given to the split function if one
  --     -- wants to configure the window behavior.
  --     -- Note that, by default `winfixwidth` and `winfixheight` are set
  --     -- to `true`. If you want to overwrite those values,
  --     -- you need to specify the keys in the option map as the example below
  --
  --     repl_open_cmd = view.split('40%', {
  --       winfixwidth = false,
  --       winfixheight = false,
  --       -- any window-local configuration can be used here
  --       number = true,
  --     })
  --
  --     vim.keymap.set('n', '<space>xs', '<cmd>IronRepl<cr>', { desc = 'Iron e[X]ecute [S]tart' })
  --   end,
  -- },
}
