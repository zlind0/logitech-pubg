--------------------------------------------------------------------------
----------------        Basic Variable       -----------------------------
----------------         Do not edit                 ---------------------
--------------------------------------------------------------------------
local current_weapon = "none"

--------------------------------------------------------------------------
----------------        Basic Setting       ------------------------------
--------------------------------------------------------------------------

---- key bind ----

local ump9_key = 4
local akm_key = 6
local m16a4_key = 5
local m16a4_key_pressed = false
local m416_key = 7
local scarl_key = nil
local uzi_key = nil

local trigger_key = 7

local set_off_key = 6

local functional = -1


---- fire key ----

local aim_key = 3
local fire_key = "pause"
local mode_switch_key = "scrolllock"
local auto_ads_key = "capslock"


---- ignore key ----
---- can use "lalt", "ralt", "alt"  "lshift", "rshift", "shift"  "lctrl", "rctrl", "ctrl"

local ignore_key = "lshift"

--- Sensitivity in Game
--- default is 50.0

local target_sensitivity = 50
local scope_sensitivity = 47
local scope4x_sensitivity = 44

---- Obfs setting
---- Two firing time intervals = weapon_speed * interval_ratio * ( 1 + random_seed * ( 0 ~ 1))
local weapon_speed_mode = false
-- local obfs_mode = false
local obfs_mode = true
local interval_ratio = 0.75
local random_seed = 1

--------------------------------------------------------------------------
----------------        Recoil Table        ------------------------------
---------------- You can fix the value here ------------------------------
--------------------------------------------------------------------------

local recoil_table = {}

recoil_table["ump9"] = {
    basic={18,19,18,19,18,19,19,21,23,24,23,24,23,24,23,24,23,24,23,24,23,24,24,25,24,25,24,25,24,25,24,25,25,26,25,26,25,26,25,26,25,26,25,26,25,26},
    quadruple={83.3,83.3,83.3,83.3,83.3,83.3,83.3,116.7,116.7,116.7,116.7,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3},
    speed = 92
}

recoil_table["akm"] = {
    basic={23.7,23.7,23.7,23.7,23.7,23.7,23.7,23.7,23.7,23.7,23.7,28,28,28,28,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7,29.7},
    quadruple={66.7,66.7,66.7,66.7,66.7,66.7,66.7,66.7,66.7,66.7,66.7,123.3,123.3,123.3,123.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3,93.3},
    speed = 100
}

recoil_table["m16a4"] = {
    basic={25,25,25,29,33,33,32,33,32,32,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30,30},
    quadruple={86.7,86.7,86.7,86.7,86.7,86.7,86.7,150,150,150,150,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120,120},
    speed = 75
}

recoil_table["m416"] = {
    basic={21,21,21,21,21,21,21,21,21,23,23,24,23,24,25,25,26,27,27,32,31,31,31,31,31,31,31,32,32,32,35,35,35,35,35,35,35,35,35,35,35},
    quadruple={86.7,86.7,86.7,86.7,86.7,86.7,86.7,150,150,150,150,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7},
    speed = 86
}

recoil_table["scarl"] = {
    basic={20,21,22,21,22,22,23,22,23,23,24,24,25,25,25,25,26,27,28,29,30,32,34,34,35,34,35,34,35,34,35,34,34,34,34,34,35,35,35,35,35,35,35,35,35,35},
    quadruple={86.7,86.7,86.7,86.7,86.7,86.7,86.7,150,150,150,150,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7,96.7},
    speed = 96
}

recoil_table["uzi"] = {
    basic={16,17,18,20,21,22,23,24,25,26,28,30,32,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34,34},
    quadruple={13.3,13.3,13.3,13.3,13.3,21.7,21.7,21.7,21.7,21.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7,46.7},
    speed = 48
}

