local oUF = ElvUF or oUF

local function Update(self)
	local element = self.DynamicNormalIcon
	local unit = self.unit

	if element.PreUpdate then
		element:PreUpdate()
	end

	local isShown
	local playerCheck = UnitIsUnit(unit, 'player') and not IsResting()
	local goAhead = UnitExists(unit) and not UnitIsDeadOrGhost(unit) and not UnitAffectingCombat(unit)

	if playerCheck and goAhead then
		isShown = true
	elseif goAhead and not UnitIsUnit(unit, 'player') then
		isShown = true
	else
		isShown = false
	end

	element:SetShown(isShown)

	if element.PostUpdate then
		return element:PostUpdate(isShown)
	end
end

local function Path(self, ...)
	return (self.DynamicNormalIcon.Override or Update) (self, ...)
end

local function ForceUpdate(element)
	return Path(element.__owner, 'ForceUpdate')
end

local function Enable(self, unit)
	local element = self.DynamicNormalIcon
	unit = unit and unit:match('(%a+)%d*$')

	if element and (unit == 'player' or unit == 'target') then
		element.__owner = self
		element.ForceUpdate = ForceUpdate
		-- element.ForceUpdate(element)

		self:RegisterEvent('PLAYER_FLAGS_CHANGED', Path)
		self:RegisterEvent('PLAYER_TARGET_CHANGED', Path, true)
		self:RegisterEvent('UNIT_COMBAT', Path)
		self:RegisterEvent('UNIT_FLAGS', Path)
		self:RegisterEvent('PLAYER_REGEN_DISABLED', Path, true)
		self:RegisterEvent('PLAYER_REGEN_ENABLED', Path, true)
		self:RegisterEvent('PLAYER_UPDATE_RESTING', Path, true)
		self:RegisterEvent('PLAYER_ALIVE', Path, true)
		self:RegisterEvent('PLAYER_DEAD', Path, true)
		self:RegisterEvent('PLAYER_UNGHOST', Path, true)

		if element:IsObjectType('Texture') and not element:GetTexture() then
			element:SetTexture([[Interface\AddOns\ElvUI_DynamicStatusIcons\Icons\Pepe\Normal]])
		end

		return true
	end
end

local function Disable(self)
	local element = self.DynamicNormalIcon

	if element then
		element:Hide()

		self:UnregisterEvent('PLAYER_FLAGS_CHANGED', Path)
		self:UnregisterEvent('PLAYER_TARGET_CHANGED', Path)
		self:UnregisterEvent('UNIT_COMBAT', Path)
		self:UnregisterEvent('UNIT_FLAGS', Path)
		self:UnregisterEvent('PLAYER_REGEN_DISABLED', Path)
		self:UnregisterEvent('PLAYER_REGEN_ENABLED', Path)
		self:UnregisterEvent('PLAYER_UPDATE_RESTING', Path)
		self:UnregisterEvent('PLAYER_ALIVE', Path)
		self:UnregisterEvent('PLAYER_DEAD', Path)
		self:UnregisterEvent('PLAYER_UNGHOST', Path)
	end
end

oUF:AddElement('DynamicNormalIcon', Path, Enable, Disable)
