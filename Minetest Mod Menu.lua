-- my_mod/init.lua

-- Register a global function to open the mod menu
function open_mod_menu()
    local formspec = "size[8,6]" ..
                     "label[0.5,0.5;Minetest Mod Menu]" ..
                     "button[0.5,1;3,1;give_items;Give Items]" ..
                     "button[0.5,2;3,1;teleport;Teleport to Spawn]" ..
                     "button[0.5,3;3,1;set_health;Set Health to 20]" ..
                     "button[0.5,4;3,1;close;Close]"

    minetest.show_formspec("my_mod:menu", formspec)
end

-- Handle button clicks
minetest.register_on_player_receive_fields(function(player, formname, fields)
    if formname == "my_mod:menu" then
        if fields.give_items then
            -- Example: Give player some items
            local inv = player:get_inventory()
            inv:add_item("main", "default:stone 99")
            minetest.chat_send_player(player:get_player_name(), "Gave you 99 stones!")
        elseif fields.teleport then
            -- Teleport player to spawn
            local pos = minetest.get_spawn_pos()
            player:set_pos(pos)
            minetest.chat_send_player(player:get_player_name(), "Teleported to spawn!")
        elseif fields.set_health then
            -- Set player's health to 20
            player:set_hp(20)
            minetest.chat_send_player(player:get_player_name(), "Health set to 20!")
        elseif fields.close then
            -- Close the menu
            return
        end
    end
end)

-- Register a command to open the mod menu
minetest.register_chatcommand("modmenu", {
    params = "",
    description = "Open the mod menu",
    func = function(name)
        open_mod_menu()
        return true, "Mod menu opened."
    end,
})