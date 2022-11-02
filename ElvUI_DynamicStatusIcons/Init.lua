local E, L, V, P, G = unpack(ElvUI)
local EP = LibStub('LibElvUIPlugin-1.0')
local AddOnName, Engine = ...

--GLOBALS: LibStub, GetAddOnMetadata, CreateFrame, GetAddOnEnableState
local _G = _G

local DSI = E:NewModule(AddOnName, 'AceConsole-3.0', 'AceHook-3.0', 'AceEvent-3.0')
Engine[1] = DSI
Engine[2] = E
Engine[3] = L
Engine[4] = V
Engine[5] = P
Engine[6] = G
_G[AddOnName] = Engine

DSI.Configs = {}

local function GetOptions()
	for _, func in pairs(DSI.Configs) do
		func()
	end
end

local txframe = CreateFrame('Frame')
local tx = txframe:CreateTexture()
function DSI:TextureExists(path)
	if not path or path == '' then
		return print('Path not valid or defined.', 'error')
	end
	tx:SetTexture('?')
	tx:SetTexture(path)

	return (tx:GetTexture() ~= '?')
end

function DSI:GetIconPath(additionalPack)
	if additionalPack then
		return E.global.DSI.customDSIconsPath
	else
		return E.global.DSI.defaultPacksPath
	end
end

function DSI:Initialize()
	-- if E.private.install_complete and E.private.DSI.install_version == nil then
	-- 	E.PluginInstaller:Queue(DSI.InstallerData)
	-- end

	DSI:ConstructElements()

	EP:RegisterPlugin(AddOnName, GetOptions)
end

E.Libs.EP:HookInitialize(DSI, DSI.Initialize)
