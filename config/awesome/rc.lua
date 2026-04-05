pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")

local function load_local_config()
  local config_dir = gears.filesystem.get_configuration_dir()
  local local_path = config_dir .. "local.lua"
  local example_path = config_dir .. "local.lua.example"

  local file = io.open(local_path, "r")
  if file then
    file:close()
    return dofile(local_path)
  end

  return dofile(example_path)
end

local theme_path = gears.filesystem.get_configuration_dir() .. "themes/egemen/theme.lua"
beautiful.init(theme_path)

local local_config = load_local_config()
local widgets = require("widgets")
local keymap = require("keys").get(local_config)
local rules = require("rules").get(keymap.clientkeys, keymap.clientbuttons)
require("signals")

if awesome.startup_errors then
  naughty.notify({
    preset = naughty.config.presets.critical,
    title = "AwesomeWM startup errors",
    text = awesome.startup_errors,
  })
end

do
  local in_error = false
  awesome.connect_signal("debug::error", function(err)
    if in_error then
      return
    end
    in_error = true
    naughty.notify({
      preset = naughty.config.presets.critical,
      title = "AwesomeWM runtime error",
      text = tostring(err),
    })
    in_error = false
  end)
end

menubar.utils.terminal = local_config.terminal

awful.layout.layouts = {
  awful.layout.suit.tile,
  awful.layout.suit.tile.left,
  awful.layout.suit.tile.bottom,
  awful.layout.suit.fair,
  awful.layout.suit.max,
  awful.layout.suit.floating,
}

root.buttons(gears.table.join(
  awful.button({}, 3, function() awful.spawn("rofi -show drun") end),
  awful.button({}, 4, awful.tag.viewnext),
  awful.button({}, 5, awful.tag.viewprev)
))

root.keys(keymap.globalkeys)

local function set_wallpaper(s)
  local wallpaper = local_config.wallpaper or beautiful.wallpaper
  if type(wallpaper) == "function" then
    wallpaper = wallpaper(s)
  end
  if wallpaper and #wallpaper > 0 then
    gears.wallpaper.maximized(wallpaper, s, true)
  end
end

screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
  set_wallpaper(s)

  local tags = local_config.tags or { "1", "2", "3", "4", "5", "6", "7", "8", "9" }
  awful.tag(tags, s, awful.layout.layouts[1])

  s.promptbox = awful.widget.prompt()
  s.layoutbox = awful.widget.layoutbox(s)
  s.layoutbox:buttons(gears.table.join(
    awful.button({}, 1, function() awful.layout.inc(1) end),
    awful.button({}, 3, function() awful.layout.inc(-1) end),
    awful.button({}, 4, function() awful.layout.inc(1) end),
    awful.button({}, 5, function() awful.layout.inc(-1) end)
  ))

  s.taglist = awful.widget.taglist {
    screen = s,
    filter = awful.widget.taglist.filter.all,
  }

  s.tasklist = awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
  }

  s.wibar = awful.wibar({ position = "top", screen = s })
  s.wibar:setup {
    layout = wibox.layout.align.horizontal,
    { layout = wibox.layout.fixed.horizontal, s.taglist, s.promptbox },
    s.tasklist,
    {
      layout = wibox.layout.fixed.horizontal,
      widgets.create_keyboard_layout(),
      widgets.create_text_clock(),
      s.layoutbox,
    },
  }
end)

awful.rules.rules = rules

awful.spawn.with_shell("mkdir -p "$HOME/Pictures/screenshots"")

local autostart_script = gears.filesystem.get_configuration_dir() .. "autostart.sh"
awful.spawn.with_shell("sh " .. string.format("%q", autostart_script))

if local_config.autorun and type(local_config.autorun) == "table" then
  for _, command in ipairs(local_config.autorun) do
    awful.spawn.with_shell(command)
  end
end
