---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by Bergi.
--- DateTime: 18.12.2021 22:22
---

function CreateEActions()
    -----------------------------------------------------------------OSKEY_E
    local gg_trg_EventUpE = CreateTrigger()
    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        BlzTriggerRegisterPlayerKeyEvent(gg_trg_EventUpE, Player(i), OSKEY_E, 0, true)
    end
    TriggerAddAction(gg_trg_EventUpE, function()
        local pid = GetPlayerId(GetTriggerPlayer())
        local data = HERO[pid]
        if not data.ReleaseE and UnitAlive(data.UnitHero) then
            data.ReleaseE = true
            CatchItem(data)
            --print("нажал Е")
        end
    end)

    local TrigDepressE = CreateTrigger()
    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        BlzTriggerRegisterPlayerKeyEvent(TrigDepressE, Player(i), OSKEY_E, 0, false)
    end
    TriggerAddAction(TrigDepressE, function()
        local pid = GetPlayerId(GetTriggerPlayer())
        local data = HERO[pid]
        data.ReleaseE = false
    end)
end

function CreateTabActions()
    -----------------------------------------------------------------OSKEY_Tab
    local gg_trg_EventUpTAB = CreateTrigger()
    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        BlzTriggerRegisterPlayerKeyEvent(gg_trg_EventUpTAB, Player(i), OSKEY_TAB, 0, true)
    end
    TriggerAddAction(gg_trg_EventUpTAB, function()
        local pid = GetPlayerId(GetTriggerPlayer())
        local data = HERO[pid]
        if not data.ReleaseTAB then
            data.ReleaseTAB = true
            --CatchItem(data)
            if BlzFrameIsVisible(data.BoxFrame) then
                BlzFrameSetVisible(data.BoxFrame, false)
            else
                BlzFrameSetVisible(data.BoxFrame, GetLocalPlayer()==GetTriggerPlayer())
            end

            --print("нажал TAB")
        end
    end)

    local TrigDepressTAB = CreateTrigger()
    for i = 0, bj_MAX_PLAYER_SLOTS - 1 do
        BlzTriggerRegisterPlayerKeyEvent(TrigDepressTAB, Player(i), OSKEY_TAB, 0, false)
    end
    TriggerAddAction(TrigDepressTAB, function()
        local pid = GetPlayerId(GetTriggerPlayer())
        local data = HERO[pid]
        data.ReleaseTAB = false
    end)
end

function CreateActionBox(data,parent)

    local texture = "ReplaceableTextures\\CommandButtons\\BTNSpellSteal.blp"
    local SelfFrame = BlzCreateFrameByType('GLUEBUTTON', 'FaceButton', parent, 'ScoreScreenTabButtonTemplate', 0)
    local buttonIconFrame = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', SelfFrame, '', 0)

    BlzFrameSetParent(SelfFrame, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetParent(buttonIconFrame, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetAllPoints(buttonIconFrame, SelfFrame)
    BlzFrameSetTexture(buttonIconFrame, texture, 0, true)
    BlzFrameSetSize(SelfFrame, GNext, GNext)
    --
    BlzFrameSetPoint(SelfFrame, FRAMEPOINT_RIGHT, parent, FRAMEPOINT_RIGHT, GNext, 0.00)
    --BlzFrameSetAbsPoint(SelfFrame, FRAMEPOINT_CENTER, 0.8 + GNext / 2, GNext / 2)

    local ClickTrig = CreateTrigger()
    BlzTriggerRegisterFrameEvent(ClickTrig, SelfFrame, FRAMEEVENT_CONTROL_CLICK)
    TriggerAddAction(ClickTrig, function()
        BlzFrameSetEnable(BlzGetTriggerFrame(), false)
        BlzFrameSetEnable(BlzGetTriggerFrame(), true)
        StopUnitMoving(data)
        CatchItem(data)
    end)

    local TrigMOUSE_ENTER = CreateTrigger()
    BlzTriggerRegisterFrameEvent(TrigMOUSE_ENTER, SelfFrame, FRAMEEVENT_MOUSE_ENTER)
    TriggerAddAction(TrigMOUSE_ENTER, function()
        --print("показать подсказку ",flag)
    end)
    local TrigMOUSE_LEAVE = CreateTrigger()
    BlzTriggerRegisterFrameEvent(TrigMOUSE_LEAVE, SelfFrame, FRAMEEVENT_MOUSE_LEAVE)
    TriggerAddAction(TrigMOUSE_LEAVE, function()
        --print("убрать подсказку")
    end)

    ---Подсказка
    local text = BlzCreateFrameByType("TEXT", "ButtonChargesText", SelfFrame, "", 0)
    BlzFrameSetParent(text, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetText(text, "E")
    BlzFrameSetScale(text, 1)
    BlzFrameSetPoint(text, FRAMEPOINT_TOP, SelfFrame, FRAMEPOINT_TOP, 0.00, 0.01)

    return SelfFrame, buttonIconFrame
end

function CreateRmbTips(data,parent)

    local texture = "ReplaceableTextures\\CommandButtons\\BTNWispSplode.blp"
    local SelfFrame = BlzCreateFrameByType('GLUEBUTTON', 'FaceButton', parent, 'ScoreScreenTabButtonTemplate', 0)
    local buttonIconFrame = BlzCreateFrameByType('BACKDROP', 'FaceButtonIcon', SelfFrame, '', 0)

    BlzFrameSetParent(SelfFrame, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetParent(buttonIconFrame, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetAllPoints(buttonIconFrame, SelfFrame)
    BlzFrameSetTexture(buttonIconFrame, texture, 0, true)
    BlzFrameSetSize(SelfFrame, GNext, GNext)
    --
    BlzFrameSetPoint(SelfFrame, FRAMEPOINT_RIGHT, parent, FRAMEPOINT_RIGHT, GNext*2, 0.00)
    --BlzFrameSetAbsPoint(SelfFrame, FRAMEPOINT_CENTER, 0.8 + GNext / 2, GNext / 2)

    local ClickTrig = CreateTrigger()
    BlzTriggerRegisterFrameEvent(ClickTrig, SelfFrame, FRAMEEVENT_CONTROL_CLICK)
    TriggerAddAction(ClickTrig, function()
        BlzFrameSetEnable(BlzGetTriggerFrame(), false)
        BlzFrameSetEnable(BlzGetTriggerFrame(), true)
        StopUnitMoving(data)
    end)

    local TrigMOUSE_ENTER = CreateTrigger()
    BlzTriggerRegisterFrameEvent(TrigMOUSE_ENTER, SelfFrame, FRAMEEVENT_MOUSE_ENTER)
    TriggerAddAction(TrigMOUSE_ENTER, function()
        --print("показать подсказку ",flag)
    end)
    local TrigMOUSE_LEAVE = CreateTrigger()
    BlzTriggerRegisterFrameEvent(TrigMOUSE_LEAVE, SelfFrame, FRAMEEVENT_MOUSE_LEAVE)
    TriggerAddAction(TrigMOUSE_LEAVE, function()
        --print("убрать подсказку")
    end)

    ---Подсказка
    local text = BlzCreateFrameByType("TEXT", "ButtonChargesText", SelfFrame, "", 0)
    BlzFrameSetParent(text, BlzGetFrameByName("ConsoleUIBackdrop", 0))
    BlzFrameSetText(text, "RMB for\n repeat cast")
    BlzFrameSetScale(text, 0.8)
    BlzFrameSetPoint(text, FRAMEPOINT_TOP, SelfFrame, FRAMEPOINT_TOP, 0.00, 0.02)

    return SelfFrame, buttonIconFrame
end

--