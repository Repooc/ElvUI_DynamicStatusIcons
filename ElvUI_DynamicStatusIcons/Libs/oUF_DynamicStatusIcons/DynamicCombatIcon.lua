local oUF = ElvUF or oUF

local function Update(self)
	local element = self.DynamicCombatIcon
	local unit = self.unit

	if element.PreUpdate then
		element:PreUpdate()
	end

	local inCombat

	if UnitAffectingCombat(unit) then
		inCombat = true
	else
		inCombat = false
	end

	element:SetShown(inCombat)

	if element.PostUpdate then
		return element:PostUpdate(inCombat)
	end
end

local function Path(self, ...)
	return (self.DynamicCombatIcon.Override or Update) (self, ...)
end

local function ForceUpdate(element)
	return Path(element.__owner, 'ForceUpdate')
end

local function Enable(self, unit)
	local element = self.DynamicCombatIcon
	unit = unit and unit:match('(%a+)%d*$')

	if element and (unit == 'player' or unit == 'target') then
		element.__owner = self
		element.ForceUpdate = ForceUpdate
		element.ForceUpdate(element)

		self:RegisterEvent('UNIT_COMBAT', Path)
		self:RegisterEvent('UNIT_FLAGS', Path)
		self:RegisterEvent('PLAYER_REGEN_DISABLED', Path, true)
		self:RegisterEvent('PLAYER_REGEN_ENABLED', Path, true)

		if element:IsObjectType('Texture') and not element:GetTexture() then
			element:SetTexture([[Interface\AddOns\ElvUI_DynamicStatusIcons\Icons\Pepe\Combat]])
		end

		return true
	end
end

local function Disable(self)
	local element = self.DynamicCombatIcon
	if element then
		element:Hide()

		self:UnregisterEvent('UNIT_COMBAT', Path)
		self:UnregisterEvent('UNIT_FLAGS', Path)
		self:UnregisterEvent('PLAYER_REGEN_DISABLED', Path)
		self:UnregisterEvent('PLAYER_REGEN_ENABLED', Path)
	end
end

oUF:AddElement('DynamicCombatIcon', Path, Enable, Disable)
