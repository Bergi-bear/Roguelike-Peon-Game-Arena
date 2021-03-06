---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 30.12.2021 0:36
---
function CreateStatPanel(data)
    local container = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), '', 0)
    BlzFrameSetVisible(container, GetLocalPlayer() == Player(data.pid))
    local x, y = -0.1, 0.5
    local nameStats = {
        "spellDamage",
        "armor",
        "manaRegen"
    }
    for i = 1, #nameStats do
        CreateStatElement(data, container, x, y - (i - 1) * GNext / 2, nameStats[i])

    end
end

function CreateStatElement(data, parent, x, y, name)
    local ico = "dds\\StatPanel\\" .. name
    local frame = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', parent, '', 0)
    BlzFrameSetParent(frame, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetTexture(frame, ico, 0, true)
    BlzFrameSetSize(frame, GNext / 2, GNext / 2)
    BlzFrameSetAbsPoint(frame, FRAMEPOINT_CENTER, x, y)
    local text = BlzCreateFrameByType("TEXT", "ButtonChargesText", frame, "", 0)
    BlzFrameSetPoint(text, FRAMEPOINT_LEFT, frame, FRAMEPOINT_LEFT, 0.025, 0.0)
    BlzFrameSetText(text, "base")
    BlzFrameSetParent(text, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    if name == "armor" then
        TimerStart(CreateTimer(), 0.5, true, function()
            BlzFrameSetText(text, BlzGetUnitArmor(data.UnitHero))
        end)
    elseif name == "spellDamage" then
        if not data.spellDamage then
            data.spellDamage = 1.1
        end
        TimerStart(CreateTimer(), 0.5, true, function()
            BlzFrameSetText(text, data.spellDamage)
        end)
    elseif name == "manaRegen" then
        BlzFrameSetTexture(frame, "ReplaceableTextures\\CommandButtons\\BTNBrilliance.blp", 0, true)
        TimerStart(CreateTimer(), 0.5, true, function()
            BlzFrameSetText(text, BlzGetUnitRealField(data.UnitHero,UNIT_RF_MANA_REGENERATION))
        end)
    end
end
