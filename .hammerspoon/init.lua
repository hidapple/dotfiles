local prefix = {"cmd", "ctrl"}

-- Maximize window size
hs.hotkey.bind(prefix, "Up", function()
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

-- Resize window to fill half of left side of screen
hs.hotkey.bind(prefix, "Left", function()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local screen = window:screen()
  local max = screen:frame()

  frame.x = max.x
  frame.y = max.y
  frame.w = max.w / 2
  frame.h = max.h

  window:setFrame(frame)
end)

-- Resize window to fill half of right side of screen
hs.hotkey.bind(prefix, "Right", function()
  local window = hs.window.focusedWindow()
  local frame = window:frame()
  local screen = window:screen()
  local max = screen:frame()

  frame.x = max.x + max.w / 2
  frame.y = max.y
  frame.w = max.w / 2
  frame.h = max.h

  window:setFrame(frame)
end)

