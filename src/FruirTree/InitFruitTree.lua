---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 19.12.2021 21:47
---
FruitTreeTable = {}
function DamageFruitTree(tree)
    if GetDestructableTypeId(tree) == FourCC("CTtr") or GetDestructableTypeId(tree) == FourCC("CTtc")  then
        local handle = GetHandleId(tree)
        if not FruitTreeTable[handle] then
            --print("первый раз")
            FruitTreeTable[handle] = {
                charges = 20,
                tree    = tree,
            }
        end
        local data = FruitTreeTable[handle]
        if data.charges > 0 then
            FallFruit(data)
            data.charges = data.charges - 1
            TimerStart(CreateTimer(), 20, false, function()
                data.charges = data.charges + 1
            end)
        end
    end
end

function FallFruit(data)
    local x, y = GetDestructableX(data.tree), GetDestructableY(data.tree)
    x, y = MoveXY(x, y, GetRandomInt(250, 750), GetRandomInt(0, 360))
    local zs=1000
    local eff = AddSpecialEffect("RedApple", x, y)
    BlzSetSpecialEffectYaw(eff, math.rad(GetRandomInt(0,360)))
    BlzSetSpecialEffectZ(eff, zs)
    BlzSetSpecialEffectPitch(eff, math.rad(90))
    TimerStart(CreateTimer(), TIMER_PERIOD64, true, function()
        local z = BlzGetLocalSpecialEffectZ(eff) - 20
        BlzSetSpecialEffectZ(eff, z)
        if z <= GetTerrainZ(x, y)+15 then

            --DestroyEffect(eff)
            CreateItemPrefab(x,y,"Apple",eff)
            DestroyTimer(GetExpiredTimer())
           -- print("приземлился")
        end
    end)
end