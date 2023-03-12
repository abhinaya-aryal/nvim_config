return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  dependencies = {
    {"nvim-lua/plenary.nvim", lazy = true},
    {"nvim-tree/nvim-web-devicons", lazy = true},
    {"MunifTanjim/nui.nvim", lazy = true},
  },
  keys = {
    {"<leader>e", "<cmd>Neotree toggle<cr>", desc = "NeoTree"},
  },
  config = function() 
    vim.fn.sign_define("DiagnosticSignError",
        {text = " ", texthl = "DiagnosticSignError"})
      vim.fn.sign_define("DiagnosticSignWarn",
        {text = " ", texthl = "DiagnosticSignWarn"})
      vim.fn.sign_define("DiagnosticSignInfo",
        {text = " ", texthl = "DiagnosticSignInfo"})
      vim.fn.sign_define("DiagnosticSignHint",
        {text = "", texthl = "DiagnosticSignHint"})

        require("neo-tree").setup({
          close_if_last_window = false,
          popup_border_style = "rounded",
          enable_git_status = true,
          enable_diagnostics = true,
          sort_case_insensitive = false,
          sort_function = nil,
          default_component_configs = {
            container = {
              enable_character_fade = true
            },
          indent = {
            indent_size = 2,
            padding = 1, --extra padding on left hand side
            --indent guide
            with_markers = true,
            indent_markder = "|",
            last_indent_marker = "L",
            highlight = "NeoTreeIndentMarker",
            with_expanders = nil,
            expander_collapsed = " ",
            expander_expanded = " ",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_closed = "",
            folder_open = "",
            folder_empty = "ﰊ",
            -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
            -- then these will never be used.
            default = "*",
            highlight = "NeoTreeFileIcon"
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeFileIcon"
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              -- Change type
              added     = "✚", -- or "✚", but this is redundant info if you use git_status_colors on the name
              modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
              deleted   = "✖",-- this can only be used in the git_status source
              renamed   = "",-- this can only be used in the git_status source
              -- Status type
              untracked = "",
              ignored   = "",
              unstaged  = "",
              staged    = "",
              conflict  = "",
            },
          },
        },
          window = {
            position = "right",
            width = 25,
            mapping_options = {
              noremap = true,
              nowait = true,
            },
            mappings = {
              ["<space>"] = {
                "toggle_node",
                nowait = false,
              },
              ["<2-LeftMouse>"] = "open",
              ["<cr>"] = "open",
              ["<esc>"] = "revert_preview",
              ["P"] = { "toggle_preview", config = { use_float = true } },
              ["l"] = "focus_preview",
              ["S"] = "open_split",
              ["s"] = "open_vsplit",
            -- ["S"] = "split_with_window_picker",
            -- ["s"] = "vsplit_with_window_picker",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
            ["C"] = "close_node",
            -- ['C'] = 'close_all_subnodes',
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            ["a"] = { 
              "add",
              -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none" -- "none", "relative", "absolute"
              }
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
            ["d"] = "delete",
            ["r"] = "rename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            -- ["c"] = {
            --  "copy",
            --  config = {
            --    show_path = "none" -- "none", "relative", "absolute"
            --  }
            --}
             ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
          },
          },
          nesting_rules = {},
          filesystem = {
            filtered_items = {
              visible = false,
              hide_dotfiles = true,
              hide_gitignored = true,
              hide_hidden = true,
              hide_by_name = {
                -- "node_modules"
              },
              hide_by_pattern = { 
                -- "*.meta",
                -- "*/src/*/tsconfig.json",
              },
              always_show = {
                --".gitignored", --remians visible even if other settings would normally hide it
              },
              never_show = {
                -- ".DS_Store",
                -- "thumbs.db" --remains hidden even when visible is set to false
              },
              never_show_by_pattern = {
                -- ".null-ls_*",
              },
              follow_current_file = false, -- This will find and focus the file in the active buffer
              -- every time the current file is changed while the tree is open.
              group_empty_dirs = false, -- when true, empty folders grouped together
              hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory open neo-tree
              use_libuv_file_watcher = false, --This will use the OS level file watchers to detect changes instead of relying on nvim autocmd events.
              window = {
                mappings = {
                  ["<bs>"] = "navigate_up",
                  ["."] = "set_root",
                  ["H"] = "toggle_hidden",
                  ["/"] = "fuzzy_finder",
                  ["D"] = "fuzzy_finder_directory",
                  ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
              -- ["D"] = "fuzzy_sorter_directory",
              ["f"] = "filter_on_submit",
              ["<c-x>"] = "clear_filter",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
            },
          },
            },
            buffers = {
              follow_current_file = true,
              group_empty_dirs = true,
              show_unloaded = true,
              window = {
                mappings = {
                  ["bd"] = "buffer_delete",
                  ["<bs>"] = "navigate_up",
                  ["."] = "set_root",
                },
              },
            },
            git_status = {
              window = {
            position = "float",
            mappings = {
              ["A"]  = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
            },
          },
        }
          },
        })
      end
}
