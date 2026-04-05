local awful = require("awful")
local wibox = require("wibox")

local M = {}

function M.create_text_clock()
  return wibox.widget.textclock("%a %d %b  %H:%M ")
end

function M.create_keyboard_layout()
  return awful.widget.keyboardlayout()
end

return M
