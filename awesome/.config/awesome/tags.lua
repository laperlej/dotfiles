local awful = require("awful")

local single_screen_setup = { { 1, 2, 3, 4, 5, 6, 7, 8, 9 } }
local dual_screen_setup = { { 5, 6, 7, 8, 9 }, { 1, 2, 3, 4 } }
local triple_screen_setup = { { 8 }, { 1, 2, 3, 4 }, { 5, 6, 7, 9 } }
local function asMap(setup)
    local map = {}
    for screen_number, tags in ipairs(setup) do
        for _, tag in ipairs(tags) do
            map[tag] = screen_number
        end
    end
    return map
end
local screen_mapping = {
    asMap(single_screen_setup),
    asMap(dual_screen_setup),
    asMap(triple_screen_setup),
}

local function getScreen(id, screen_count)
    local setup = screen_mapping[screen_count]
    if not setup then
        return nil
    end
    return setup[id]
end

local screen_count = screen.count()
awful.tag.add("1", {
    layout = awful.layout.layouts[1],
    index = 1,
    screen = getScreen(1, screen_count),
})
awful.tag.add("2", {
    layout = awful.layout.layouts[1],
    index = 2,
    screen = getScreen(2, screen_count),
    selected = true,
})
awful.tag.add("3", {
    layout = awful.layout.layouts[1],
    index = 3,
    screen = getScreen(3, screen_count),
})
awful.tag.add("4", {
    layout = awful.layout.layouts[1],
    index = 4,
    screen = getScreen(4, screen_count),
})
awful.tag.add("5", {
    layout = awful.layout.layouts[1],
    index = 5,
    screen = getScreen(5, screen_count),
})
awful.tag.add("6", {
    layout = awful.layout.layouts[1],
    index = 6,
    screen = getScreen(6, screen_count),
})
awful.tag.add("7", {
    layout = awful.layout.layouts[1],
    index = 7,
    screen = getScreen(7, screen_count),
    selected = true,
})
awful.tag.add("8", {
    layout = awful.layout.layouts[1],
    index = 8,
    screen = getScreen(8, screen_count),
})
awful.tag.add("9", {
    layout = awful.layout.layouts[1],
    index = 9,
    screen = getScreen(9, screen_count),
})

local function updateTags()
    local screen_count = screen.count()
    local tags = root.tags()
    for _, tag in ipairs(tags) do
        if tag.index <= 4 then
            tag.screen = getScreen(2, screen_count)
        else
            tag.screen = getScreen(1, screen_count)
        end
    end
end

screen.connect_signal("list", updateTags)
tag.connect_signal("request::screen", updateTags)
