PLAYER = FindMetaTable("Player")
function PLAYER:SetupOxygen()
    if CLIENT then return end
    self.oxygen = 100
    self.oxygen_temoin = CurTime()
    self:SharedOxygen()
end
function PLAYER:SharedOxygen()
    if CLIENT then return end
    SetGlobal2Int(string.format("oxygenLevel %s",self:SteamID64()), self.oxygen )
end
function PLAYER:IncrementOxygen(valeur)
    if CLIENT then return end
    self.oxygen = self.oxygen - valeur
    self:SharedOxygen()
end
function PLAYER:GetOxygen()
    return GetGlobal2Int(string.format("oxygenLevel %s",self:SteamID64()),-1)
end
function PLAYER:SetOxygen(valeur)
    SetGlobal2Int(string.format("oxygenLevel %s",self:SteamID64()), valeur )
end
function PLAYER:InterogationOxygen()
    if CLIENT then return end
    if (self.oxygen_temoin + 5 >= CurTime()) then return end
    if (self:WaterLevel() == 3) then
        if (self:GetOxygen() > 0) then
            self:IncrementOxygen(Oxygen.valueInteration)
        end
        if (self:GetOxygen() <= 0) then
            self:SetHealth(self:Health() - Oxygen.damage)
            if (self:Health() <= 0) then self:Kill() end
        end
    else
        if (self:GetOxygen() == 100) then return end
        self:IncrementOxygen(-Oxygen.valueInteration)
        if (self:GetOxygen() > 100) then
            self:SetOxygen(100)
        end
    end
    self.oxygen_temoin = CurTime()
end