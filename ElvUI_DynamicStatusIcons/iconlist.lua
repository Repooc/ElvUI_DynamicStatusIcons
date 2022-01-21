local DSI, E = unpack(select(2, ...))

local iconList = {
	--! ===============
	--! | Battle Pets |
	--! ===============
	['Battle Pets - Moonkin Hatchling - Alliance'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Moonkin Hatchling',
		name = 'Alliance',
	},
	['Battle Pets - Moonkin Hatchling - Horde'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Moonkin Hatchling',
		name = 'Horde',
	},
	['Battle Pets - Murloc - Finduin'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Finduin',
	},
	['Battle Pets - Murloc - Gillvanas'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Gillvanas',
	},
	['Battle Pets - Murloc - Glimr'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Glimr',
	},
	['Battle Pets - Murloc - KnightCaptain Murky'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Knight-Captain Murky',
	},
	['Battle Pets - Murloc - Legionnaire Murky'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Legionnaire Murky',
	},
	['Battle Pets - Murloc - Murgle'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Murgle',
	},
	['Battle Pets - Murloc - Murkidan'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Murkidan',
	},
	['Battle Pets - Murloc - Squirky'] = {
		pack = {'Stock Icons', 'Battle Pets'},
		packtype = 'Murlocs',
		name = 'Squirky',
	},
	--! ===========
	--! | Classes |
	--! ===========
	--* Death Knight
	['Classes - Pepe - Death Knight (Tier 7)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Death Knight',
		name = 'Tier 7',
	},
	--* Demon Hunter
	['Classes - Pepe - Demon Hunter (Tier 19)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Demon Hunter',
		name = 'Tier 19',
	},
	--* Druid
	['Classes - Pepe - Druid (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Druid',
		name = 'Tier 1',
	},
	['Classes - Pepe - Druid (Tier 2)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Druid',
		name = 'Tier 2',
	},
	--* Hunter
	['Classes - Pepe - Hunter (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Hunter',
		name = 'Tier 1',
	},
	['Classes - Pepe - Hunter (Tier 2)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Hunter',
		name = 'Tier 2',
	},
	--* Mage
	['Classes - Pepe - Mage (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Mage',
		name = 'Tier 1',
	},
	['Classes - Pepe - Mage (Tier 2)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Mage',
		name = 'Tier 2',
	},
	--* Monk
	['Classes - Pepe - Monk (Tier 14)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Monk',
		name = 'Tier 14',
	},
	--* Paladin
	['Classes - Pepe - Paladin (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Paladin',
		name = 'Tier 1',
	},
	['Classes - Pepe - Paladin (Tier 2)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Paladin',
		name = 'Tier 2',
	},
	--* Priest
	['Classes - Pepe - Priest (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Priest',
		name = 'Tier 1',
	},
	['Classes - Pepe - Priest (Tier 2)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Priest',
		name = 'Tier 2',
	},
	--* Rogue
	['Classes - Pepe - Rogue (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Rogue',
		name = 'Tier 1',
	},
	['Classes - Pepe - Rogue (Tier 2)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Rogue',
		name = 'Tier 2',
	},
	--* Shaman
	['Classes - Pepe - Shaman (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Shaman',
		name = 'Tier 1',
	},
	['Classes - Pepe - Shaman (Tier 2)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Shaman',
		name = 'Tier 2',
	},
	--* Warlock
	['Classes - Pepe - Warlock (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Warlock',
		name = 'Tier 1',
	},
	['Classes - Pepe - Warlock (Tier 2)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Warlock',
		name = 'Tier 2',
	},
	--* Warrior
	['Classes - Pepe - Warrior (Tier 1)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Warrior',
		name = 'Tier 1',
	},
	['Classes - Pepe - Warrior (Tier 2)'] = {
		pack = {'Stock Icons', 'Classes'},
		packtype = 'Warrior',
		name = 'Tier 2',
	},
	--! =====================
	--! | Copa America 2020 |
	--! =====================
	['Copa 2021 - Pepe - Argentina'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'CONMEBOL: Copa America 2021',
		name = 'Argentina',
	},
	['Copa 2021 - Pepe - Bolivia'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'CONMEBOL: Copa America 2021',
		name = 'Bolivia',
	},
	['Copa 2021 - Pepe - Brazil'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'CONMEBOL: Copa America 2021',
		name = 'Brazil',
	},
	['Copa 2021 - Pepe - Chile'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'CONMEBOL: Copa America 2021',
		name = 'Chile',
	},
	['Copa 2021 - Pepe - Colombia'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'CONMEBOL: Copa America 2021',
		name = 'Colombia',
	},
	['Copa 2021 - Pepe - Ecuador'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'CONMEBOL: Copa America 2021',
		name = 'Ecuador',
	},
	['Copa 2021 - Pepe - Paraguay'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'CONMEBOL: Copa America 2021',
		name = 'Paraguay',
	},
	['Copa 2021 - Pepe - Peru'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'CONMEBOL: Copa America 2021',
		name = 'Peru',
	},
	['Copa 2021 - Pepe - Uruguay'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'CONMEBOL: Copa America 2021',
		name = 'Uruguay',
	},
	['Copa 2021 - Pepe - Venezuela'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'CONMEBOL: Copa America 2021',
		name = 'Venezuela',
	},
	--! ================
	--! | Default Pepe |
	--! ================
	['Default - Pepe'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Pepe',
	},
	['Default - Pepe - Clockwork'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Clockwork',
	},
	['Default - Pepe - Demon Hunter'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Demon Hunter',
	},
	['Default - Pepe - Greatfeather'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Greatfeather',
	},
	['Default - Pepe - Knight'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Knight',
	},
	['Default - Pepe - Kyrian'] = {
		pack = {'Stock Icons', 'Covenants'},
		packtype = 'Pepe',
		name = 'Kyrian',
	},
	['Default - Pepe - Necrolord'] = {
		pack = {'Stock Icons', 'Covenants'},
		packtype = 'Pepe',
		name = 'Necrolord',
	},
	['Default - Pepe - Night Fae'] = {
		pack = {'Stock Icons', 'Covenants'},
		packtype = 'Pepe',
		name = 'Night Fae',
	},
	['Default - Pepe - Ninja'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Ninja',
	},
	["Default - Pepe - Pepe'jin"] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = "Pepe'jin",
	},
	['Default - Pepe - Pirate'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Pirate',
	},
	['Default - Pepe - Scuba'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Scuba',
	},
	['Default - Pepe - Spooky'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Spooky',
	},
	['Default - Pepe - Traveler'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Traveler',
	},
	['Default - Pepe - Venthyr'] = {
		pack = {'Stock Icons', 'Covenants'},
		packtype = 'Pepe',
		name = 'Venthyr',
	},
	['Default - Pepe - Viking'] = {
		pack = {'Stock Icons'},
		packtype = 'Pepe',
		name = 'Viking',
	},
	--! =============
	--! | Euro 2020 |
	--! =============
	['Euro 2020 - Pepe - Austria'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Austria',
	},
	['Euro 2020 - Pepe - Belgium'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Belgium',
	},
	['Euro 2020 - Pepe - Croatia'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Croatia',
	},
	['Euro 2020 - Pepe - Czech Republic'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Czech Republic',
	},
	['Euro 2020 - Pepe - Denmark'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Denmark',
	},
	['Euro 2020 - Pepe - England'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'England',
	},
	['Euro 2020 - Pepe - Finland'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Finland',
	},
	['Euro 2020 - Pepe - France'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'France',
	},
	['Euro 2020 - Pepe - Germany'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Germany',
	},
	['Euro 2020 - Pepe - Hungary'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Hungary',
	},
	['Euro 2020 - Pepe - Italy'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Italy',
	},
	['Euro 2020 - Pepe - Netherlands'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Netherlands',
	},
	['Euro 2020 - Pepe - North Macedonia'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'North Macedonia',
	},
	['Euro 2020 - Pepe - Poland'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Poland',
	},
	['Euro 2020 - Pepe - Portugal'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Portugal',
	},
	['Euro 2020 - Pepe - Russia'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Russia',
	},
	['Euro 2020 - Pepe - Scotland'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Scotland',
	},
	['Euro 2020 - Pepe - Slovakia'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Slovakia',
	},
	['Euro 2020 - Pepe - Spain'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Spain',
	},
	['Euro 2020 - Pepe - Sweden'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Sweden',
	},
	['Euro 2020 - Pepe - Switzerland'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Switzerland',
	},
	['Euro 2020 - Pepe - Turkey'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Turkey',
	},
	['Euro 2020 - Pepe - Ukraine'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Ukraine',
	},
	['Euro 2020 - Pepe - Wales'] = {
		pack = {'Stock Icons', 'Events'},
		packtype = 'UEFA: Euro 2020',
		name = 'Wales',
	},
	--! ===================
	--! | Heroes & Bosses |
	--! ===================
	['Heroes - Pepe - Bolvar'] = {
		pack = {'Heroes & Bosses'},
		packtype = 'Heroes',
		name = 'Bolvar Fordragon',
	},
	['Heroes - Pepe - Elisande'] = {
		pack = {'Heroes & Bosses'},
		packtype = 'Bosses',
		name = 'Elisande',
	},
	['Heroes - Pepe - Jaina'] = {
		pack = {'Heroes & Bosses'},
		packtype = 'Heroes',
		name = 'Jaina Proudmoore',
	},
	["Heroes - Pepe - Kael'Thas"] = {
		pack = {'Heroes & Bosses'},
		packtype = 'Bosses',
		name = "Kael'Thas Sunstrider",
	},
	['Heroes - Pepe - Lich King'] = {
		pack = {'Heroes & Bosses'},
		packtype = 'Bosses',
		name = 'The Lich King',
	},
	['Heroes - Pepe - Ragnaros'] = {
		pack = {'Heroes & Bosses'},
		packtype = 'Bosses',
		name = 'Ragnaros',
	},
	['Heroes - Pepe - Saurfang'] = {
		pack = {'Heroes & Bosses'},
		packtype = 'Heroes',
		name = 'Varok Saurfang',
	},
	['Heroes - Pepe - Sire Denathrius'] = {
		pack = {'Heroes & Bosses'},
		packtype = 'Bosses',
		name = 'Sire Denathrius',
	},
	['Heroes - Pepe - Sylvanas'] = {
		pack = {'Heroes & Bosses'},
		packtype = 'Bosses',
		name = 'Sylvanas Windrunner',
	},
	['Heroes - Pepe - Tyrande'] = {
		pack = {'Heroes & Bosses'},
		packtype = 'Heroes',
		name = 'Tyrande Whisperwind',
	},
	--! =========================
	--! | Sanctum of Domination |
	--! =========================
	['SoD - Pepe - Cloth (Heroic)'] = {
		pack = {'Classes', 'Gear Sets', 'Stock Icons'},
		packtype = {'Mage', 'Priest', 'Warlock'},
		name = 'SoD (H)',
	},
	['SoD - Pepe - Cloth (LFR)'] = {
		pack = {'Classes', 'Gear Sets', 'Stock Icons'},
		packtype = {'Mage', 'Priest', 'Warlock'},
		name = 'SoD (LFR)',
	},
	['SoD - Pepe - Cloth (Mythic)'] = {
		pack = {'Classes', 'Gear Sets', 'Stock Icons'},
		packtype = {'Mage', 'Priest', 'Warlock'},
		name = 'SoD (M)',
	},
	['SoD - Pepe - Cloth (Normal)'] = {
		pack = {'Classes', 'Gear Sets', 'Stock Icons'},
		packtype = {'Mage', 'Priest', 'Warlock'},
		name = 'SoD (N)',
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
