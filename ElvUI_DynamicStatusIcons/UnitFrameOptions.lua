local DSI, E, L, V, P, G = unpack(select(2, ...))
local UF = E:GetModule('UnitFrames')

local tinsert = tinsert
local supportedFrames = {'player', 'target'}
local positionValues = {
	TOPLEFT = 'TOPLEFT',
	LEFT = 'LEFT',
	BOTTOMLEFT = 'BOTTOMLEFT',
	RIGHT = 'RIGHT',
	TOPRIGHT = 'TOPRIGHT',
	BOTTOMRIGHT = 'BOTTOMRIGHT',
	CENTER = 'CENTER',
	TOP = 'TOP',
	BOTTOM = 'BOTTOM',
}

local function GetSharedOptions(frame)
	local Options = {
		enable = {
			order = 1,
			type = 'toggle',
			name = L["Enable"],
		},
		general = {
			order = 2,
			type = 'group',
			name = L["General"],
			guiInline = true,
			args = {
				scale = {
					order = 1,
					type = 'range',
					name = L["Scale"],
					min = 0.6,
					max = 2,
					step = 0.01,
					isPercent = true
				},
				xOffset = {
					order = 2,
					type = 'range',
					name = L["X-Offset"],
					min = -100, max = 100, step = 1,
				},
				yOffset = {
					order = 3,
					type = 'range',
					name = L["Y-Offset"],
					min = -100, max = 100, step = 1,
				},
				anchorPoint = {
					order = 4,
					type = 'select',
					name = L["Anchor Point"],
					values = positionValues,
				},
				faceright = {
					order = 5,
					type = 'toggle',
					name = L["Swap Direction"],
				},
				color = {
					order = 5,
					type = 'color',
					name = COLOR,
					hasAlpha = true,
					disabled = function()
						return E.db.unitframe.units[frame].DynamicStatusIcons.defaultColor
					end,
					get = function()
						local c = E.db.unitframe.units[frame].DynamicStatusIcons.color
						local d = P.unitframe.units[frame].DynamicStatusIcons.color
						return c.r, c.g, c.b, c.a, d.r, d.g, d.b, d.a
					end,
					set = function(_, r, g, b, a)
						local c = E.db.unitframe.units[frame].DynamicStatusIcons.color
						c.r, c.g, c.b, c.a = r, g, b, a
						UF:CreateAndUpdateUF(frame);
					end,
				},
			}
		},
		icongallery = {
			order = 10,
			type = 'group',
			name = L['Glorious Icon Gallery'],
			childGroups = 'tree',
			args = {}
		},
	}

	return Options
end

local function GetOptionsTable_IconPacks(updateFunc, groupName, packtype, typetbl)
	local Options = {
		order = 10,
		type = 'multiselect',
		name = packtype,
		sortByValue = true,
		customWidth = 250,
		values = typetbl,
		get = function(_, key)
			return E.db.unitframe.units[groupName].DynamicStatusIcons.iconpack == key
		end,
		set = function(_, key)
			E.db.unitframe.units[groupName].DynamicStatusIcons.iconpack = key
			updateFunc(UF, groupName)
		end,
	}

	return Options
end

function DSI:CreateUpdateIconGallery()
	local collectPacks = {}
	local iconDB = DSI:GetIconList()

	do
		for iconkey, icontbl in next, iconDB do
			if icontbl.valid then
				if type(icontbl.pack) == 'table' then
					for _, pack in next, icontbl.pack do
						if collectPacks[pack] == nil then collectPacks[pack] = {} end
						if collectPacks[pack][icontbl.packtype] == nil then collectPacks[pack][icontbl.packtype] = {} end
						collectPacks[pack][icontbl.packtype][iconkey] = E:TextureString(icontbl.path..iconkey..'\\Normal', ':40:40')..' '..icontbl.name
					end
				else
					if collectPacks[icontbl.pack] == nil then collectPacks[icontbl.pack] = {} end
					if collectPacks[icontbl.pack][icontbl.packtype] == nil then collectPacks[icontbl.pack][icontbl.packtype] = {} end

					collectPacks[icontbl.pack][icontbl.packtype][iconkey] = E:TextureString(icontbl.path..iconkey..'\\Normal', ':40:40')..' '..icontbl.name
				end
			end
		end
	end

	for _, unit in pairs(supportedFrames) do
		E.Options.args.unitframe.args.individualUnits.args[unit].args.DynamicStatusIcons.args.icongallery.args = {}
		E.Options.args.unitframe.args.individualUnits.args[unit].args.DynamicStatusIcons.args.icongallery.args.currentlySelected = {
			order = 2,
			type = 'description',
			name = function()
				local iconpack = E.db.unitframe.units[unit].DynamicStatusIcons.iconpack

				if iconDB[iconpack].valid then
					local icon = iconDB[iconpack].path..iconpack
					return E:TextureString(icon..'\\Normal', ':80:80')..E:TextureString(icon..'\\Combat', ':80:80')..E:TextureString(icon..'\\Dead', ':80:80')..E:TextureString(icon..'\\Sleeping', ':80:80')
				else
					return ''
				end

			end,
		}
		for pack, packtbl in next, collectPacks do
			E.Options.args.unitframe.args.individualUnits.args[unit].args.DynamicStatusIcons.args.icongallery.args[pack] = {
				order = 5,
				type = 'group',
				name = pack,
				args = {}
			}
			for packtype, typetbl in next, packtbl do
				E.Options.args.unitframe.args.individualUnits.args[unit].args.DynamicStatusIcons.args.icongallery.args[pack].args[packtype] = GetOptionsTable_IconPacks(UF.CreateAndUpdateUF, 'player', packtype, typetbl)
			end
		end
	end
end

local function configTable()
	local myClassColor = E:ClassColor(E.myclass, true)

	for _, unit in pairs(supportedFrames) do
		E.Options.args.unitframe.args.individualUnits.args[unit].args.DynamicStatusIcons = {
			type = 'group',
			name = '|c'..myClassColor.colorStr..L["Dynamic Status Icons"]..'|r',
			childGroups = 'tab',
			get = function(info) return E.db.unitframe.units[unit].DynamicStatusIcons[info[#info]] end,
			set = function(info, value)
				E.db.unitframe.units[unit].DynamicStatusIcons[info[#info]] = value
				UF:CreateAndUpdateUF(unit)
			end,
			args = GetSharedOptions(unit)
		}
	end

	DSI:CreateUpdateIconGallery()
end

tinsert(DSI.Configs, configTable)
