
script.on_event(defines.events.on_picked_up_item, function(event)
	if(event.item_stack.name == "wooden-chest") then
		game.players[event.player_index].print("Reload technologies and recipes")
		game.players[event.player_index].force.reset_technologies()
		game.players[event.player_index].force.reset_recipes()
	end
end)


script.on_event(defines.events.on_trigger_created_entity, function(event)	
	if(event.entity.name == "resource-remover-medium-explosion") then
		local pos = event.entity.position
		
		for _, entity in ipairs(event.entity.surface.find_entities_filtered {
			area = 
			{
				{pos.x - 5, pos.y - 5}, 
				{pos.x + 5, pos.y + 5}
			}, 
			type = "resource"
		})
		do
			local posE = entity.position
			local d = (posE.x - pos.x) * (posE.x - pos.x) + (posE.y - pos.y) * (posE.y - pos.y);
			
			if(d <= 25) then
				entity.destroy()
			end
		end
	end
end)