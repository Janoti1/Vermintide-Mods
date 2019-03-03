local mod = get_mod("InvisTeam")

mod.update = function()
	if Managers.player and Managers.player:local_player() then
		local local_player_unit = Managers.player:local_player().player_unit
		for _, player in pairs( Managers.player:human_and_bot_players() ) do
			local player_unit = player.player_unit

			local scale = nil
			if player_unit and player_unit ~= local_player_unit then
				if not local_player_unit or not mod:is_enabled() then
					scale = 1
				else
					local position = Unit.world_position(player_unit, 0)
					local position_player = Unit.world_position(local_player_unit, 0)
					if position and position_player then
						local dist = Vector3.distance(position, position_player)

						if dist > mod:get(mod.SETTING_NAMES.DISTANCE) then
							scale = 0
							Unit.set_local_scale(player_unit, 1, Vector3(0,0,0))
						else
							scale = 1
							Unit.set_local_scale(player_unit, 1, Vector3(1,1,1))
						end
					end
				end

				if scale and not Vector3.equal(Unit.local_scale(local_player_unit, 0), Vector3(scale,scale,scale)) then
					Unit.set_local_scale(player_unit, 1, Vector3(scale,scale,scale))
				end
			end
		end
	end
end