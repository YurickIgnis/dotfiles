return {
  {
    -- Render de Markdown dentro del buffer.
    -- LazyVim lo configura sin iconos de encabezado y sin checkboxes.
    "MeanderingProgrammer/render-markdown.nvim",
    opts = function(_, opts)
      opts.heading = vim.tbl_deep_extend("force", opts.heading or {}, {
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      })
      opts.checkbox = vim.tbl_deep_extend("force", opts.checkbox or {}, { enabled = true })
      return opts
    end,
    keys = {
      {
        "<leader>cg",
        function()
          local file = vim.api.nvim_buf_get_name(0)
          if file == "" then
            vim.notify("Guarda el archivo antes de abrirlo con glow", vim.log.levels.WARN)
            return
          end
          if vim.bo.modified then
            pcall(vim.cmd, "silent write")
          end
          Snacks.terminal.toggle({ "glow", "-p", "-w", "0", file }, {
            cwd = vim.fn.fnamemodify(file, ":h"),
            interactive = true,
          })
        end,
        ft = "markdown",
        desc = "Glow (vista de terminal)",
      },
    },
  },
}
