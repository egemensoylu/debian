local gears = require("gears")
local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

local M = {}

function M.get(local_config)
  local modkey = local_config.modkey or "Mod4"
  local terminal = local_config.terminal or "x-terminal-emulator"
  local browser = local_config.browser or "firefox-esr"
  local editor_cmd = local_config.editor_cmd or "vim"
  local file_manager = local_config.file_manager or "xdg-open ."

  local clientkeys = gears.table.join(
    awful.key({ modkey }, "f", function(c) c.fullscreen = not c.fullscreen; c:raise() end,
      { description = "toggle fullscreen", group = "client" }),
    awful.key({ modkey, "Shift" }, "c", function(c) c:kill() end,
      { description = "close", group = "client" }),
    awful.key({ modkey, "Control" }, "space", awful.client.floating.toggle,
      { description = "toggle floating", group = "client" }),
    awful.key({ modkey, "Control" }, "Return", function(c) c:swap(awful.client.getmaster()) end,
      { description = "move to master", group = "client" }),
    awful.key({ modkey }, "o", function(c) c:move_to_screen() end,
      { description = "move to screen", group = "client" }),
    awful.key({ modkey }, "t", function(c) c.ontop = not c.ontop end,
      { description = "toggle keep on top", group = "client" }),
    awful.key({ modkey }, "n", function(c) c.minimized = true end,
      { description = "minimize", group = "client" }),
    awful.key({ modkey }, "m", function(c) c.maximized = not c.maximized; c:raise() end,
      { description = "(un)maximize", group = "client" })
  )

  local clientbuttons = gears.table.join(
    awful.button({}, 1, function(c)
      c:emit_signal("request::activate", "mouse_click", { raise = true })
    end),
    awful.button({ modkey }, 1, function(c)
      c:emit_signal("request::activate", "mouse_click", { raise = true })
      awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function(c)
      c:emit_signal("request::activate", "mouse_click", { raise = true })
      awful.mouse.client.resize(c)
    end)
  )

  local globalkeys = gears.table.join(
    awful.key({ modkey }, "s", hotkeys_popup.show_help,
      { description = "show help", group = "awesome" }),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
      { description = "reload awesome", group = "awesome" }),
    awful.key({ modkey, "Shift" }, "q", awesome.quit,
      { description = "quit awesome", group = "awesome" }),

    awful.key({ modkey }, "Return", function() awful.spawn(terminal) end,
      { description = "open terminal", group = "launcher" }),
    awful.key({ modkey }, "r", function() awful.spawn("rofi -show drun") end,
      { description = "run app launcher", group = "launcher" }),
    awful.key({ modkey }, "b", function() awful.spawn(browser) end,
      { description = "open browser", group = "launcher" }),
    awful.key({ modkey }, "e", function() awful.spawn(file_manager) end,
      { description = "open file manager", group = "launcher" }),
    awful.key({ modkey }, "p", function() awful.spawn(terminal .. " -e " .. editor_cmd) end,
      { description = "open editor in terminal", group = "launcher" }),

    awful.key({ modkey }, "Left", awful.tag.viewprev,
      { description = "view previous tag", group = "tag" }),
    awful.key({ modkey }, "Right", awful.tag.viewnext,
      { description = "view next tag", group = "tag" }),
    awful.key({ modkey }, "Escape", awful.tag.history.restore,
      { description = "go back", group = "tag" }),

    awful.key({ modkey }, "j", function() awful.client.focus.byidx(1) end,
      { description = "focus next window", group = "client" }),
    awful.key({ modkey }, "k", function() awful.client.focus.byidx(-1) end,
      { description = "focus previous window", group = "client" }),
    awful.key({ modkey, "Shift" }, "j", function() awful.client.swap.byidx(1) end,
      { description = "swap with next client", group = "client" }),
    awful.key({ modkey, "Shift" }, "k", function() awful.client.swap.byidx(-1) end,
      { description = "swap with previous client", group = "client" }),

    awful.key({ modkey }, "l", function() awful.tag.incmwfact(0.05) end,
      { description = "increase master width", group = "layout" }),
    awful.key({ modkey }, "h", function() awful.tag.incmwfact(-0.05) end,
      { description = "decrease master width", group = "layout" }),
    awful.key({ modkey, "Shift" }, "h", function() awful.tag.incnmaster(1, nil, true) end,
      { description = "increase master clients", group = "layout" }),
    awful.key({ modkey, "Shift" }, "l", function() awful.tag.incnmaster(-1, nil, true) end,
      { description = "decrease master clients", group = "layout" }),
    awful.key({ modkey, "Control" }, "h", function() awful.tag.incncol(1, nil, true) end,
      { description = "increase columns", group = "layout" }),
    awful.key({ modkey, "Control" }, "l", function() awful.tag.incncol(-1, nil, true) end,
      { description = "decrease columns", group = "layout" }),

    awful.key({}, "Print", function() awful.spawn.with_shell('maim -s "$HOME/Pictures/screenshots/$(date +%Y%m%d-%H%M%S).png"') end,
      { description = "take screenshot", group = "launcher" }),
    awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn("pamixer -i 5") end,
      { description = "volume up", group = "media" }),
    awful.key({}, "XF86AudioLowerVolume", function() awful.spawn("pamixer -d 5") end,
      { description = "volume down", group = "media" }),
    awful.key({}, "XF86AudioMute", function() awful.spawn("pamixer -t") end,
      { description = "mute audio", group = "media" }),
    awful.key({}, "XF86AudioPlay", function() awful.spawn("playerctl play-pause") end,
      { description = "play/pause", group = "media" }),
    awful.key({}, "XF86AudioNext", function() awful.spawn("playerctl next") end,
      { description = "next track", group = "media" }),
    awful.key({}, "XF86AudioPrev", function() awful.spawn("playerctl previous") end,
      { description = "previous track", group = "media" }),
    awful.key({}, "XF86MonBrightnessUp", function() awful.spawn("brightnessctl set +10%") end,
      { description = "brightness up", group = "media" }),
    awful.key({}, "XF86MonBrightnessDown", function() awful.spawn("brightnessctl set 10%-") end,
      { description = "brightness down", group = "media" })
  )

  for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
      awful.key({ modkey }, "#" .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          tag:view_only()
        end
      end, { description = "view tag #" .. i, group = "tag" }),
      awful.key({ modkey, "Control" }, "#" .. i + 9, function()
        local screen = awful.screen.focused()
        local tag = screen.tags[i]
        if tag then
          awful.tag.viewtoggle(tag)
        end
      end, { description = "toggle tag #" .. i, group = "tag" }),
      awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:move_to_tag(tag)
          end
        end
      end, { description = "move focused client to tag #" .. i, group = "tag" }),
      awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
        if client.focus then
          local tag = client.focus.screen.tags[i]
          if tag then
            client.focus:toggle_tag(tag)
          end
        end
      end, { description = "toggle focused client on tag #" .. i, group = "tag" })
    )
  end

  return {
    globalkeys = globalkeys,
    clientkeys = clientkeys,
    clientbuttons = clientbuttons,
  }
end

return M
