local awful = require("awful")
local beautiful = require("beautiful")

local M = {}

function M.get(clientkeys, clientbuttons)
  return {
    {
      rule = {},
      properties = {
        border_width = beautiful.border_width,
        border_color = beautiful.border_normal,
        focus = awful.client.focus.filter,
        raise = true,
        keys = clientkeys,
        buttons = clientbuttons,
        screen = awful.screen.preferred,
        placement = awful.placement.no_overlap + awful.placement.no_offscreen,
      },
    },
    {
      rule_any = {
        instance = {
          "copyq",
          "pinentry",
        },
        class = {
          "Arandr",
          "Blueman-manager",
          "Gpick",
          "Kruler",
          "Sxiv",
          "Tor Browser",
          "Wpa_gui",
          "veromix",
          "xtightvncviewer",
        },
        name = {
          "Event Tester",
        },
        role = {
          "AlarmWindow",
          "ConfigManager",
          "GtkFileChooserDialog",
          "pop-up",
        },
      },
      properties = { floating = true },
    },
    {
      rule_any = {
        class = {
          "Firefox",
          "firefox-esr",
        },
      },
      properties = { screen = 1, tag = "2" },
    },
  }
end

return M
