---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 16.12.2021 21:48
---
function CreateDownInterface(data)
    AddDownInterfaceElement(data,"icons\\line")
    AddDownInterfaceElement(data,"icons\\circle")
    AddDownInterfaceElement(data,"icons\\curve")
    AddDownInterfaceElement(data,"icons\\triangle")
    AddDownInterfaceElement(data,"icons\\wave")
    AddDownInterfaceElement(data,"icons\\squae")
    AddDownInterfaceElement(data,"icons\\smallrocks")
    AddDownInterfaceElement(data,"icons\\circleHeal")
    AddDownInterfaceElement(data,"icons\\clock")
    AddDownInterfaceElement(data,"icons\\icewall")
    AddDownInterfaceElement(data,"icons\\deathcross")
    AddDownInterfaceElement(data,"icons\\grandcross")
    AddDownInterfaceElement(data,"icons\\z")
    AddDownInterfaceElement(data,"icons\\m")




end

function AddDownInterfaceElement(data, name)
    local step = 0.039
    if not data.nextElement then
        data.nextElement = 0
    end
    data.nextElement = data.nextElement + step
    CreateSimpleFrameGlue(data.nextElement, 0.02, name)
end