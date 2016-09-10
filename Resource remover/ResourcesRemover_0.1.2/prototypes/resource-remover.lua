data:extend({

-- Item
{
    type = "capsule",
    name = "resource-remover",
    icon = "__ResourcesRemover__/graphics/resource-remover-icon.png",
    flags = {"goes-to-quickbar"},
    capsule_action =
    {
		type = "throw",
		attack_parameters =
		{
			type = "projectile",
			ammo_category = "grenade",
			cooldown = 30,
			projectile_creation_distance = 0.6,
			range = 15,
			ammo_type =
			{
				category = "grenade",
				target_type = "position",
				action =
				{
					type = "direct",
					action_delivery =
					{
						type = "projectile",
						projectile = "resource-remover",
						starting_speed = 0.3
					}
				}
			}
		}
    },
    subgroup = "extraction-machine",
    order = "a[items]-c[resource-remover]",
    stack_size = 100
},

--Recipe
{
    type = "recipe",
    name = "resource-remover",
    enabled = false,
    energy_required = 10,
    ingredients =
    {
		{"steel-plate", 5},
		{"coal", 10},
		{"explosives", 5},
		{"electronic-circuit", 1}
    },
    result = "resource-remover"
},

--Technology
{
	type = "technology",
	name = "resource-remover",
	icon = "__ResourcesRemover__/graphics/resource-remover-tech.png",
	icon_size = 128,
	prerequisites = {"explosives"},
	unit =
	{
		count = 250,
		ingredients =
		{
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			{"science-pack-3", 1}
		},
		time = 30
	},
	effects =
	{
		{
			type = "unlock-recipe",
			recipe = "resource-remover"
		}
	},
	order = "a-e-e"
},

--Projectile
{
	type = "projectile",
	name = "resource-remover",
	flags = {"not-on-map"},
	acceleration = 0.005,
	action =
	{
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "resource-remover-medium-explosion",
						trigger_created_entity = true
					},
					{
						type = "create-entity",
						entity_name = "small-scorchmark",
						check_buildability = true
					}
				}
			}
		},
		{
			type = "area",
			perimeter = 5,
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "damage",
						damage = {amount = 50, type = "explosion"}
					},
					{
						type = "create-entity",
						entity_name = "resource-remover-explosion",
					},
				}
			}
		}
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
		filename = "__ResourcesRemover__/graphics/resource-remover-grenade.png",
		frame_count = 1,
		width = 24,
		height = 24,
		priority = "high"
    },
    shadow =
    {
		filename = "__base__/graphics/entity/grenade/grenade-shadow.png",
		frame_count = 1,
		width = 24,
		height = 32,
		priority = "high"
    }
},

-- Medium explosion
{
	type = "explosion",
	name = "resource-remover-medium-explosion",
	flags = {"not-on-map"},
	animations =
	{
		{
			filename = "__ResourcesRemover__/graphics/medium-explosion/medium-explosion.png",
			priority = "extra-high",
			width = 112,
			height = 94,
			frame_count = 54,
			line_length = 6,
			shift = {-0.56, -0.96},
			animation_speed = 0.5
		}
	},
	light = {intensity = 1, size = 50},
	sound =
	{
		aggregation =
		{
			max_count = 1,
			remove = true
		},
		variations =
		{
			{
				filename = "__base__/sound/fight/large-explosion-1.ogg",
				volume = 0.8
			},
			{
				filename = "__base__/sound/fight/large-explosion-2.ogg",
				volume = 0.8
			}
		}
	},
	created_effect =
	{
		type = "direct",
		action_delivery =
		{
			type = "instant",
			target_effects =
			{
				{
					type = "create-particle",
					repeat_count = 20,
					entity_name = "explosion-remnants-particle",
					initial_height = 0.5,
					speed_from_center = 0.08,
					speed_from_center_deviation = 0.15,
					initial_vertical_speed = 0.08,
					initial_vertical_speed_deviation = 0.15,
					offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
				}
			}
		}
	}
},

-- Explosion
{
	type = "explosion",
	name = "resource-remover-explosion",
	flags = {"not-on-map"},
	animations =
	{
		{
			filename = "__ResourcesRemover__/graphics/explosion/explosion-1.png",
			priority = "extra-high",
			width = 64,
			height = 59,
			frame_count = 16,
			animation_speed = 0.5
		},
		{
			filename = "__ResourcesRemover__/graphics/explosion/explosion-2.png",
			priority = "extra-high",
			width = 64,
			height = 57,
			frame_count = 16,
			animation_speed = 0.5
		},
		{
			filename = "__ResourcesRemover__/graphics/explosion/explosion-3.png",
			priority = "extra-high",
			width = 64,
			height = 49,
			frame_count = 16,
			animation_speed = 0.5
		},
		{
			filename = "__ResourcesRemover__/graphics/explosion/explosion-4.png",
			priority = "extra-high",
			width = 64,
			height = 51,
			frame_count = 16,
			animation_speed = 0.5
		}
	},
	light = {intensity = 1, size = 20},
	smoke = "smoke-fast",
	smoke_count = 2,
	smoke_slow_down_factor = 1,
	sound =
	{
		aggregation =
		{
			max_count = 1,
			remove = true
		},
		variations =
		{
			{
				filename = "__base__/sound/fight/small-explosion-1.ogg",
				volume = 0.75
			},
			{
				filename = "__base__/sound/fight/small-explosion-2.ogg",
				volume = 0.75
			}
		}
	}
},

})