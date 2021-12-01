---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 01.12.2021 19:34
---
---
squareCount = 0;
sharpCount = 0;
obtuseCount = 0;
function Distance(vector1, vector2)
    return DistanceBetweenXY(vector1.x, vector1.y, vector2.x, vector2.y)
end

function DetectAngle(angle)
    if angle < 90 + rangeForSquareAngle and angle > 90 - rangeForSquareAngle then
        --print("SquareAngle! " .. angle)
        squareCount = squareCount + 1

    elseif (angle > 90) then
        --print("SharpAngle! " .. angle)
        sharpCount = sharpCount + 1

    elseif (angle < 90) then
        --print("ObtuseAngle! " .. angle)
        obtuseCount = obtuseCount + 1
    end
end

function ShapeDetectorAdd(current, previous)
    rangeForSquareAngle = 15

    if (current.x == current.y and current.x == current.z) or (previous.x == previous.y and previous.x == previous.z) then return end

    local angle = math.deg(current:angleBetween(previous))
    --print(angle)

    -- Detection Angles
    DetectAngle(angle)


end

function ShapeDetectorClear()
    local maxDistanceForSquare = 2 * 128
    local maxDistanceForTriangle = 2 * 128
    local maxDistanceForCircle = 3 * 128
    local minDistanceForZ = 2 * 128
    local minDistanceForLine = 2 * 128

    if (#Points < 1) then
        return
    end

    -- Additional Angles
    local angle = math.deg(VectorSubtract(Points[1], Points[#Points]):angleBetween(VectorSubtract(Points[2], Points[1])))
    DetectAngle(angle)

    -- Detection Shapes
    if (squareCount >= 3 and Distance(Points[1], Points[#Points]) < maxDistanceForSquare) then

        print("It is Square!")

    elseif (sharpCount >= 2 and Distance(Points[1], Points[#Points]) < maxDistanceForTriangle) then

        print("It is Triangle!")

    elseif (obtuseCount >= 10 and sharpCount <= 1 and squareCount <= 1 and Distance(Points[1], Points[#Points]) < maxDistanceForCircle) then

        print("It is Circle!")

    elseif (sharpCount == 2 and Distance(Points[1], Points[#Points]) > minDistanceForZ) then

        print("It is definitely Z!")

    elseif (Distance(Points[1], Points[#Points]) > minDistanceForLine) then
        for i=1 , #Points do
            if(i >= 3) then
                if(math.deg(VectorSubtract(Points[i - 1], Points[i]):angleBetween(VectorSubtract(Points[i - 2], Points[i - 1]))) > 5) then return end
            end
        end
        print("It is definitely a Line!")

    end

    squareCount = 0;
    sharpCount = 0;
    obtuseCount = 0;
end