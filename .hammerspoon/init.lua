-- Maximize window size: Command + Option + ↑
hs.hotkey.bind({"cmd", "alt"}, "UP", function()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local screen = window:screen()
  local max = screen:frame()

  frame.x = max.x
  frame.y = max.y
  frame.w = max.w
  frame.h = max.h

  window:setFrame(frame)
end)

