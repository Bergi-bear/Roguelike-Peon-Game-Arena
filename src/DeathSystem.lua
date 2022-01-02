---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 08.03.2021 21:07
---
do
    local InitGlobalsOrigin = InitGlobals
    function InitGlobals()
        InitGlobalsOrigin()
        TimerStart(CreateTimer(), 1, false, function()
            InitDeathEvent()
            DestroyTimer(GetExpiredTimer())
        end)
    end
end
function InitDeathEvent()
    local this = CreateTrigger()
    TriggerRegisterAnyUnitEventBJ(this, EVENT_PLAYER_UNIT_DEATH)
    TriggerAddAction(this, function()
        local u = GetTriggerUnit() --тот кто умер
        local killer = GetKillingUnit()
        local xu, yu = GetUnitXY(u)

        if IsUnitEnemy(u,GetOwningPlayer(killer)) then
            if HERO[GetPlayerId(GetOwningPlayer(killer))].UnitHero then
                --print("Есть герой")

                if killer then
                    print(GetUnitName(killer),GetUnitName(u))
                    EffectFromUnit2Unit("Firebrand Shot Yellow",GetUnitData(killer).UnitHero,u)
                end
            else
                --print("нет героя")
            end

            for i = 1, #SlimeID do
                if GetUnitTypeId(u) == SlimeID[i] then
                    --print("умер слайм")
                    normal_sound(SlimeSound[4], xu, yu, 50)
                    TimerStart(CreateTimer(), 15, false, function()
                        local x, y = GetRandomReal(GetRectMinX(gg_rct_Bound01), GetRectMaxX(gg_rct_Bound01)), GetRandomReal(GetRectMinY(gg_rct_Bound01), GetRectMaxY(gg_rct_Bound01))
                        --print(x,y)
                        local new = CreateUnit(Player(10), SlimeID[i], x, y, 0)
                        SlimeAddMoveEvent(new)
                    end)
                    --CreateItemPrefab(xu,yu,"Slime Card")
                    CreateItemPrefabPool(GetUnitData(killer),xu, yu, "Slime Card", "Slime Jelly", "Slime Egg")
                end
            end
            for i = 1, #BugID do
                if GetUnitTypeId(u) == BugID[i] then
                    TimerStart(CreateTimer(), 15, false, function()
                        local x, y = GetRandomReal(GetRectMinX(gg_rct_Bound02), GetRectMaxX(gg_rct_Bound02)), GetRandomReal(GetRectMinY(gg_rct_Bound02), GetRectMaxY(gg_rct_Bound02))
                        --print(x,y)
                        local new = CreateUnit(Player(10), BugID[i], x, y, 0)

                    end)
                    --CreateItemPrefab(xu,yu,"Slime Card")
                    CreateItemPrefabPool(GetUnitData(killer),xu, yu, "Bag Card", "Shell")
                end
            end
        end
    end)
end