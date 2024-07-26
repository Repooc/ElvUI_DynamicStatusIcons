local DSI, E, L, V, P, G = unpack(select(2, ...))
local UF = E:GetModule('UnitFrames')
local ACH = E.Libs.ACH

local iconsDuelingLeft, iconsDuelingRight
local function GetRandomDuo()
	local iconDB = DSI:GetIconList()
	local iconKeysList = {}

	for iconkey, icontbl in next, iconDB do
		if icontbl.valid then
			tinsert(iconKeysList, iconkey)
		end
	end

	local ranNum1 = random(1, #iconKeysList)
	local ranNum2 = random(1, #iconKeysList)

	while ranNum1 == ranNum2 do
		ranNum2 = random(1, #iconKeysList)
	end

	local leftIcon, rightIcon = iconKeysList[ranNum1], iconKeysList[ranNum2]

	iconsDuelingLeft = iconDB[leftIcon].path..leftIcon
	iconsDuelingRight = iconDB[rightIcon].path..rightIcon
end

local function configTable()
	local myClassColor = E:ClassColor(E.myclass, true)
	GetRandomDuo()
	local dsi = ACH:Group('|c'..myClassColor.colorStr..'Dynamic Status Icons'..'|r', nil, 6, 'tab')
	local rrp = E.Options.args.rrp

	if rrp then
		E.Options.args.rrp.args.dsi = dsi
		DSI.Options = E.Options.args.rrp.args.dsi
	else
		E.Options.args.dsi = dsi
		DSI.Options = E.Options.args.dsi
	end

	DSI.Options.args = {
		header = {
			order = 1,
			type = 'header',
			name = '',
		},
		logo = {
			order = 2,
			type = 'description',
			name = '',
			image = function()
				return 'Interface\\AddOns\\ElvUI_DynamicStatusIcons\\Textures\\Logo', 600, 150
			end,
		},
		header2 = {
			order = 3,
			type = 'header',
			name = '',
		},
		logoleft = {
			order = 4,
			type = 'execute',
			name = '',
			customWidth = 295,
			func = function() GetRandomDuo() end,
			imageCoords = {1,0,0,1},
			image = function()
				return iconsDuelingLeft..'\\Combat', 75, 75
			end,
		},
		logoright = {
			order = 5,
			type = 'execute',
			name = '',
			customWidth = 295,
			func = function() GetRandomDuo() end,
			--                ULx ULy LLx LLy URx URy LRx LRy
			-- imageCoords = {  0,  0,  0,  1,  1,  0,  1,  1},
			-- imageCoords = 	 {  1,  0,  0,  0,  1,  1,  0,  1},
			image = function()
				return iconsDuelingRight..'\\Combat', 75, 75
			end,
		},
		globalsection = {
			order = 10,
			type = 'group',
			name = L["Configuration"]..[[|TInterface\MINIMAP\TRACKING\OBJECTICONS:14:14:0:0:256:64:60:90:32:64|t]],
			args = {
				header = {
					order = 1,
					type = 'header',
					name = L["Configuration"],
				},
				globalsettings = {
					order = 5,
					type = 'group',
					name = L["Global Base Paths"],
					guiInline = true,
					get = function(info) return E.global.DSI[info[#info]] end,
					set = function(info, value)
						E.global.DSI[info[#info]] = value
						UF:CreateAndUpdateUF('player')
						UF:CreateAndUpdateUF('target')
						DSI:CreateUpdateIconGallery()
					end,
					args = {
						description = {
							order = 1,
							type = 'description',
							name = 'If you recieved custom icons to use from us, you can adjust the \'Additional Icon Path\' to the path you have them stored at.\nUse the \'Default Icons Path\' as a reference to better understand what value is expected. You can also just use the path that is prefilled in for the easiest solution.',
						},
						spacer = {
							order = 2,
							type = 'description',
							name = ' ',
						},
						defaultPacksPath = {
							order = 5,
							type = 'input',
							name = 'Default Icons Path',
							width = 'full',
							disabled = true,
						},
						customDSIconsPath = {
							order = 10,
							type = 'input',
							name = 'Additional Icons Path',
							width = 'full',
							desc = 'Any icons not provided in the addon should be in this folder.'
						},
					}
				},
				spacer = {
					order = 6,
					type = 'description',
					name = ' ',
				},
				supportedframes = {
					order = 10,
					type = 'group',
					name = L["Supported Frames"],
					guiInline = true,
					args = {
						description = {
							order = 1,
							type = 'description',
							name = 'These are the supported frames we currently support in ElvUI. We can and will most likely allow this on other frames like TargetTarget, Focus, and so on if people want as it shouldn\'t be difficult. These buttons will allow you to quickly get to that frames settings to adjust the DSI settings for that particular frame.',
						},
						spacer = {
							order = 2,
							type = 'description',
							name = ' ',
						},
						playerframe = {
							order = 10,
							type = 'execute',
							name = L["Player Frame"],
							func = function()
								E.Libs['AceConfigDialog']:SelectGroup('ElvUI', 'unitframe', 'individualUnits', 'player', 'DynamicStatusIcons')
							end,
						},
						targetframe = {
							order = 10,
							type = 'execute',
							name = L["Target Frame"],
							func = function()
								E.Libs['AceConfigDialog']:SelectGroup('ElvUI', 'unitframe', 'individualUnits', 'target', 'DynamicStatusIcons')
							end,
						},
					}
				},
			}
		},
		creditssection = {
			order = 15,
			type = 'group',
			name = L["Credits"],
			args = {
				header = {
					order = 1,
					type = 'header',
					name = L["Credits"],
				},
				testtext = {
					order = 2,
					type = 'description',
					name = 'Test Credits',
				},
			}
		},
		faqsection = {
			order = 20,
			type = 'group',
			name = L["FAQ"]..' '..E.NewSign,
			args = {
				header = {
					order = 1,
					type = 'header',
					name = L["Credits"],
				},
				testtext = {
					order = 2,
					type = 'description',
					name = 'Test Credits',
				},
			}
		},
		-- iconsection = {
		-- 	order = 20,
		-- 	type = 'group',
		-- 	name = L["Icons"]..' '..E.NewSign,
		-- 	childGroups = 'tab',
		-- 	args = {
		-- 		defaulticons = {
		-- 			order = 20,
		-- 			type = 'group',
		-- 			name = L["Default"],
		-- 			-- guiInline = true,
		-- 			args = {
		-- 				-- header = {
		-- 				-- 	order = 1,
		-- 				-- 	type = 'header',
		-- 				-- 	name = L["Customize Icons"],
		-- 				-- },
		-- 				['Pepe'] = {
		-- 					order = 20,
		-- 					type = 'group',
		-- 					name = L["Pepe"], --maybe do icon.name here if not '' or nil
		-- 					args = {
		-- 						icon = {
		-- 							order = 1,
		-- 							type = 'description',
		-- 							name = '',
		-- 							image = function()
										-- local path, customized = DSI:GetIconPath('Pepe', false)

		-- 								if customized then

		-- 								else

		-- 								end

		-- 								return path..'Pepe\\Normal', 48, 48
		-- 							end
		-- 						},
		-- 						path = {
		-- 							order = 2,
		-- 							type = 'input',
		-- 							name = function()
										-- local _, customized = DSI:GetIconPath('Pepe', false)
		-- 								if customized then
		-- 									return '|c'..GREEN_FONT_COLOR:GenerateHexColor()..'Using Custom Path Here'
		-- 								else
		-- 									return '|c'..RED_FONT_COLOR:GenerateHexColor()..'Using Original Path'
		-- 								end
		-- 							end,
		-- 							width = 'full',
		-- 							desc = function()
		-- 								local iconDB = DSI:GetIconInfo('Pepe')
		-- 								local additionalText

		-- 								if iconDB.customized then
		-- 									additionalText = 'Using the icons customized path option located here.'
		-- 								elseif iconDB.additionalPack then
		-- 									additionalText = 'Using the global additional packs path option located in the General Configuration.'
		-- 								else
		-- 									additionalText = 'Using the global default path option located in the General Configuration.'
		-- 								end

		-- 								return additionalText
		-- 							end,
		-- 							get = function()
		-- 								local iconDB = DSI:GetIconInfo('Pepe')

		-- 								return iconDB.path
		-- 							end,
		-- 							set = function(info, path)
		-- 								local iconDB = DSI:GetIconInfo('Pepe')

		-- 								if (iconDB.additionalPack and E.global.DSI.customDSIconsPath == path) or E.global.DSI.defaultPacksPath == path then
		-- 									E.global.DSI.customizedOptions['Pepe'][info[#info]] = nil
		-- 								else

		-- 								end

		-- 								if E.global.DSI.defaultPacksPath == path then
		-- 									E.global.DSI.customizedOptions['Pepe'][info[#info]] = nil
		-- 								else
		-- 									if not E.global.DSI.customizedOptions['Pepe'] then
		-- 										E.global.DSI.customizedOptions['Pepe'] = {}
		-- 									end

		-- 									E.global.DSI.customizedOptions['Pepe'][info[#info]] = path
		-- 								end
		-- 								-- if iconDB.customized then

		-- 								-- else


		-- 								-- end
		-- 								-- if not E.global.DSI.customizedOptions['Pepe'] then
		-- 								-- 	E.global.DSI.customizedOptions['Pepe'] = {}
		-- 								-- end
		-- 								-- E.global.DSI.customizedOptions['Pepe'][info[#info]] = path
		-- 								UF:CreateAndUpdateUF('player')
		-- 								UF:CreateAndUpdateUF('target')
		-- 								DSI:CreateUpdateIconGallery()
		-- 							end,
		-- 						},
		-- 					}
		-- 				},
		-- 			}
		-- 		},
		-- 	}
		-- },
	}
end

tinsert(DSI.Configs, configTable)
