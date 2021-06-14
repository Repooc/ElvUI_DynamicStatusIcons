local DSI, E = unpack(select(2, ...))

local iconList = {
	--! Icons Shipped w/ DSI
	--* Stock Icons of Classes
	['Pepe - Classes - Death Knight (Tier 7)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Death Knight (Tier 7)',
		additionalPack = false,
	},
	['Pepe - Classes - Demon Hunter (Tier 19)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Demon Hunter (Tier 19)',
		additionalPack = false,
	},
	['Pepe - Classes - Druid (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Druid (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Classes - Hunter (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Hunter (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Classes - Mage (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Mage (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Classes - Monk (Tier 14)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Monk (Tier 14)',
		additionalPack = false,
	},
	['Pepe - Classes - Paladin (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Paladin (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Classes - Priest (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Priest (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Classes - Rogue (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Rogue (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Classes - Shaman (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Shaman (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Classes - Warlock (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Pepe',
		name = 'Warlock (Tier 1)',
		additionalPack = false,
	},
	['Pepe - Classes - Warrior (Tier 1)'] = {
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
	--! Icons Shipped w/ DSI
	--* Stock Icons of Euro 2020
	['Pepe - Euro 2020 - Austria'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Austria',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Belgium'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Belgium',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Croatia'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Croatia',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Czech Republic'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Czech Republic',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Denmark'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Denmark',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - England'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'England',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Finland'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Finland',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - France'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'France',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Germany'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Germany',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Hungary'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Hungary',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Italy'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Italy',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Netherlands'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Netherlands',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - North Macedonia'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'North Macedonia',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Poland'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Poland',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Portugal'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Portugal',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Russia'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Russia',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Scotland'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Scotland',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Slovakia'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Slovakia',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Spain'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Spain',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Sweden'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Sweden',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Switzerland'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Switzerland',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Turkey'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Turkey',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Ukraine'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Ukraine',
		additionalPack = false,
	},
	['Pepe - Euro 2020 - Wales'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Wales',
		additionalPack = false,
	},
	--! Icons Shipped w/ DSI
	--* Stock Icons of Murlocs
	['Murloc - Knight-Captain Murky'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Knight-Captain Murky',
		additionalPack = false,
	},
	['Murloc - Finduin'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Finduin',
		additionalPack = false,
	},
	['Murloc - Gillvanas'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Gillvanas',
		additionalPack = false,
	},
	['Murloc - Legionnaire Murky'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Legionnaire Murky',
		additionalPack = false,
	},
	['Murloc - Murkidan'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Murkidan',
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
