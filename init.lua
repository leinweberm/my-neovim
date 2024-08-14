--[[
  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.
    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

   NOTE: Look for lines like this
    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.
--]]

-- Set <space> as the leader key
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.clipboard = 'unnamedplus'
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- neo-tree start
vim.keymap.set('n', '<C-n>', ':Neotree toggle<CR>', {
  desc = 'Toggle neo-tree visibility',
  silent = true,
  noremap = true,
})

-- move lines up / down
vim.keymap.set('n', '<C-Up>', ':m -2<CR>', {
  desc = 'Moves the line up',
  noremap = true,
})
vim.keymap.set('n', '<C-Down>', ':m +1<CR>', {
  desc = 'Moves the line down',
  noremap = true,
})

-- Todo-comments
vim.keymap.set('n', '<leader>lt', ':TodoTelescope keywords=TODO<CR>', {
  desc = '[T]odo comments',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>lb', ':TodoTelescope keywords=BUG<CR>', {
  desc = '[B]ug comments',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>lf', ':TodoTelescope keywords=FIXME,FIXIT<CR>', {
  desc = '[F]ix it',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>lo', ':TodoTelescope keywords=OPTIM,OPTIMIZE,PERFORMACE<CR>', {
  desc = '[Optimize] comments',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>li', ':TodoTelescope keywords=INFO,HINT<CR>', {
  desc = '[I]nfo comments',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>lw', ':TodoTelescope keywords=WARN,WARNING<CR>', {
  desc = '[W]arning comments',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>ls', ':TodoTelescope keywords=TESTING,FAILED,PASSED<CR>', {
  desc = 'Te[S]t comments',
  noremap = true,
  silent = true,
})

-- git editor
vim.keymap.set('n', '<leader>gd', ':DiffviewOpen<CR>', {
  desc = '[D]iffview open',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>ge', ':DiffviewClose<CR>', {
  desc = 'Diffview [E]xit',
  noremap = true,
  silent = true,
})
vim.keymap.set('v', '<leader>ge', ':DiffviewClose<CR>', {
  desc = 'Diffview [E]xit',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>gh', ':DiffviewFileHistory<CR>', {
  desc = '[H]istory of the file',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>gr', ':DiffviewRefresh<CR>', {
  desc = '[R]efresh diffview',
  noremap = true,
  silent = true,
})

