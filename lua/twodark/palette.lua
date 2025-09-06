return {
	darker = {
		black = "#0F0F0F",
		bg0 = "#1f2329",
		bg1 = "#282c34",
		bg2 = "#30363f",
		bg3 = "#323641",
		bg_d = "#181b20",
		bg_blue = "#61afef",
		bg_yellow = "#e8c88c",
		fg = "#a0a8b7",
		purple = "#bf68d9",
		green = "#8ebd6b",
		orange = "#cc9057",
		blue = "#4fa6ed",
		yellow = "#e2b86b",
		-- Align teal/cyan accents to keyword green
		cyan = "#568B74",
		red = "#e55561",
		grey = "#535965",
		light_grey = "#7a818e",
		dark_cyan = "#266269",
		dark_red = "#8b3434",
		dark_yellow = "#835d1a",
		dark_purple = "#7e3992",
		diff_add = "#272e23",
		diff_delete = "#2d2223",
		diff_change = "#172a3a",
		diff_text = "#274964",

		-- IDE syntax semantics sourced from alpha
		-- Core syntax
		comment = "#666666",                 -- medium grey
		keyword = "#568B74",                 -- desaturated teal green
		keyword_func = "#DE6767",            -- salmon red
		keyword_import = "#DE6767",          -- salmon red
		func = "#80A665",                    -- sage green
		string = "#666666",                  -- medium grey
		string_regex = "#CCCCCC",            -- light grey
		string_escape = "#DE6767",           -- salmon red
		string_special_symbol = "#D66262",   -- coral red
		number = "#E8C262",                  -- golden yellow
		number_float = "#E8C262",            -- golden yellow
		boolean = "#DE6767",                 -- salmon red
		type = "#568B74",                    -- teal
		type_builtin = "#B8A965",            -- olive gold
		constant = "#4D9375",                -- sea green
		constructor = "#B8A965",             -- olive gold
		identifier = "#A0ACA0",              -- sage grey
		operator = "#6D795E",                -- olive grey
		delimiters = "#666666",              -- medium grey
		brackets = "#666666",                -- medium grey
		brackets_in_strings = "#D66262",     -- coral red
		tag = "#CCCCCC",                     -- light grey
		title = "#CCCCCC",                   -- light grey

		-- Lua-specific syntax accents
		-- lua_brackets = "#6893BF",            -- { } (unused)
		-- lua_boolean = "#4D9375",             -- (unused)
		lua_statement = "#CB7676",           -- return
		-- lua_numbers = "#4C9A91",            -- 300 (unused)
		-- lua_operators = "#B8A965",          -- = (unused)
		lua_property = "#698A75",           -- treesitter prop (requires)
		lua_conditional = "#4D9375",        -- if else then
		lua_repeat = "#4D9375",             -- for in

		-- Variables
		variable = "#A0ACA0",                -- sage grey
		variable_builtin = "#C99076",         -- sandy orange
		variable_member = "#C99076",          -- sandy orange
		variable_parameter = "#DBD7CA",       -- light beige

		-- Misc language tokens
		annotation = "#FFFFFF",              -- white
		attribute = "#80A665",               -- sage green
		character = "#FFFFFF",               -- white
		conditional = "#FFFFFF",             -- white
		error = "#D66262",                   -- coral red
		exception = "#FFFFFF",               -- white
		field = "#FFFFFF",                   -- white
		include = "#FFFFFF",                 -- white
		label = "#FFFFFF",                   -- white
		module = "#FFFFFF",                  -- white
		namespace = "#CCCCCC",               -- light grey
		note = "#CCCCCC",                    -- light grey
		warning = "#363636",                -- mid grey for warnings
		property = "#B8A965",                -- olive gold

		-- Text hierarchy
		text_primary = "#CCCCCC",            -- light grey
		text_secondary = "#9C9C9C",          -- cool grey
		text_tertiary = "#666666",           -- medium grey
		markup = "#CCCCCC",                  -- light grey

		-- Human-readable accents
		class_name = "#6893BF",             -- unsaturated light blue for class names

		-- UI helpers
		line_numbers = "#444444",            -- charcoal grey
		line_separator = "#2B2B29",          -- near-black brown
		search_text = "#9CDDC1",             -- mint green
		search_background = "#4D9375",       -- sea green
		status_line_background = "#212121",   -- graphite black
		toolbar_background = "#0F0F0F",      -- toolbar background behind tabs
		indent_breakline = "#272222",         -- very dark brown
		placeholder = "#CCCCCC",              -- light grey
		tildes = "#DE6767",                  -- salmon red

		-- Human readable (aliases / utility)
		-- Greyscale spectrum used across UI states
		grey_1 = "#CCCCCC",   -- light grey
		grey_2 = "#515151",   -- medium grey
		grey_3 = "#323232",   -- dim grey
		grey_4 = "#242424",   -- dark grey
		grey_5 = "#171717",   -- near black
		white = "#FFFFFF",
		black = "#000000",

		-- Which-key and menus
		whichkey_background = "#202021",      -- near-black
		whichkey_letter = "#568B74",          -- teal green
		whichkey_arrow = "#B8A965",           -- olive gold
		whichkey_description = "#CCCCCC",     -- light grey
		whichkey_prefix = "#80A665",          -- sage green
		complete_menu_background = "#181818",  -- jet black
		complete_menu_text = "#4F7E6A",       -- dusty teal
		complete_menu_predict = "#568B74",    -- align to keyword green
		complete_menu_selection_background = "#2E2E2E", -- dark slate grey
		complete_menu_match_fuzzy = "#568B74", -- align to keyword green
		complete_menu_deprecated = "#666666", -- medium grey

		-- High-visibility test colors for quick visual diffing
		test_red = "#FF0000",
		test_yellow = "#FFD500",
		test_orange = "#FF8C00",
		test_white = "#242424",
		test_purple = "#242424",

		-- Terminal accents (aliases to key palette hues)
		term = {
			green = "#568B74",      -- keyword
			red = "#DE6767",        -- keyword_func
			yellow = "#E8C262",     -- number
			grey_mid = "#666666",   -- text_tertiary
			grey_dark = "#242424",  -- grey_4
			grey_light = "#CCCCCC", -- grey_1
		},

		-- Accents
		danger = "#B12E2E",

	},
}
