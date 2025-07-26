-- local BKeycode = EVR:BKeyCode()
-- local AKeycode = EVR:AKeyCode()

-- --FOR PC DEBUG
-- function Update()
--     if CS.UnityEngine.Input.GetKey(BKeycode) then
--         EVRPhoton:CreateRoom("test", "Game")
--     end
--     if CS.UnityEngine.Input.GetKey(AKeycode) then
--         EVRPhoton:JoinRoom("test", "Game")
--     end
-- end
-- --FOR PC DEBUG END
function Start()
    EVRPhoton:RegisterInPool("Cube")
    EVRPhoton:RegisterInPool("LHand")
    EVRPhoton:RegisterInPool("RHand")
    EVRPhoton:RegisterInPool("Pistol")
end

function Create()
    local name = IF:GetComponent("TMP_InputField").text
    EVRPhoton:CreateRoom(name, "Game")
end

function Enable()
    EVR:EnableKeyboard(IF:GetComponent("TMP_InputField"))
end

function Disable()
    EVR:DisableKeyboard()
end