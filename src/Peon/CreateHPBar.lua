---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 21.12.2021 15:10
---
function CreateHPBar(data)
    local BoxBarParent = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), '', 0)
    BlzFrameSetVisible(BoxBarParent, GetLocalPlayer() == Player(data.pid))
    local x, y = -0.08, 0.588
    local hero = data.UnitHero


    --BlzFrameSetAlpha(into, 128)

    local chargesBox = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', BoxBarParent, '', 0)
    BlzFrameSetTexture(chargesBox, "Replaceabletextures\\Teamcolor\\Teamcolor06.blp", 0, true) --HPElement
    BlzFrameSetSize(chargesBox, GNext, GNext)
    BlzFrameSetAbsPoint(chargesBox, FRAMEPOINT_LEFT, x + 0.004, y)
    BlzFrameSetAlpha(chargesBox, 128)

    local into = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', BoxBarParent, '', 0)
    BlzFrameSetTexture(into, "into", 0, true)
    BlzFrameSetSize(into, GNext * 5, GNext)
    BlzFrameSetAbsPoint(into, FRAMEPOINT_LEFT, x, y)
    BlzFrameSetAlpha(into, 128)
    BlzFrameSetFocus(into,true)

    local textCurrent = BlzCreateFrameByType("TEXT", "ButtonChargesText", BoxBarParent, "", 0)
    BlzFrameSetPoint(textCurrent, FRAMEPOINT_LEFT, into, FRAMEPOINT_LEFT, 0.002, 0)
    local textMax = BlzCreateFrameByType("TEXT", "ButtonChargesText", BoxBarParent, "", 0)
    BlzFrameSetPoint(textMax, FRAMEPOINT_RIGHT, into, FRAMEPOINT_RIGHT, -0.002, 0)


    --
    BlzFrameSetParent(chargesBox, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetParent(textCurrent, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetParent(textMax, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetParent(into, BlzGetFrameByName("ConsoleUIBackdrop", 0))

    TimerStart(CreateTimer(), 0.05, true, function()
        local hp = 0
        hp = GetUnitLifePercent(hero)
        if not UnitAlive(hero) then
            hp = 0
            --print("Юнит мерт, сводим бар до нуля",hp)
            BlzFrameSetSize(into, 0, 0)
            --BlzFrameSetVisible(into, false)
            BlzFrameSetText(textCurrent, hp)
            BlzFrameSetText(textMax, R2I(BlzGetUnitMaxHP(hero)))
        else
            --BlzFrameSetVisible(into, GetLocalPlayer() == GetOwningPlayer(hero))
            BlzFrameSetText(textCurrent, R2I(GetUnitState(hero, UNIT_STATE_LIFE)))
            BlzFrameSetText(textMax, R2I(BlzGetUnitMaxHP(hero)))
            BlzFrameSetSize(chargesBox, 4.82 * hp * GNext / 100, GNext * 0.5)
            BlzFrameSetAlpha(chargesBox, 128)
        end
    end)
end

function CreateMANABar(data)
    local BoxBarParent = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), '', 0)
    BlzFrameSetVisible(BoxBarParent, GetLocalPlayer() == Player(data.pid))
    local x, y = -0.08, 0.588 - GNext / 2
    local hero = data.UnitHero


    --BlzFrameSetAlpha(into, 128)

    local chargesBox = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', BoxBarParent, '', 0)
    BlzFrameSetTexture(chargesBox, "Replaceabletextures\\Teamcolor\\Teamcolor01.blp", 0, true) --HPElement
    BlzFrameSetSize(chargesBox, GNext, GNext)
    BlzFrameSetAbsPoint(chargesBox, FRAMEPOINT_LEFT, x + 0.004, y)
    BlzFrameSetAlpha(chargesBox, 128)

    local into = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', BoxBarParent, '', 0)
    BlzFrameSetTexture(into, "into", 0, true)
    BlzFrameSetSize(into, GNext * 5, GNext)
    BlzFrameSetAbsPoint(into, FRAMEPOINT_LEFT, x, y)
    BlzFrameSetAlpha(into, 128)

    local textCurrent = BlzCreateFrameByType("TEXT", "ButtonChargesText", BoxBarParent, "", 0)
    BlzFrameSetPoint(textCurrent, FRAMEPOINT_LEFT, into, FRAMEPOINT_LEFT, 0.002, 0)
    local textMax = BlzCreateFrameByType("TEXT", "ButtonChargesText", BoxBarParent, "", 0)
    BlzFrameSetPoint(textMax, FRAMEPOINT_RIGHT, into, FRAMEPOINT_RIGHT, -0.002, 0)


    --
    BlzFrameSetParent(chargesBox, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetParent(textCurrent, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetParent(textMax, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetParent(into, BlzGetFrameByName("ConsoleUIBackdrop", 0))

    TimerStart(CreateTimer(), 0.05, true, function()
        local hp = 0
        hp = GetUnitManaPercent(hero)
        if not UnitAlive(hero) then
            hp = 0
            --print("Юнит мерт, сводим бар до нуля",hp)
            BlzFrameSetSize(into, 0, 0)
            --BlzFrameSetVisible(into, false)
            BlzFrameSetText(textCurrent, hp)
            BlzFrameSetText(textMax, R2I(BlzGetUnitMaxMana(hero)))
        else
            --BlzFrameSetVisible(into, GetLocalPlayer() == GetOwningPlayer(hero))
            BlzFrameSetText(textCurrent, R2I(GetUnitState(hero, UNIT_STATE_MANA)))
            BlzFrameSetText(textMax, R2I(BlzGetUnitMaxMana(hero)))
            BlzFrameSetSize(chargesBox, 4.82 * hp * GNext / 100, GNext * 0.5)
            BlzFrameSetAlpha(chargesBox, 128)
        end
    end)
end

function CreateEXPBar(data)
    local BoxBarParent = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), '', 0)
    BlzFrameSetVisible(BoxBarParent, GetLocalPlayer() == Player(data.pid))
    local x, y = -0.08, 0.588 - GNext
    local hero = data.UnitHero


    --BlzFrameSetAlpha(into, 128)

    local chargesBox = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', BoxBarParent, '', 0)
    BlzFrameSetTexture(chargesBox, "Replaceabletextures\\Teamcolor\\Teamcolor03.blp", 0, true) --HPElement
    BlzFrameSetSize(chargesBox, GNext, GNext)
    BlzFrameSetAbsPoint(chargesBox, FRAMEPOINT_LEFT, x + 0.004, y)
    BlzFrameSetAlpha(chargesBox, 128)

    local into = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', BoxBarParent, '', 0)
    BlzFrameSetTexture(into, "into", 0, true)
    BlzFrameSetSize(into, GNext * 5, GNext)
    BlzFrameSetAbsPoint(into, FRAMEPOINT_LEFT, x, y)
    BlzFrameSetAlpha(into, 128)

    local textCurrent = BlzCreateFrameByType("TEXT", "ButtonChargesText", BoxBarParent, "", 0)
    BlzFrameSetPoint(textCurrent, FRAMEPOINT_LEFT, into, FRAMEPOINT_LEFT, 0.002, 0)
    local textMax = BlzCreateFrameByType("TEXT", "ButtonChargesText", BoxBarParent, "", 0)
    BlzFrameSetPoint(textMax, FRAMEPOINT_RIGHT, into, FRAMEPOINT_RIGHT, -0.002, 0)


    --
    BlzFrameSetParent(chargesBox, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetParent(textCurrent, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetParent(textMax, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetParent(into, BlzGetFrameByName("ConsoleUIBackdrop", 0))

    TimerStart(CreateTimer(), 0.05, true, function()
        local hp = 0
        hp = StatePercent(data.curExp-ExpTable[data.curHeroLvl],ExpTable[data.curHeroLvl+1]-ExpTable[data.curHeroLvl])

        --print(hp)

        if not UnitAlive(hero) then
            hp = 0
            --print("Юнит мерт, сводим бар до нуля",hp)
           -- BlzFrameSetSize(into, 0, 0)
            --BlzFrameSetVisible(into, false)
            --BlzFrameSetText(textCurrent, hp)
            --BlzFrameSetText(textMax, R2I(BlzGetUnitMaxMana(hero)))
        else
            --BlzFrameSetVisible(into, GetLocalPlayer() == GetOwningPlayer(hero))
            BlzFrameSetText(textCurrent, R2I(data.curExp))
            BlzFrameSetText(textMax, R2I(ExpTable[data.curHeroLvl+1]))
            BlzFrameSetSize(chargesBox, 4.82 * hp * GNext / 100, GNext * 0.5)
            BlzFrameSetAlpha(chargesBox, 128)
        end
    end)
end


function StatePercent(value,maxValue)
	--  Return 0 for null units.
	if (maxValue == 0) then
		return 0.0
	end
	return value / maxValue * 100.0
end