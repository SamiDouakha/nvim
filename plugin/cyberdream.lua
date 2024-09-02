require("cyberdream").setup({
    -- Enable transparent background
    transparent = true,

    -- Enable italics comments
    italic_comments = false,

    -- Replace all fillchars with ' ' for the ultimate clean look
    hide_fillchars = false,

    -- Modern borderless telescope theme - also applies to fzf-lua
    borderless_telescope = false,

    -- Set terminal colors used in `:terminal`
    terminal_colors = true,

    -- Use caching to improve performance - WARNING: experimental feature - expect the unexpected!
    -- Early testing shows a 60-70% improvement in startup time. YMMV. Disables dynamic light/dark theme switching.
    cache = false, -- generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache

    theme = {
        variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
           -- Disable or enable colorscheme extensions
           },
    extensions = {
        telescope = true,
         cmp = true,
        gitsigns = true,
        nvimtree = false,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
    }
})
 vim.cmd("colorscheme cyberdream")
