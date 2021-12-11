---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 01.12.2021 19:01
---
---
---

function VectorSubtract(vector1, vector2)
    return Vector:new(vector1.x - vector2.x, vector1.y - vector2.y, vector1.z - vector2.z)
end

function VectorSum(vector1, vector2)
    return Vector:new(vector1.x + vector2.x, vector1.y + vector2.y, vector1.z + vector2.z)
end

function InitInputHandler (data)
    nimValueToExtend = 1 / 4 * 128
    data.Points = {}
    data.Effects = {}
    data.sides = {}
    data.previousDirection = 0
end

function ClearPoints(data)
    data.Points = {}
end

function InputUpdate (data,x,y)
    --local x, y = data.fakeX, data.fakeY --GetPlayerMouseX[data.pid], GetPlayerMouseY[data.pid]
    local vector = Vector:new(x, y, 0)

    if data.LMBIsPressed then
        --print(#Points,Points[#Points])
        if (#data.Points > 0 and
                DistanceBetweenXY(x, y, data.Points[#data.Points].x, data.Points[#data.Points].y) < nimValueToExtend) then
            --print("обрыв")
            return
        end
        table.insert(data.Points, vector)
        --print("insert OK")

        table.insert(data.Effects, CreateTMPEffect(x,y, "units\\nightelf\\Wisp\\Wisp"))

        ShapeDetectorAdd(data.Points[#data.Points],
                #data.Points <= 1 and 0 or data.Points[#data.Points - 1], data)
    end
end