local gears = require("gears")
local awful = require("awful")
local menubar = require("menubar")
local naughty = require("naughty")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

-- {{{ Key bindings
globalkeys = gears.table.join(
	awful.key({ modkey }, "s", hotkeys_popup.show_help, { description = "show help", group = "awesome" }),
	awful.key({ modkey }, "Left", awful.tag.viewprev, { description = "view previous", group = "tag" }),
	awful.key({ modkey }, "Right", awful.tag.viewnext, { description = "view next", group = "tag" }),
	awful.key({ modkey }, "Escape", awful.tag.history.restore, { description = "go back", group = "tag" }),
	awful.key({ modkey }, "j", function()
		awful.client.focus.byidx(1)
	end, { description = "focus next by index", group = "client" }),
	awful.key({ modkey }, "k", function()
		awful.client.focus.byidx(-1)
	end, { description = "focus previous by index", group = "client" }),
	awful.key({ modkey }, "w", function()
		mymainmenu:show()
	end, { description = "show main menu", group = "awesome" }),

	-- Layout manipulation
	awful.key({ modkey, "Shift" }, "j", function()
		awful.client.swap.byidx(1)
	end, { description = "swap with next client by index", group = "client" }),
	awful.key({ modkey, "Shift" }, "k", function()
		awful.client.swap.byidx(-1)
	end, { description = "swap with previous client by index", group = "client" }),
	awful.key({ modkey, "Control" }, "j", function()
		awful.screen.focus_relative(1)
	end, { description = "focus the next screen", group = "screen" }),
	awful.key({ modkey, "Control" }, "k", function()
		awful.screen.focus_relative(-1)
	end, { description = "focus the previous screen", group = "screen" }),
	awful.key({ modkey }, "u", awful.client.urgent.jumpto, { description = "jump to urgent client", group = "client" }),
	awful.key({ modkey }, "Tab", function()
		awful.client.focus.history.previous()
		if client.focus then
			client.focus:raise()
		end
	end, { description = "go back", group = "client" }),

	-- Standard program
	awful.key({ modkey }, "Return", function()
		awful.spawn(terminal)
	end, { description = "open a terminal", group = "launcher" }),
	awful.key({ modkey, "Shift" }, "r", awesome.restart, { description = "reload awesome", group = "awesome" }),
	-- awful.key({ modkey, "Shift" }, "q", awesome.quit, { description = "quit awesome", group = "awesome" }),
	awful.key({ modkey }, "l", function()
		awful.tag.incmwfact(0.05)
	end, { description = "increase master width factor", group = "layout" }),
	awful.key({ modkey }, "h", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "decrease master width factor", group = "layout" }),
	awful.key({ modkey, "Shift" }, "h", function()
		awful.tag.incnmaster(1, nil, true)
	end, { description = "increase the number of master clients", group = "layout" }),
	awful.key({ modkey, "Shift" }, "l", function()
		awful.tag.incnmaster(-1, nil, true)
	end, { description = "decrease the number of master clients", group = "layout" }),
	awful.key({ modkey, "Control" }, "h", function()
		awful.tag.incncol(1, nil, true)
	end, { description = "increase the number of columns", group = "layout" }),
	awful.key({ modkey, "Control" }, "l", function()
		awful.tag.incncol(-1, nil, true)
	end, { description = "decrease the number of columns", group = "layout" }),
	awful.key({ modkey }, "space", function()
		awful.layout.inc(1)
	end, { description = "select next", group = "layout" }),
	awful.key({ modkey, "Shift" }, "space", function()
		awful.layout.inc(-1)
	end, { description = "select previous", group = "layout" }),

	awful.key({ modkey, "Control" }, "n", function()
		local c = awful.client.restore()
		-- Focus restored client
		if c then
			c:emit_signal("request::activate", "key.unminimize", { raise = true })
		end
	end, { description = "restore minimized", group = "client" }),

	-- Prompt
	awful.key({ modkey }, "r", function()
		awful.screen.focused().mypromptbox:run()
	end, { description = "run prompt", group = "launcher" }),

	awful.key({ modkey, "Shift" }, "l", function()
		awful.prompt.run({
			prompt = "Run Lua code: ",
			textbox = awful.screen.focused().mypromptbox.widget,
			exe_callback = awful.util.eval,
			history_path = awful.util.get_cache_dir() .. "/history_eval",
		})
	end, { description = "lua execute prompt", group = "awesome" }),
	-- Menubar
	awful.key({ modkey }, "d", function()
		menubar.show()
	end, { description = "show the menubar", group = "launcher" }),
	awful.key({}, "Print", function()
		awful.spawn.with_shell("scrot -s $HOME/Pictures/`date +%Y-%m-%d_%H:%M:%S`.png")
	end),
	--reset
	awful.key({ modkey, "Control" }, "r", function()
		local cs = awful.screen.focused().all_clients
		for _, c in pairs(cs) do
			-- visible
			c.visible = true
			-- unminimize
			c.minimized = false
			-- turn off fullscreen
			c.fullscreen = false
			-- turn off maximized
			c.maximized = false
			-- turn off floating
			c.floating = false
			-- turn off ontop
			c.ontop = false
			-- turn off sticky
			c.sticky = false
		end
	end)
)

clientkeys = gears.table.join(
	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),
	awful.key({ modkey, "Shift" }, "q", function(c)
		c:kill()
	end, { description = "close", group = "client" }),
	awful.key(
		{ modkey, "Control" },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),
	awful.key({ modkey, "Control" }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),
	awful.key({ modkey }, "x", function(c)
		c:move_to_screen()
	end, { description = "move to screen", group = "client" }),
	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),
	awful.key({ modkey }, "n", function(c)
		-- The client currently has the input focus, so it cannot be
		-- minimized, since minimized clients can't have the focus.
		c.minimized = true
	end, { description = "minimize", group = "client" }),
	awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),
	awful.key({ modkey, "Control" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),
	awful.key({ modkey, "Shift" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" }),
	-- info
	awful.key({ modkey }, "i", function(c)
		local properties = "properties:" .. "\n"
		local fullscreen = "fullscreen: " .. tostring(c.fullscreen) .. "\n"
		local maximized = "maximized: " .. tostring(c.maximized) .. "\n"
		local floating = "floating: " .. tostring(c.floating) .. "\n"
		local ontop = "ontop: " .. tostring(c.ontop) .. "\n"
		local sticky = "sticky: " .. tostring(c.sticky) .. "\n"
		naughty.notify({
			preset = naughty.config.presets.critical,
			title = c.class,
			text = properties .. fullscreen .. maximized .. floating .. ontop .. sticky,
		})
	end, { description = "info about client", group = "client" })
)

local function get_tag_by_name(tags, name)
	for i, tag in ipairs(tags) do
		if tag.name == name then
			return tag
		end
	end
end
-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
	globalkeys = gears.table.join(
		globalkeys,
		-- View tag only.
		awful.key({ modkey }, "#" .. i + 9, function()
			local tags = root.tags()
			local tag = get_tag_by_name(tags, tostring(i))
			if tag then
				awful.screen.focus(tag.screen)
				tag:view_only()
			end
			-- if tags[i] then
			--     awful.screen.focus(tags[i].screen)
			--     tags[i]:view_only()
			-- end
			-- local screen = awful.screen.focused()
			-- local tag = screen.tags[i]
			-- if tag then
			-- 	tag:view_only()
			-- end
		end, { description = "view tag #" .. i, group = "tag" }),
		-- Toggle tag display.
		awful.key({ modkey, "Control" }, "#" .. i + 9, function()
			local tags = root.tags()
			local tag = get_tag_by_name(tags, tostring(i))
			if tags then
				awful.tag.viewtoggle(tags)
			end
			-- local screen = awful.screen.focused()
			-- local tag = screen.tags[i]
			-- if tag then
			-- 	awful.tag.viewtoggle(tag)
			-- end
		end, { description = "toggle tag #" .. i, group = "tag" }),
		-- Move client to tag.
		awful.key({ modkey, "Shift" }, "#" .. i + 9, function()
			local tags = root.tags()
			local tag = get_tag_by_name(tags, tostring(i))
			if tags then
				client.focus:move_to_tag(tag)
				awful.screen.focus(tag.screen)
			end
			-- if client.focus then
			-- 	local tag = client.focus.screen.tags[i]
			-- 	if tag then
			-- 		client.focus:move_to_tag(tag)
			-- 	end
			-- end
		end, { description = "move focused client to tag #" .. i, group = "tag" }),
		-- Toggle tag on focused client.
		awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9, function()
			local tags = root.tags()
			local tag = get_tag_by_name(tags, tostring(i))
			if tags then
				client.focus:toggle_tag(tag)
			end
			-- if client.focus then
			-- 	local tag = client.focus.screen.tags[i]
			-- 	if tag then
			-- 		client.focus:toggle_tag(tag)
			-- 	end
			-- end
		end, { description = "toggle focused client on tag #" .. i, group = "tag" }),
		-- print
		awful.key({ modkey, "Shift" }, "s", function()
			awful.spawn.with_shell("scrot -s $HOME/Pictures/`date +%Y-%m-%d_%H:%M:%S`.png")
		end)
	)
end
