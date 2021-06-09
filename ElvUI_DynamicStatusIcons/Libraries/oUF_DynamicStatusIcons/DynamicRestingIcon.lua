local oUF = ElvUF or oUF

local function Update(self)
	local element = self.DynamicRestingIcon
	local unit = self.unit

	if element.PreUpdate then
		element:PreUpdate()
	end

	local isResting

	if UnitIsUnit(unit, 'player') and IsResting() and not UnitIsDeadOrGhost(unit) and not UnitAffectingCombat(unit) then
		isResting = true
	else
		isResting = false
	end

	element:SetShown(isResting)

	if element.PostUpdate then
		return element:PostUpdate(isResting)
	end
end

local function Path(self, ...)
	return (self.DynamicRestingIcon.Override or Update) (self, ...)
end

local function ForceUpdate(element)
	return Path(element.__owner, 'ForceUpdate')
end

local function Enable(self, unit)
	local element = self.DynamicRestingIcon
	unit = unit and unit:match('(%a+)%d*$')

	if element and (unit == 'player' or unit == 'target') then
		element.__owner = self
		element.ForceUpdate = ForceUpdate
		element.ForceUpdate(element)

		self:RegisterEvent('PLAYER_ALIVE', Path, true)
		self:RegisterEvent('PLAYER_DEAD', Path, true)
		self:RegisterEvent('PLAYER_UNGHOST', Path, true)
		self:RegisterEvent('PLAYER_UPDATE_RESTING', Path, true)
		self:RegisterEvent('PLAYER_REGEN_DISABLED', Path, true)
		self:RegisterEvent('PLAYER_REGEN_ENABLED', Path, true)

		if element:IsObjectType('Texture') and not element:GetTexture() then
			element:SetTexture([[Interface\AddOns\ElvUI_DynamicStatusIcons\Icons\Pepe\Resting]])
		end

		return true
	end
end

local function Disable(self)
	local element = self.DynamicRestingIcon

	if element then
		element:Hide()

		self:UnregisterEvent('PLAYER_ALIVE', Path)
		self:UnregisterEvent('PLAYER_DEAD', Path)
		self:UnregisterEvent('PLAYER_UNGHOST', Path)
		self:UnregisterEvent('PLAYER_UPDATE_RESTING', Path)
		self:UnregisterEvent('PLAYER_REGEN_DISABLED', Path)
		self:UnregisterEvent('PLAYER_REGEN_ENABLED', Path)
	end
end

oUF:AddElement('DynamicRestingIcon', Path, Enable, Disable)
