require('spaces')
-- Screens
local main_monitor = "BenQ EW3270U"
local second_monitor = "DELL U2718Q"
local laptopmonitor = "Color LCD"
-------------------------------------------------------------------------------
-- real configuration
-------------------------------------------------------------------------------
-- variable config
hs.window.animationDuration = 0
hs.window.setShadows(false)

-- extensions, available in hammerspoon console
ext = {
  frame    = {},
  win      = {},
  app      = {},
  utils    = {},
  cache    = {},
  watchers = {}
}

local mash      = {"cmd", "alt", "ctrl"}
local mash_apps = {"cmd", "alt"}
local shiftpushkey= {"⌃", "⌘", "⇧"}
local commandoption = {"cmd", "alt"}
local commandctrl = {"cmd","ctrl"}
local optionctrl = {"alt","ctrl"}
local commandctrlshift = {"command","ctrl","⇧"}


-- find applicaiton names hs.fnutils.each(hs.application.runningApplications(), function(app) print(app:title()) end)
-- inspired on https://github.com/rtoshiro/hammerspoon-init/blob/master/init.lua
local layout_code = {
  {
    name = {"Visual Studio Code"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(main_monitor))
        pushWindow(win,0,0,1,1)
    end
  },{
    name = {"Terminal"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(laptopmonitor))
        pushWindow(win,0,0,1,1)
    end
  },
  {
    name = {"Safari"},
    func = function(index, win)
      win:moveToScreen(hs.screen.get(second_monitor))
      pushWindow(win,0,0,1,1)
    end
  }
}

local layout_messaging = {

  {
    name = {"Slack"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(main_monitor))
        pushWindow(win,0,0,0.5,1) 
    end
  },
  {
    name = {"Mail"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(main_monitor))
        pushWindow(win,0.5,0,0.5,1) 
    end
  },
  {
    name = {"Safari"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(second_monitor))
        pushWindow(win,0,0,1,1)
    end
  },
  {
    name = {"Finder"},
    func = function(index, win)
      win:moveToScreen(hs.screen.get(laptopmonitor))
      pushWindow(win, 0,0,1,1)
    end
  }
}

local layout_entertainment = {

  {
    name = {"Safari"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(main_monitor))
        pushWindow(win,0,0,1,1) 
    end
  }
}
local layout_research = {

  {
    name = {"Mendeley Desktop"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(main_monitor))
        pushWindow(win,0,0,0.5,1) 
    end
  },
  {
    name = {"Safari"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(main_monitor))
        pushWindow(win,0.5,0,0.5,1)
    end
  },
  {
    name = {"Notion"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(second_monitor))
        pushWindow(win,0,0,1,1)
    end
  },{
    name = {"Terminal"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(laptopmonitor))
        pushWindow(win,0,0,1,1)
    end
  }

}
local layout_search = {

  {
    name = {"Safari"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(main_monitor))
        pushWindow(win,0,0,1,1) 
    end
  },
  {
    name = {"Notion"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(second_monitor))
        pushWindow(win,0,0,1,1)
    end
  },{
    name = {"Terminal"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(laptopmonitor))
        pushWindow(win,0,0,1,1)
    end
  }

}

local layout_thesis = {

  {
    name = {"Visual Studio Code"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(main_monitor))
        pushWindow(win,0.5,0,0.5,1) 
    end
  },
  {
    name = {"Safari"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(second_monitor))
        pushWindow(win,0,0,1,1)
    end
  },
  {
    name = {"Mendeley Desktop"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(main_monitor))
        pushWindow(win,0,0,0.5,1)
    end
  },{
    name = {"Terminal"},
    func = function(index, win)
        win:moveToScreen(hs.screen.get(laptopmonitor))
        pushWindow(win,0,0,1,1)
    end
  }

}
-------------------------------------------------------------------------------
-- positioning windows on screen
-- https://github.com/exark/dotfiles/blob/master/.hammerspoon/init.lua
-------------------------------------------------------------------------------
hs.hotkey.bind(optionctrl,"left", function() push(0,0,(1/3),1) end)             -- left small
hs.hotkey.bind(commandctrl,"left", function() push(0,0,(1/3*2),1) end)         -- left two third
hs.hotkey.bind(optionctrl,"right", function() push((1/3*2),0,(1/3),1) end)     -- right small
hs.hotkey.bind(commandctrl,"right", function() push((1/3),0,(1/3*2),1) end)     -- right two third
hs.hotkey.bind(commandoption,"left", function() push(0,0,0.5,1) end)           -- left half
hs.hotkey.bind(commandoption,"right", function() push(0.5,0,0.5,1) end)           -- right half

