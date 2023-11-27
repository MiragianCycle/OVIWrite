return 
{
  "goolord/alpha-nvim",
  event = "VimEnter",
  enabled = true,
  init = false,
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[   

                                                                                                                                         
    ,o888888o.     `8.`888b           ,8'  8 8888 `8.`888b                 ,8' 8 888888888o.    8 8888 8888888 8888888888 8 8888888888   
 . 8888     `88.    `8.`888b         ,8'   8 8888  `8.`888b               ,8'  8 8888    `88.   8 8888       8 8888       8 8888         
,8 8888       `8b    `8.`888b       ,8'    8 8888   `8.`888b             ,8'   8 8888     `88   8 8888       8 8888       8 8888         
88 8888        `8b    `8.`888b     ,8'     8 8888    `8.`888b     .b    ,8'    8 8888     ,88   8 8888       8 8888       8 8888         
88 8888         88     `8.`888b   ,8'      8 8888     `8.`888b    88b  ,8'     8 8888.   ,88'   8 8888       8 8888       8 888888888888 
88 8888         88      `8.`888b ,8'       8 8888      `8.`888b .`888b,8'      8 888888888P'    8 8888       8 8888       8 8888         
88 8888        ,8P       `8.`888b8'        8 8888       `8.`888b8.`8888'       8 8888`8b        8 8888       8 8888       8 8888         
`8 8888       ,8P         `8.`888'         8 8888        `8.`888`8.`88'        8 8888 `8b.      8 8888       8 8888       8 8888         
 ` 8888     ,88'           `8.`8'          8 8888         `8.`8' `8,`'         8 8888   `8b.    8 8888       8 8888       8 8888         
    `8888888P'              `8.`           8 8888          `8.`   `8'          8 8888     `88.  8 8888       8 8888       8 888888888888 
                                                           
                                                                     


					<An Integrated Writing Environment (IWE) built using NeoVim's Ecosystem>
							<@theenaKumaraG, Miragian Studios>
    ]]
    dashboard.section.header.val = vim.split(logo, "\n")




    -- stylua: ignore
    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file",       "<cmd> Telescope find_files <cr>"),
      dashboard.button("n", " " .. " New file",        "<cmd> ene <BAR> startinsert <cr>"),
      dashboard.button("r", " " .. " Recent files",    "<cmd> Telescope oldfiles <cr>"),
      dashboard.button("g", " " .. " Find text",       "<cmd> Telescope live_grep <cr>"),
      dashboard.button("l", "󰒲 " .. " Lazy",            "<cmd> Lazy <cr>"),
      dashboard.button("q", " " .. " Quit",            "<cmd> qa <cr>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      once = true,
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}

