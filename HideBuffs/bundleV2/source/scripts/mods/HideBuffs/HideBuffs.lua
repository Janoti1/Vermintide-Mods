local mod = get_mod("HideBuffs") -- luacheck: ignore get_mod

-- luacheck: globals BuffUI EquipmentUI AbilityUI UnitFrameUI MissionObjectiveUI TutorialUI

mod.lookup = {
	["victor_bountyhunter_passive_infinite_ammo_buff"] =
		mod.SETTING_NAMES.VICTOR_BOUNTYHUNTER_PASSIVE_INFINITE_AMMO_BUFF,
	["grimoire_health_debuff"] =
		mod.SETTING_NAMES.GRIMOIRE_HEALTH_DEBUFF,
	["markus_huntsman_passive_crit_aura_buff"] =
		mod.SETTING_NAMES.MARKUS_HUNTSMAN_PASSIVE_CRIT_AURA_BUFF,
	["markus_knight_passive_defence_aura"] =
		mod.SETTING_NAMES.MARKUS_KNIGHT_PASSIVE_DEFENCE_AURA,
	["kerillian_waywatcher_passive"] =
		mod.SETTING_NAMES.KERILLIAN_WAYWATCHER_PASSIVE,
	["kerillian_waywatcher_passive"] =
		mod.SETTING_NAMES.KERILLIAN_WAYWATCHER_PASSIVE,
	["kerillian_maidenguard_passive_stamina_regen_buff"] =
		mod.SETTING_NAMES.KERILLIAN_MAIDENGUARD_PASSIVE_STAMINA_REGEN_BUFF,
}

mod:hook(BuffUI, "_add_buff", function (func, self, buff, ...)
	for buff_name, setting_name in pairs( mod.lookup ) do
		if buff.buff_type == buff_name and mod:get(setting_name) then
			return false
		end
	end

	return func(self, buff, ...)
end)

mod.reset_hotkey_alpha = false
mod.reset_portrait_frame_alpha = false
mod.reset_level_alpha = false

mod.on_setting_changed = function(setting_name)
	mod.reset_hotkey_alpha = not mod:get(mod.SETTING_NAMES.HIDE_HOTKEYS)
	mod.reset_portrait_frame_alpha = not mod:get(mod.SETTING_NAMES.HIDE_FRAMES)
	mod.reset_level_alpha = not mod:get(mod.SETTING_NAMES.HIDE_LEVELS)
end

mod:hook(EquipmentUI, "draw", function(func, self, dt)
	mod:pcall(function()
		if mod.reset_hotkey_alpha then
			for _, widget in ipairs(self._slot_widgets) do
				widget.style.input_text.text_color[1] = 255
				widget.style.input_text_shadow.text_color[1] = 255
				self:_set_widget_dirty(widget)
			end
			mod.reset_hotkey_alpha = false
		end
		if mod:get(mod.SETTING_NAMES.HIDE_HOTKEYS) then
			for _, widget in ipairs(self._slot_widgets) do
				if widget.style.input_text.text_color[1] ~= 0 then
					widget.style.input_text.text_color[1] = 0
					widget.style.input_text_shadow.text_color[1] = 0
					self:_set_widget_dirty(widget)
				end
			end
		end
	end)
	return func(self, dt)
end)

mod:hook(AbilityUI, "draw", function(func, self, dt)
	mod:pcall(function()
		if mod.reset_hotkey_alpha then
			local widget = self._widgets_by_name.ability
			widget.style.input_text.text_color[1] = 255
			widget.style.input_text_shadow.text_color[1] = 255
			self:_set_widget_dirty(widget)
			mod.reset_hotkey_alpha = false
		end
		if mod:get(mod.SETTING_NAMES.HIDE_HOTKEYS) then
			local widget = self._widgets_by_name.ability
			if widget.style.input_text.text_color[1] ~= 0 then
				widget.style.input_text.text_color[1] = 0
				widget.style.input_text_shadow.text_color[1] = 0
				self:_set_widget_dirty(widget)
			end
		end
	end)
	return func(self, dt)
end)

mod:hook(UnitFrameUI, "update", function(func, self, ...)
	mod:pcall(function()
		local portrait_static = self._widgets.portrait_static

		-- portrait frame
		if mod.reset_portrait_frame_alpha then
			portrait_static.style.texture_1.color[1] = 255
			self:_set_widget_dirty(portrait_static)
			mod.reset_portrait_frame_alpha = false
		end
		if mod:get(mod.SETTING_NAMES.HIDE_FRAMES)
		and portrait_static.style.texture_1.color[1] ~= 0 then
			portrait_static.style.texture_1.color[1] = 0
			self:_set_widget_dirty(portrait_static)
		end

		-- level
		if mod.reset_level_alpha then
			portrait_static.style.level.text_color[1] = 255
			self:_set_widget_dirty(portrait_static)
			mod.reset_level_alpha = false
		end
		if mod:get(mod.SETTING_NAMES.HIDE_LEVELS)
		and portrait_static.style.level.text_color[1] ~= 0 then
			portrait_static.style.level.text_color[1] = 0
			self:_set_widget_dirty(portrait_static)
		end
	end)
	return func(self, ...)
end)

mod:hook(TutorialUI, "update_mission_tooltip", function(func, self, ...)
	if mod:get(mod.SETTING_NAMES.NO_TUTORIAL_UI) then
		return
	end
	return func(self, ...)
end)

mod:hook(TutorialUI, "pre_render_update", function(func, self, ...)
	if mod:get(mod.SETTING_NAMES.NO_TUTORIAL_UI) then
		mod:pcall(function()
			self.active_tooltip_widget = nil
			for _, obj_tooltip in ipairs( self.objective_tooltip_widget_holders ) do
				obj_tooltip.updated = false
			end
		end)
	end
	return func(self, ...)
end)

mod:hook(MissionObjectiveUI, "draw", function(func, self, dt)
	if mod:get(mod.SETTING_NAMES.NO_MISSION_OBJECTIVE) then
		return
	end
	return func(self, dt)
end)