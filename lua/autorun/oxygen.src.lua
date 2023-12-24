Oxygen = {}
include("oxygen/class/player.lua")
AddCSLuaFile("oxygen/class/player.lua")
if SERVER then
    include("oxygen/config/cfg.lua")
    include("oxygen/events/PlayerInitialSpawn.lua")
    include("oxygen/events/PlayerPostThink.lua")
    AddCSLuaFile("oxygen/interface/hud.lua")
end
if CLIENT then
    include("oxygen/interface/hud.lua")
end