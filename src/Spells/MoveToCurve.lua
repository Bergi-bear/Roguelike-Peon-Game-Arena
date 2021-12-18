---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 12.12.2021 12:08
---
function MoveToCurve(data, points)
    local eff = AddSpecialEffect("Abilities\\Weapons\\SentinelMissile\\SentinelMissile.mdl", points[1].x, points[1].y)--Abilities\\Weapons\\Mortar\\MortarMissile.mdl
    MoveElement2Next(points, 1, eff, data)
end

function MoveElement2Next(points, element, eff, data)
    if element < #points then
        local i=0
        TimerStart(CreateTimer(), TIMER_PERIOD64, true, function()
            local speed = 15
            local angle = Vector:angleBetween2Vectors(points[element], points[element + 1])
            --print(element, " летим", angle, Distance(points[element], points[element + 1]))
            local vector = Vector:new(BlzGetLocalSpecialEffectX(eff), BlzGetLocalSpecialEffectY(eff), BlzGetLocalSpecialEffectZ(eff))
            local newVector = vector
            --newVector = VectorSum(newVector, vector:yawPitchOffset(speed, angle * (math.pi / 180), 0.0)) --было
            newVector = VectorSum(newVector, VectorSubtract(points[element + 1], newVector):normalize() * speed)--стало

            BlzSetSpecialEffectYaw(eff, math.rad(angle))
            --BlzSetSpecialEffectPosition(eff, newVector.x, newVector.y, 50)
            BlzSetSpecialEffectX(eff, newVector.x)
            BlzSetSpecialEffectY(eff, newVector.y)
            BlzSetSpecialEffectZ(eff, GetTerrainZ(newVector.x,newVector.y)+50)
            i=i+1
            if i>=50 then
                --print("сошел с орбиты")
                DestroyEffect(eff)
                DestroyTimer(GetExpiredTimer())
            end
            if Distance(newVector, points[element + 1]) <= (speed * 2) + 1  then
                --print("долетел, следующий пошел")
                DestroyTimer(GetExpiredTimer())
                if UnitDamageArea(data.UnitHero, 100, newVector.x, newVector.y, 90) then
                    DestroyEffect(eff)
                else
                    MoveElement2Next(points, element + 1, eff,data)
                end
            end
        end)
    else
        DestroyEffect(eff)
        --print("конец")
    end
end