hs.hotkey.bind(commandctrl,"space", function() push(0.1,0,0.8,1) end)       -- middle
hs.hotkey.bind(optionctrl,"space", function() push((1/3),0,(1/3),1) end)       -- middle small

hs.hotkey.bind(optionctrl,"up", function() push(0,0,1,(1/3)) end)             -- up small
hs.hotkey.bind(commandctrl,"up", function() push(0,0,1,(1/3*2)) end)         -- up two third
hs.hotkey.bind(optionctrl,"down", function() push(0,(1/3*2),1, (1/3)) end)     -- down small
hs.hotkey.bind(commandctrl,"down", function() push(0, (1/3), 1, (1/3*2)) end)     -- down two third
hs.hotkey.bind(commandoption,"up", function() push(0,0,1,0.5) end)           -- up half
hs.hotkey.bind(commandoption,"down", function() push(0,0.5,1,0.5) end)           -- down half

hs.hotkey.bind(commandctrlshift,"space", function() push(0,0.1, 1, 0.8) end)       -- middle

hs.hotkey.bind(commandoption,"space", function() push(0,0,1,1) end)           -- full screen
hs.hotkey.bind(mash, "space", function() push(0.05,0.05,0.9,0.9) end)

-- Move a window between monitors
hs.hotkey.bind(shiftpushkey, "left", function() hs.window.focusedWindow():moveOneScreenWest() end)
hs.hotkey.bind(shiftpushkey, "right", function() hs.window.focusedWindow():moveOneScreenEast() end)
hs.hotkey.bind(shiftpushkey, "down", function() hs.window.focusedWindow():moveOneScreenSouth() end)
hs.hotkey.bind(shiftpushkey, "up", function() hs.window.focusedWindow():moveOneScreenNorth() end)

hs.hotkey.bind(commandoption, "1", function() applyLayouts(layout_code) end)
hs.hotkey.bind(commandoption, "2", function() applyLayouts(layout_search) end)
hs.hotkey.bind(commandoption, "3", function() applyLayouts(layout_research) end)
hs.hotkey.bind(commandoption, "4", function() applyLayouts(layout_thesis) end)
hs.hotkey.bind(commandoption, "5", function() applyLayouts(layout_messaging) end)
hs.hotkey.bind(commandoption, "6", function() applyLayouts(layout_entertainment) end)

hs.hotkey.bind(mash, "d", function()
  --for win in hs.window.allWindows() do
  for _, win in ipairs(hs.window.allWindows()) do
    if win then
      win:minimize()
    else
      print("Found a nil window for: "..win:application():name())
    end
  end 
end)

-------------------------------------------------------------------------------
-- reload configuration
-------------------------------------------------------------------------------
hs.hotkey.bind(mash, "R", function()
  hs.reload()
  print('config reloaded')
end)


-- launch and focus applications with below shortkey
hs.fnutils.each({
  { key = "u", app = "Mail" },
  { key = "i", app = "Todoist" },
  { key = "k", app = "Safari" },
  { key = "j", app = "Terminal" },
  { key = "o", app = "Calender" },
  { key = "m", app = "Music" },
  { key = "l", app = "Finder" }
}, function(object)
    hs.hotkey.bind(mash_apps, object.key, function() ext.app.forceLaunchOrFocus(object.app) end) 
end)

-- functions below

-------------------------------------------------------------------------------
-- from https://github.com/exark/dotfiles/blob/master/.hammerspoon/init.lua
-- Resize window for chunk of screen.
-- For x and y: use 0 to expand fully in that dimension, 0.5 to expand halfway
-- For w and h: use 1 for full, 0.5 for half
-------------------------------------------------------------------------------
function push(x, y, w, h)
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w*x)
  f.y = max.y + (max.h*y)
  f.w = max.w*w
  f.h = max.h*h
  win:setFrame(f)
end

function pushWindow(win, x, y, w, h)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w*x)
  f.y = max.y + (max.h*y)
  f.w = max.w*w
  f.h = max.h*h
  win:setFrame(f)
end


