hook.Add("PlayerPostThink","askOxygenLevel",function(ply)
    ply:InterogationOxygen()
end)