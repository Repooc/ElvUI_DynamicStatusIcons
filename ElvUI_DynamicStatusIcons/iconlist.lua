local DSI, E = unpack(select(2, ...))

local iconList = {
	--! Icons Shipped w/ DSI
	--* Stock Icons of Classes
	['Pepe - Death Knight (Tier 7)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Death Knight (Tier 7)',
		additionalPack = false,
	},
	['Pepe - Demon Hunter (Tier 19)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Demon Hunter (Tier 19)',
		additionalPack = false,
	},
	['Pepe - Druid (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Druid (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Hunter (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Hunter (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Mage (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Mage (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Monk (Tier 14)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Monk (Tier 14)',
		additionalPack = false,
	},
	['Pepe - Paladin (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Paladin (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Priest (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Priest (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Rogue (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Rogue (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Shaman (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Shaman (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Warlock (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Warlock (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Warrior (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Warrior (Tier 1)',
		additionalPack = false,
	},
	--! Icons Shipped w/ DSI
	--* Stock Icons of Basic Pepe
	['Pepe - Clockwork'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Clockwork',
		additionalPack = false,
	},
	['Pepe - Demon Hunter'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Demon Hunter',
		additionalPack = false,
	},
	['Pepe - Greatfeather'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Greatfeather',
		additionalPack = false,
	},
	['Pepe - Knight'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Knight',
		additionalPack = false,
	},
	['Pepe - Kyrian'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Kyrian',
		additionalPack = false,
	},
	['Pepe - Necrolord'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Necrolord',
		additionalPack = false,
	},
	['Pepe - Night Fae'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Night Fae',
		additionalPack = false,
	},
	['Pepe - Ninja'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Ninja',
		additionalPack = false,
	},
	['Pepe'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Pepe',
		additionalPack = false,
	},
	["Pepe - Pepe'jin"] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = "Pepe'jin",
		additionalPack = false,
	},
	['Pepe - Pirate'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Pirate',
		additionalPack = false,
	},
	['Pepe - Scuba'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Scuba',
		additionalPack = false,
	},
	['Pepe - Spooky'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Spooky',
		additionalPack = false,
	},
	['Pepe - Traveler'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Traveler',
		additionalPack = false,
	},
	['Pepe - Venthyr'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Venthyr',
		additionalPack = false,
	},
	['Pepe - Viking'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Viking',
		additionalPack = false,
	},
}

function DSI:GetIconList()
	local tempList = {}

	for key, value in next, DSI.customIcons do
		tempList[key] = value

		tempList[key].path = nil
		tempList[key].path = DSI:GetIconPath(tempList[key].additionalPack)

		tempList[key].valid = nil
		tempList[key].valid = DSI:TextureExists(tempList[key].path..key..'\\Normal')
	end

	for key, value in next, iconList do
		tempList[key] = value

		tempList[key].path = nil
		tempList[key].path = DSI:GetIconPath(tempList[key].additionalPack)

		tempList[key].valid = nil
		tempList[key].valid = DSI:TextureExists(tempList[key].path..key..'\\Normal')
	end

	return tempList
end
