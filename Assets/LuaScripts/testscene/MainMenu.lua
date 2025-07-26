function Start()
    EVRPhoton:RegisterInPool("Cube")
    EVRPhoton:RegisterInPool("LHand")
    EVRPhoton:RegisterInPool("RHand")
    EVRPhoton:RegisterInPool("Pistol")
end

function Create()
    local name = IF:GetComponent("TMP_InputField").text
    EFRPhoton:CreateRoom(name, "Game")
end

function EnableKeyboard()
    EVR:EnableKeyboard(IF:GetComponent("TMP_InputField"))
end

function DisableKeyboard()
    EVR:DisableKeyboard()
end