-- https://github.com/szymonkaliski/Dotfiles/blob/b5a640336efc9fde1e8048c2894529427746076f/Dotfiles/hammerspoon/init.lua#L411-L440
function ext.app.forceLaunchOrFocus(appName)
  -- first focus with hammerspoon
  hs.application.launchOrFocus(appName)

  -- clear timer if exists
  if ext.cache.launchTimer then ext.cache.launchTimer:stop() end

  -- wait 500ms for window to appear and try hard to show the window
  ext.cache.launchTimer = hs.timer.doAfter(0.5, function()
    local frontmostApp     = hs.application.frontmostApplication()
    local frontmostWindows = hs.fnutils.filter(frontmostApp:allWindows(), function(win) return win:isStandard() end)

    -- break if this app is not frontmost (when/why?)
    if frontmostApp:title() ~= appName then
      print('Expected app in front: ' .. appName .. ' got: ' .. frontmostApp:title())
      return
    end

    if #frontmostWindows == 0 then
      -- check if there's app name in window menu (Calendar, Messages, etc...)
      if frontmostApp:findMenuItem({ 'Window', appName }) then
        -- select it, usually moves to space with this window
        frontmostApp:selectMenuItem({ 'Window', appName })
      else
        -- otherwise send cmd-n to create new window
        hs.eventtap.keyStroke({ 'cmd' }, 'n')
      end
    end
  end)
end

-- a helper function that returns another function that resizes the current window
-- to a certain grid size.
local gridset = function(x, y, w, h)
    return function()
        cur_window = window.focusedwindow()
        hs.grid.set(
            cur_window,
            {x=x, y=y, w=w, h=h},
            cur_window:screen()
        )
    end
end

-- smart app launch or focus or cycle windows
function ext.app.smartLaunchOrFocus(launchApps)
  local frontmostWindow = hs.window.frontmostWindow()
  local runningApps     = hs.application.runningApplications()
  local runningWindows  = {}

  -- filter running applications by apps array
  local runningApps = hs.fnutils.map(launchApps, function(launchApp)
    return hs.application.get(launchApp)
  end)

  -- create table of sorted windows per application
  hs.fnutils.each(runningApps, function(runningApp)
    local standardWindows = hs.fnutils.filter(runningApp:allWindows(), function(win)
      return win:isStandard()
    end)

    table.sort(standardWindows, function(a, b) return a:id() < b:id() end)

    runningWindows = standardWindows
  end)

  if #runningApps == 0 then
    -- if no apps are running then launch first one in list
    ext.app.forceLaunchOrFocus(launchApps[1])
  elseif #runningWindows == 0 then
    -- if some apps are running, but no windows - force create one
    ext.app.forceLaunchOrFocus(runningApps[1]:title())
  else
    -- check if one of windows is already focused
    local currentIndex = hs.fnutils.indexOf(runningWindows, frontmostWindow)

    if not currentIndex then
      -- if none of them is selected focus the first one
      runningWindows[1]:focus()
    else
      -- otherwise cycle through all the windows
      local newIndex = currentIndex + 1
      if newIndex > #runningWindows then newIndex = 1 end

      runningWindows[newIndex]:focus()
    end
  end
end

--------------------------------------------------------------------------------
-- METHODS - BECAREFUL :)
--------------------------------------------------------------------------------
function applyLayout(layouts, app)
  if (app) then
    local appName = app:title()

    for i, layout in ipairs(layouts) do
      if (type(layout.name) == "table") then
        for i, layAppName in ipairs(layout.name) do
          if (layAppName == appName) then
            hs.alert.show(appName)
          
            local wins = app:allWindows()
            local counter = 1
            for j, win in ipairs(wins) do
              if (win:isVisible() and layout.func) then
                layout.func(counter, win)
                counter = counter + 1
              end
            end
          end
        end
      elseif (type(layout.name) == "string") then
        if (layout.name == appName) then
          local wins = app:allWindows()
          local counter = 1
          for j, win in ipairs(wins) do
            if (win:isVisible() and layout.func) then
              layout.func(counter, win)
              counter = counter + 1
            end
          end
        end
      end
    end
  end
end

function applyLayouts(layouts)
  for _, win in ipairs(hs.window.allWindows()) do
    if win then
      -- win:minimize()
      local app = win:application()

      if (app:title() == "Visual Studio Code") then
        app = hs.application.find("Code")
      end
      app:hide()
    else
      print("Found a nil window for: "..win:application():name())
    end
  end 

  for i, layout in ipairs(layouts) do
    if (type(layout.name) == "table") then
      --hs.alert.show("Applying Layout in table")
      for i, appName in ipairs(layout.name) do
        print("Applying Layout in table i -> " .. i)
        print("Applying Layout in table appName -> " .. appName)
        -- focus or launch
        ext.app.forceLaunchOrFocus(appName)
        if (appName == "Visual Studio Code") then
          appName = "Code"
        end
        local app = hs.application.find(appName)
        
        if (app) then
          local wins = app:allWindows()
          local counter = 1
          for j, win in ipairs(wins) do
            if (win:isVisible() and layout.func) then
              layout.func(counter, win)
              counter = counter + 1
            end
          end
        end
      end
    elseif (type(layout.name) == "string") then
      --hs.alert.show("Applying Layout in string")
      ext.app.forceLaunchOrFocus(appName)
      local app = hs.appfinder.appFromName(layout.name)
      if (app) then
        local wins = app:allWindows()
        local counter = 1
        for j, win in ipairs(wins) do
          if (win:isVisible() and layout.func) then
            layout.func(counter, win)
            counter = counter + 1
          end
        end
      end
    end
  end
