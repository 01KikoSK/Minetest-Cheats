minetest.register_chatcommand("give", {
    params = "<item> [count]",
    description = "Gives an item to the player",
    func = function(name, param)
        local item, count = param:match("^(%S+)%s*(%d*)$")
        count = tonumber(count) or 1
        if minetest.registered_items[item] then
            minetest.add_item(minetest.get_player_by_name(name):get_pos(), item .. " " .. count)
            return true, "Gave you " .. count .. " " .. item
        else
            return false, "Item not found"
        end
    end,
})

minetest.register_chatcommand("heal", {
    description = "Heals the player",
    func = function(name)
        local player = minetest.get_player_by_name(name)
        player:set_hp(20) -- Set health to max (20)
        return true, "You have been healed!"
    end,
})

minetest.register_chatcommand("fly", {
    description = "Toggle flying mode",
    func = function(name)
        local player = minetest.get_player_by_name(name)
        local is_flying = player:get_physics_override().fly
        player:set_physics_override({fly = not is_flying})
        return true, "Flying mode " .. (not is_flying and "enabled" or "disabled")
    end,
})