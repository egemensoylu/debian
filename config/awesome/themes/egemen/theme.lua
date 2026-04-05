local theme = {}

theme.font = "sans 10"

theme.bg_normal = "#111111"
theme.bg_focus = "#1f1f1f"
theme.bg_urgent = "#aa3333"
theme.bg_minimize = "#222222"

theme.fg_normal = "#d0d0d0"
theme.fg_focus = "#ffffff"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#9a9a9a"

theme.useless_gap = 6
theme.border_width = 2
theme.border_normal = "#2e2e2e"
theme.border_focus = "#6a9fb5"
theme.border_marked = "#c678dd"

theme.wallpaper = os.getenv("HOME") .. "/Pictures/wallpapers/default.jpg"

return theme