end

function hs.screen.get(screen_name)
  local allScreens = hs.screen.allScreens()
  for i, screen in ipairs(allScreens) do
    if screen:name() == screen_name then
      return screen
    end
  end
end

-- Returns the width of the smaller screen size
-- isFullscreen = false removes the toolbar
-- and dock sizes
function hs.screen.minWidth(isFullscreen)
  local min_width = math.maxinteger
  local allScreens = hs.screen.allScreens()
  for i, screen in ipairs(allScreens) do
    local screen_frame = screen:frame()
    if (isFullscreen) then
      screen_frame = screen:fullFrame()
    end
    min_width = math.min(min_width, screen_frame.w)
  end
  return min_width
end

-- isFullscreen = false removes the toolbar
-- and dock sizes
-- Returns the height of the smaller screen size
function hs.screen.minHeight(isFullscreen)
  local min_height = math.maxinteger
  local allScreens = hs.screen.allScreens()
  for i, screen in ipairs(allScreens) do
    local screen_frame = screen:frame()
    if (isFullscreen) then
      screen_frame = screen:fullFrame()
    end
    min_height = math.min(min_height, screen_frame.h)
  end
  return min_height
end

-- If you are using more than one monitor, returns X
-- considering the reference screen minus smaller screen
-- = (MAX_REFSCREEN_WIDTH - MIN_AVAILABLE_WIDTH) / 2
-- If using only one monitor, returns the X of ref screen
function hs.screen.minX(refScreen)
  local min_x = refScreen:frame().x
  local allScreens = hs.screen.allScreens()
  if (#allScreens > 1) then
    min_x = refScreen:frame().x + ((refScreen:frame().w - hs.screen.minWidth()) / 2)
  end
  return min_x
end

-- If you are using more than one monitor, returns Y
-- considering the focused screen minus smaller screen
-- = (MAX_REFSCREEN_HEIGHT - MIN_AVAILABLE_HEIGHT) / 2
-- If using only one monitor, returns the Y of focused screen
function hs.screen.minY(refScreen)
  local min_y = refScreen:frame().y
  local allScreens = hs.screen.allScreens()
  if (#allScreens > 1) then
    min_y = refScreen:frame().y + ((refScreen:frame().h - hs.screen.minHeight()) / 2)
  end
  return min_y
end

-- If you are using more than one monitor, returns the
-- half of minX and 0
-- = ((MAX_REFSCREEN_WIDTH - MIN_AVAILABLE_WIDTH) / 2) / 2
-- If using only one monitor, returns the X of ref screen
function hs.screen.almostMinX(refScreen)
  local min_x = refScreen:frame().x
  local allScreens = hs.screen.allScreens()
  if (#allScreens > 1) then
    min_x = refScreen:frame().x + (((refScreen:frame().w - hs.screen.minWidth()) / 2) - ((refScreen:frame().w - hs.screen.minWidth()) / 4))
  end
  return min_x
end

-- If you are using more than one monitor, returns the
-- half of minY and 0
-- = ((MAX_REFSCREEN_HEIGHT - MIN_AVAILABLE_HEIGHT) / 2) / 2
-- If using only one monitor, returns the Y of ref screen
function hs.screen.almostMinY(refScreen)
  local min_y = refScreen:frame().y
  local allScreens = hs.screen.allScreens()
  if (#allScreens > 1) then
    min_y = refScreen:frame().y + (((refScreen:frame().h - hs.screen.minHeight()) / 2) - ((refScreen:frame().h - hs.screen.minHeight()) / 4))
  end
  return min_y
end

-- Returns the frame of the smaller available screen
-- considering the context of refScreen
-- isFullscreen = false removes the toolbar
-- and dock sizes
function hs.screen.minFrame(refScreen, isFullscreen)
  return {
    x = hs.screen.minX(refScreen),
    y = hs.screen.minY(refScreen),
    w = hs.screen.minWidth(isFullscreen),
    h = hs.screen.minHeight(isFullscreen)
  }
end