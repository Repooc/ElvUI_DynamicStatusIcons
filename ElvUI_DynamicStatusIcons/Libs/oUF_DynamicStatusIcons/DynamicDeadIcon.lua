local oUF = ElvUF or oUF

local function Update(self)
	local element = self.DynamicDeadIcon
	local unit = self.unit

	if element.PreUpdate then
		element:PreUpdate()
	end

	local isDead

	if UnitIsDead(unit) or UnitIsGhost(unit) then
		isDead = true
	else
		isDead = false
	end

	element:SetShown(isDead)

	if element.PostUpdate then
		return element:PostUpdate(isDead)
	end
end

local function Path(self, ...)
	return (self.DynamicDeadIcon.Override or Update) (self, ...)
end

local function ForceUpdate(element)
	return Path(element.__owner, 'ForceUpdate')
end

local function Enable(self, unit)
	local element = self.DynamicDeadIcon
	unit = unit and unit:match('(%a+)%d*$')

	if element and (unit == 'player' or unit == 'target') then
		element.__owner = self
		element.ForceUpdate = ForceUpdate
		element.ForceUpdate(element)

		self:RegisterEvent('UNIT_FLAGS', Path)
		self:RegisterEvent('PLAYER_FLAGS_CHANGED', Path)
		-- self:RegisterEvent('UNIT_HEALTH', Path)
		self:RegisterEvent('PLAYER_ALIVE', Path, true)
		self:RegisterEvent('PLAYER_DEAD', Path, true)
		self:RegisterEvent('PLAYER_UNGHOST', Path, true)

		if element:IsObjectType('Texture') and not element:GetTexture() then
			element:SetTexture([[Interface\AddOns\ElvUI_DynamicStatusIcons\Icons\Pepe\Dead]])
		end

		return true
	end
end

local function Disable(self)
	local element = self.DynamicDeadIcon
	if element then
		element:Hide()

		self:UnregisterEvent('UNIT_FLAGS', Path)
		self:UnregisterEvent('PLAYER_FLAGS_CHANGED', Path)
		-- self:UnregisterEvent('UNIT_HEALTH', Path)
		self:UnregisterEvent('PLAYER_ALIVE', Path)
		self:UnregisterEvent('PLAYER_DEAD', Path)
		self:UnregisterEvent('PLAYER_UNGHOST', Path)
	end
end

oUF:AddElement('DynamicDeadIcon', Path, Enable, Disable)
