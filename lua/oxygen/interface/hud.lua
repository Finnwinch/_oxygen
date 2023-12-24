hook.Add("HUDPaint","interface oxygen",function()
    local OxygenLevel = LocalPlayer():GetOxygen()
    draw.SimpleText(string.format("Niveau d'oxygen : %s / 100",tostring(OxygenLevel)),"default",0,0,color_white)
end)