local DSI, E, L, V, P, G = unpack(select(2, ...))

local sharedOptions = {
	enable = true,
	iconpack = "Pepe - Pepe'jin",
	anchorPoint = 'TOP',
	frameLevel = 100,
	frameStrata = 'MEDIUM',
	xOffset = -3,
	yOffset = 6,
	scale = 1,
	faceright = false,
	color = {
		r = 0.0117647058823529,
		g = 0.5568627450980392,
		b = 0.9843137254901961,
		a = 1
	},
}

P.unitframe.units.player.DynamicStatusIcons = sharedOptions
P.unitframe.units.target.DynamicStatusIcons = sharedOptions
