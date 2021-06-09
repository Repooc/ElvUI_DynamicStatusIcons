local DSI, E, L, V, P, G = unpack(select(2, ...))
local UF = E:GetModule('UnitFrames')

local CreateFrame = CreateFrame

function UF:Construct_DynamicStatusIcons(frame)
	local anchor = CreateFrame('Frame', nil, frame.RaisedElementParent)

	frame.DynamicCombatIcon = anchor:CreateTexture(nil, 'OVERLAY')
	frame.DynamicDeadIcon = anchor:CreateTexture(nil, 'OVERLAY')
	frame.DynamicNormalIcon = anchor:CreateTexture(nil, 'OVERLAY')
	frame.DynamicRestingIcon = anchor:CreateTexture(nil, 'OVERLAY')
	frame.DynamiczZzIcon = anchor:CreateTexture(nil, 'OVERLAY')

	anchor:Size(64)
	frame.DynamicNormalIcon:SetAllPoints(anchor)

	frame.DynamicCombatIcon.PostUpdate = UF.Update_DynamicStatusIcons
	frame.DynamicDeadIcon.PostUpdate = UF.Update_DynamicStatusIcons
	frame.DynamicNormalIcon.PostUpdate = UF.Update_DynamicStatusIcons
	frame.DynamicRestingIcon.PostUpdate = UF.Update_DynamicStatusIcons
	frame.DynamiczZzIcon.PostUpdate = UF.Update_DynamicStatusIcons

	return anchor
end

function UF:Update_DynamicStatusIcons()
	local anchor = self:GetParent()
	local frame = anchor:GetParent():GetParent()

	local dead = frame.DynamicDeadIcon
	local combat = frame.DynamicCombatIcon
	local normal = frame.DynamicNormalIcon
	local resting = frame.DynamicRestingIcon
	local zZz = frame.DynamiczZzIcon

	local db = frame.db.DynamicStatusIcons

	local isCombat = combat:IsShown()
	local isDead = dead:IsShown()
	local isNormal = normal:IsShown()
	local isResting = resting:IsShown()

	combat:ClearAllPoints()
	dead:ClearAllPoints()
	normal:ClearAllPoints()
	resting:ClearAllPoints()
	zZz:ClearAllPoints()

	-- ULx ULy LLx LLy URx URy LRx LRy
	local faceLeft = {0, 0, 0, 1, 1, 0, 1, 1} -- Default Facing (Left)
	local faceRight = {1, 0, 1, 1, 0, 0, 0, 1} -- Opposite Facing (Right)
	local direction = db.faceright and faceRight or faceLeft

	combat:SetTexCoord(unpack(direction))
	dead:SetTexCoord(unpack(direction))
	normal:SetTexCoord(unpack(direction))
	resting:SetTexCoord(unpack(direction))

	if db and db.enable then
		if isDead then
			dead:SetAllPoints(anchor)
		elseif isCombat then
			combat:SetAllPoints(anchor)
		elseif isResting then
			resting:SetAllPoints(anchor)
			zZz:SetAllPoints(anchor)
		elseif isNormal then
			normal:SetAllPoints(anchor)
		end
	end
end

function UF:Configure_DynamicStatusIcons(frame)
	local iconAnchor = frame.DynamicStatusIcons
	local db = frame.db.DynamicStatusIcons
	local iconDB = DSI:GetIconList()

	local path = iconDB[db.iconpack].path..db.iconpack

	if db and db.enable then
		iconAnchor:Show()
		if not frame:IsElementEnabled('DynamicNormalIcon') then
			frame:EnableElement('DynamicCombatIcon')
			frame:EnableElement('DynamicDeadIcon')
			frame:EnableElement('DynamicNormalIcon')
			frame:EnableElement('DynamicRestingIcon')
			frame:EnableElement('DynamiczZzIcon')
		end

		iconAnchor:ClearAllPoints()
		if frame.ORIENTATION ~= 'RIGHT' and (frame.USE_PORTRAIT and not frame.USE_PORTRAIT_OVERLAY) then
			iconAnchor:Point('CENTER', frame.Portrait, db.anchorPoint, db.xOffset, db.yOffset)
		else
			iconAnchor:Point('CENTER', frame.Health, db.anchorPoint, db.xOffset, db.yOffset)
		end

		-- local faceLeft = {0, 0, 0, 1, 1, 0, 1, 1} -- Default Facing (Left)
		-- local faceRight = {1, 0, 1, 1, 0, 0, 0, 1} -- Opposite Facing (Right)
		-- local direction = db.faceright and faceRight or faceLeft

		frame.DynamicCombatIcon:SetTexture(path..'\\Combat')
		frame.DynamicDeadIcon:SetTexture(path..'\\Dead')
		frame.DynamicNormalIcon:SetTexture(path..'\\Normal')
		frame.DynamicRestingIcon:SetTexture(path..'\\Resting')
		if db.faceright then
			frame.DynamiczZzIcon:SetTexture('Interface\\AddOns\\ElvUI_DynamicStatusIcons\\Textures\\zZz - Right')
		else
			frame.DynamiczZzIcon:SetTexture('Interface\\AddOns\\ElvUI_DynamicStatusIcons\\Textures\\zZz - Left')
		end

		frame.DynamiczZzIcon:SetVertexColor(db.color.r, db.color.g, db.color.b, db.color.a)

		iconAnchor:SetScale(db.scale)
	elseif frame:IsElementEnabled('DynamicNormalIcon') then
		iconAnchor:Hide()
		frame:DisableElement('DynamicCombatIcon')
		frame:DisableElement('DynamicDeadIcon')
		frame:DisableElement('DynamicNormalIcon')
		frame:DisableElement('DynamicRestingIcon')
		frame:DisableElement('DynamiczZzIcon')
	end
end

function DSI:UpdateClassColors(frame)
	if not frame or not frame.unit then return end
	local unit = frame.unit

	local color = E.db.unitframe.units[unit].DynamicStatusIcons.color
	if E:CheckClassColor(color.r, color.g, color.b) then
		color = E:ClassColor(E.myclass, true)
		E.db.unitframe.units[unit].DynamicStatusIcons.color.r = color.r
		E.db.unitframe.units[unit].DynamicStatusIcons.color.g = color.g
		E.db.unitframe.units[unit].DynamicStatusIcons.color.b = color.b
	end
end

function DSI:Update_PlayerFrame(frame)
	if not frame then return end

	if not frame.DynamicStatusIcons then
		frame.DynamicStatusIcons = UF:Construct_DynamicStatusIcons(frame)
	end

	DSI:UpdateClassColors(frame)
	UF:Configure_DynamicStatusIcons(frame)
end

function DSI:Update_TargetFrame(frame)
	if not frame then return end

	if not frame.DynamicStatusIcons then
		frame.DynamicStatusIcons = UF:Construct_DynamicStatusIcons(frame)
	end

	DSI:UpdateClassColors(frame)
	UF:Configure_DynamicStatusIcons(frame)
end

function DSI:InitPlayer()
	hooksecurefunc(UF, 'Update_PlayerFrame', DSI.Update_PlayerFrame)
end

function DSI:InitTarget()
	hooksecurefunc(UF, 'Update_TargetFrame', DSI.Update_TargetFrame)
end

function DSI:ConstructElements()
	DSI:InitPlayer()
	DSI:InitTarget()
end
