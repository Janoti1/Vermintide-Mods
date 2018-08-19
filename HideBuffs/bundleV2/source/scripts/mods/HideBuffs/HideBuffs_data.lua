local mod = get_mod("HideBuffs") -- luacheck: ignore get_mod

mod.SETTING_NAMES = {
	VICTOR_BOUNTYHUNTER_PASSIVE_INFINITE_AMMO_BUFF = "victor_bountyhunter_passive_infinite_ammo_buff",
	GRIMOIRE_HEALTH_DEBUFF = "grimoire_health_debuff",
	MARKUS_HUNTSMAN_PASSIVE_CRIT_AURA_BUFF = "markus_huntsman_passive_crit_aura_buff",
	MARKUS_KNIGHT_PASSIVE_DEFENCE_AURA = "markus_knight_passive_defence_aura",
	KERILLIAN_WAYWATCHER_PASSIVE = "kerillian_waywatcher_passive",
	KERILLIAN_MAIDENGUARD_PASSIVE_STAMINA_REGEN_BUFF = "kerillian_maidenguard_passive_stamina_regen_buff",
	HIDE_FRAMES = "hide_frames",
	HIDE_LEVELS = "hide_levels",
	HIDE_HOTKEYS = "hide_hotkeys",
	NO_TUTORIAL_UI = "no_tutorial_ui",
	NO_MISSION_OBJECTIVE = "no_mission_objective",
	BUFFS_GROUP = "buffs_group",
}

-- Everything here is optional. You can remove unused parts.
local mod_data = {
	name = "Hide UI Elements",
	description = mod:localize("mod_description"),
	is_togglable = true,
}
mod_data.options_widgets = {
	{
		["setting_name"] = mod.SETTING_NAMES.NO_TUTORIAL_UI,
		["widget_type"] = "checkbox",
		["text"] = mod:localize("no_tutorial_ui"),
		["tooltip"] = mod:localize("no_tutorial_ui_tooltip"),
		["default_value"] = false,
	},
	{
		["setting_name"] = mod.SETTING_NAMES.NO_MISSION_OBJECTIVE,
		["widget_type"] = "checkbox",
		["text"] = mod:localize("no_mission_objective"),
		["tooltip"] = mod:localize("no_mission_objective_tooltip"),
		["default_value"] = false,
	},
	{
		["setting_name"] = mod.SETTING_NAMES.HIDE_FRAMES,
		["widget_type"] = "checkbox",
		["text"] = mod:localize("hide_frames"),
		["tooltip"] = mod:localize("hide_frames_tooltip"),
		["default_value"] = false,
	},
	{
		["setting_name"] = mod.SETTING_NAMES.HIDE_LEVELS,
		["widget_type"] = "checkbox",
		["text"] = mod:localize("hide_levels"),
		["tooltip"] = mod:localize("hide_levels_tooltip"),
		["default_value"] = false,
	},
	{
		["setting_name"] = mod.SETTING_NAMES.HIDE_HOTKEYS,
		["widget_type"] = "checkbox",
		["text"] = mod:localize("hide_hotkeys"),
		["tooltip"] = mod:localize("hide_hotkeys_tooltip"),
		["default_value"] = false,
	},
	{
		["setting_name"] = mod.SETTING_NAMES.BUFFS_GROUP,
		["widget_type"] = "group",
		["text"] = mod:localize("buffs_group"),
		["sub_widgets"] = {
			{
				["setting_name"] = mod.SETTING_NAMES.VICTOR_BOUNTYHUNTER_PASSIVE_INFINITE_AMMO_BUFF,
				["widget_type"] = "checkbox",
				["text"] = mod:localize("victor_bountyhunter_passive_infinite_ammo_buff"),
				["tooltip"] = mod:localize("victor_bountyhunter_passive_infinite_ammo_buff_tooltip"),
				["default_value"] = false,
			},
			{
				["setting_name"] = mod.SETTING_NAMES.GRIMOIRE_HEALTH_DEBUFF,
				["widget_type"] = "checkbox",
				["text"] = mod:localize("grimoire_health_debuff"),
				["tooltip"] = mod:localize("grimoire_health_debuff_tooltip"),
				["default_value"] = false,
			},
			{
				["setting_name"] = mod.SETTING_NAMES.MARKUS_HUNTSMAN_PASSIVE_CRIT_AURA_BUFF,
				["widget_type"] = "checkbox",
				["text"] = mod:localize("markus_huntsman_passive_crit_aura_buff"),
				["tooltip"] = mod:localize("markus_huntsman_passive_crit_aura_buff_tooltip"),
				["default_value"] = false,
			},
			{
				["setting_name"] = mod.SETTING_NAMES.MARKUS_KNIGHT_PASSIVE_DEFENCE_AURA,
				["widget_type"] = "checkbox",
				["text"] = mod:localize("markus_knight_passive_defence_aura"),
				["tooltip"] = mod:localize("markus_knight_passive_defence_aura_tooltip"),
				["default_value"] = false,
			},
			{
				["setting_name"] = mod.SETTING_NAMES.KERILLIAN_WAYWATCHER_PASSIVE,
				["widget_type"] = "checkbox",
				["text"] = mod:localize("kerillian_waywatcher_passive"),
				["tooltip"] = mod:localize("kerillian_waywatcher_passive_tooltip"),
				["default_value"] = false,
			},
			{
				["setting_name"] = mod.SETTING_NAMES.KERILLIAN_MAIDENGUARD_PASSIVE_STAMINA_REGEN_BUFF ,
				["widget_type"] = "checkbox",
				["text"] = mod:localize("kerillian_maidenguard_passive_stamina_regen_buff"),
				["tooltip"] = mod:localize("kerillian_maidenguard_passive_stamina_regen_buff_tooltip"),
				["default_value"] = false,
			},
		},
	},
}

return mod_data