-- folke/trouble
vim.keymap.set('n', '<leader>pd', ':Trouble diagnostics toggle<CR>', {
  desc = '[D]iagnostics toggle',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>pf', ':Trouble diagnostics toggle filter.buf=0<CR>', {
  desc = '[F]ilter diagnostics toggle',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>ps', ':Trouble symbols toggle focus=false<CR>', {
  desc = '[S]ymbols toggle',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>pl', ':Trouble lsp toggle focus=false win.position=right<CR>', {
  desc = '[L]SP Definitions / references / ...',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>pp', ':Trouble loclist toggle<CR>', {
  desc = '[P]osition / Location list',
  noremap = true,
  silent = true,
})
vim.keymap.set('n', '<leader>pq', ':Trouble qflist toggle<CR>', {
  desc = '[Q]uickfix list',
  noremap = true,
  silent = true,
})

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        enable_git_status = true,
        enable_diagnostics = true,
        sort_case_insensitive = true,
        sort_function = nil,
        default_component_config = {
          container = {
            enable_character_fade = true,
          },
          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_market = '|',
            last_indent_marker = '└',
            highlight = 'NeoTreeIndentMarker',
            with_expanders = nil,
            expander_collapsed = '⯅',
            expander_expanded = '⯆',
            expander_highlight = 'NeoTreeExpander',
          },
          icon = {
            folder_closed = '⯅',
            folder_open = '⯆',
            folder_empty = '·',
          },
          modified = {
            symbol = '[+]',
            highlight = 'NeoTreeModified',
          },
          name = {
            trailing_slach = false,
            use_git_status_colors = true,
            highlight = 'NeoTreeFileName',
          },
          git_status = {
            symbols = {
              added = '✚',
              modified = 'M',
              deleted = '✖',
              renamed = 'R',
              untracked = 'U',
              ignored = 'I',
              conflict = 'C',
              staged = 'S+',
              unstaged = 'S-',
            },
          },
        },
        commands = {},
        window = {
          position = 'left',
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ['<leader>'] = {
              'toggle_node',
              nowait = false,
            },
            ['o'] = 'open',
            ['<2-LeftMouse>'] = 'open',
            ['<esc>'] = 'cancel',
            ['P'] = {
              'toggle_preview',
              config = { use_float = false, use_image_nvim = false },
            },
            ['S'] = 'open_split',
            ['s'] = 'open_vsplit',
            ['C'] = 'close_node',
            ['z'] = 'close_all_nodes',
            ['a'] = 'add',
            ['A'] = 'add_directory',
            ['d'] = 'delete',
            ['r'] = 'rename',
            ['y'] = 'copy_to_clipboard',
            ['x'] = 'cut_to_clipboard',
            ['p'] = 'paste_from_clipboard',
            ['c'] = 'copy',
            ['m'] = 'move',
            ['q'] = 'close_window',
            ['R'] = 'refresh',
            ['?'] = 'show_help',
            ['<'] = 'prev_source',
            ['>'] = 'next_source',
            ['i'] = 'show_file_details',
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
            hide_gitignore = false,
            hide_hidden = false,
            hide_by_name = {},
            hide_by_pattern = {},
            always_show = {},
            always_show_pattern = {},
            never_show = {},
            never_show_by_pattern = {},
            follow_current_file = {
              enabled = false,
              leave_dirs_open = false,
            },
            group_empty_dirs = false,
            window = {
              mappings = {
                ['<bs>'] = 'navigate_up',
                ['.'] = 'set_root',
                ['H'] = 'toggle_hidden',
                ['/'] = 'fuzzy_finder',
                ['/d'] = 'fuzzy_finder_directory',
                ['#'] = 'fuzzy_sorter',
                ['#d'] = 'fuzzy_sorter_directory',
                ['<C-x>'] = 'clear_filter',
                ['[g'] = 'prev_git_modified',
                [']g'] = 'next_git_modified',
                ['oc'] = { 'order_by_created', nowait = false },
                ['od'] = { 'order_by_diagnostics', nowait = false },
                ['og'] = { 'order_by_git_status', nowait = false },
                ['om'] = { 'order_by_modified', nowait = false },
                ['on'] = { 'order_by_name', nowait = false },
                ['os'] = { 'order_by_size', nowait = false },
                ['ot'] = { 'order_by_type', nowait = false },
              },
              fuzzy_finder_mappings = { -- define keymaps for filter popup window in fuzzy_finder_mode
                ['<down>'] = 'move_cursor_down',
                ['<up>'] = 'move_cursor_up',
              },
            },
          },
        },
      }
    end,
  },
  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- git editor Neogit
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim'
    },
    config = true,
    tag = 'v.0.0.1'
  },

  -- autopair brackers for Nvim
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = true,
  },

  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {},
    keys = {
      {
        '<leader>c',
        function()
          require('which-key').show({ global = false })
        end,
        desc = '[C]ode'
      },
      {
        '<leader>d',
        function()
          require('which-key').show({ global = false })
        end,
        desc = '[D]ocument'
      },
      {
        '<leader>r',
        function()
          require('which-key').show({ global = false })
        end,
        desc = '[R]ename'
      },
      {
        '<leader>s',
        function()
          require('which-key').show({ global = false })
        end,
        desc = '[S]earch'
      },
      {
        '<leader>w',
        function()
          require('which-key').show({ global = false })
        end,
        desc = '[W]orkspace'
      },
      {
        '<leader>t',
        function()
          require('which-key').show({ global = false })
        end,
        desc = '[T]oggle'
      },
      {
        '<leader>h',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Git [H]unk'
      },
      {
        '<leader>l',
        function()
          require('which-key').show({ global = false })
        end,
        desc = '[L]ist'
      },
      {
        '<leader>g',
        function()
          require('which-key').show({ global = false })
        end,
        desc = '[G]it'
      },
      {
        '<leader>p',
        function()
          require('which-key').show({ global = false })
        end,
        desc = '[P]roblems'
      }
    }
  },

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- Todo comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    config = function()
      require('todo-comments').setup()
    end,
    keys = {
      {
        '[t',
        function()
          require('todo-comments').jump_prev()
        end,
        desc = 'Previous Todo comment',
      },
      {
        ']t',
        function()
          require('todo-comments').jump_next()
        end,
        desc = 'Next Todo comment',
      },
    },
  },

  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
          map('K', vim.lsp.buf.hover, 'Hover Documentation')
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local servers = {
        -- See `:help lspconfig-all` for a list of all the pre-configured LSPs
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        rust_analyzer = {},
        tsserver = {},
        astro = {},
        cobol_ls = {},
        cssls = {},
        cssmodules_ls = {},
        css_variables = {},
        dockerls = {},
        html = {},
        htmx = {},
        volar = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Folke Trouble
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      }
    }
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    lazy = false,
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {},
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }
    end,
  },

  { -- You can easily change to a different colorscheme.
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'ellisonleao/gruvbox.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'gruvbox'
      vim.o.background = 'dark'
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [']quote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'html' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    config = function(_, opts)
      -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

      require('nvim-treesitter.install').prefer_git = true
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup(opts)
    end,
  },

  require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