recoil_table["none"] = {
    basic={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    quadruple={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
    speed = 60
}


--------------------------------------------------------------------------
----------------          Function          ------------------------------
--------------------------------------------------------------------------


function convert_sens(unconvertedSens) 
    return 0.002 * math.pow(10, unconvertedSens / 50)
end

function calc_sens_scale(sensitivity)
    return convert_sens(sensitivity)/convert_sens(50)
end

local target_scale = calc_sens_scale(target_sensitivity)
local scope_scale = calc_sens_scale(scope_sensitivity)
local scope4x_scale = calc_sens_scale(scope4x_sensitivity)

function recoil_mode()
    if IsKeyLockOn(mode_switch_key) then
        return "quadruple";
    else
        return "basic";
    end
end


function recoil_value(_weapon,_duration)
    local _mode = recoil_mode()
    local step = (math.floor(_duration/100)) + 1
    if step > 40 then
        step = 40
    end
    local weapon_recoil = recoil_table[_weapon][_mode][step]
    -- OutputLogMessage("weapon_recoil = %s\n", weapon_recoil)
    
    local weapon_speed = 30
    if weapon_speed_mode then
        weapon_speed = recoil_table[_weapon]["speed"]
    end
    -- OutputLogMessage("weapon_speed = %s\n", weapon_speed)

    local weapon_intervals = weapon_speed
    if obfs_mode then

        local coefficient = interval_ratio * ( 1 + random_seed * math.random())
        weapon_intervals = math.floor(coefficient  * weapon_speed) 
    end
    -- OutputLogMessage("weapon_intervals = %s\n", weapon_intervals)

    recoil_recovery = weapon_recoil * weapon_intervals / 100
    
    -- issues/3
    if recoil_mode() == "basic" then
        recoil_recovery = recoil_recovery / scope_scale
    elseif recoil_mode() == "quadruple" then
        recoil_recovery= recoil_recovery / scope4x_scale
    end

    return weapon_intervals,recoil_recovery
end


--------------------------------------------------------------------------
----------------          OnEvent          ------------------------------
--------------------------------------------------------------------------


function OnEvent(event, arg)
    
    local fire_key_pressed = -1
    OutputLogMessage("event = %s, arg = %d\n", event, arg)
    if (event == "PROFILE_ACTIVATED") then
        EnablePrimaryMouseButtonEvents(true)
    elseif event == "PROFILE_DEACTIVATED" then
        current_weapon = "none"
        shoot_duration = 0.0
        ReleaseKey(fire_key)
        ReleaseMouseButton(9)
    end

    if (event == "MOUSE_BUTTON_PRESSED" and arg == akm_key) then
        current_weapon = "akm"
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == m16a4_key) then
        current_weapon = "m16a4"
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == m416_key) then
        current_weapon = "m416"
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == ump9_key) then
        current_weapon = "ump9"
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == uzi_key) then
        current_weapon = "uzi"
        fire_key_pressed = 1
    elseif (event == "MOUSE_BUTTON_PRESSED" and arg == scarl_key) then
        current_weapon = "scarl"
        fire_key_pressed = 1
    end
    
    if fire_key_pressed == 1 then 
        functional = -functional
        OutputLogMessage("Functional = %d\n", functional )
    end
    
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1) then
        PressKey(fire_key)
    end
    if (event == "MOUSE_BUTTON_RELEASED" and arg == 1) then
        ReleaseKey(fire_key)
    end
    
    if (event == "MOUSE_BUTTON_PRESSED" and arg == 1 and functional == 1) then
        if (recoil_mode() == "basic" and IsKeyLockOn(auto_ads_key))  then
            PressAndReleaseMouseButton(aim_key)
        end
        local shoot_duration = 0.0
        repeat
            local intervals,recovery = recoil_value(current_weapon,shoot_duration)
            if (current_weapon == "m16a4") then
                PressKey(fire_key)
                Sleep(intervals)
                MoveMouseRelative(0, recovery)
                ReleaseKey(fire_key)
                
                Sleep(intervals*2)
                intervals,recovery = recoil_value(current_weapon,shoot_duration)
                MoveMouseRelative(0, recovery)
                
                Sleep(intervals)
                intervals,recovery = recoil_value(current_weapon,shoot_duration)
                MoveMouseRelative(0, recovery)
            else
                Sleep(intervals)
            end
            MoveMouseRelative(0, recovery)
            shoot_duration = shoot_duration + intervals
        until not IsMouseButtonPressed(1)
    elseif (event == "MOUSE_BUTTON_RELEASED" and arg == 1 and functional == 1) then
        -- ReleaseKey(fire_key)
        if (recoil_mode() == "basic" and IsKeyLockOn(auto_ads_key)) then
            PressAndReleaseMouseButton(aim_key)
        end
    end
    
    
    
    fire_key_pressed = -1
end