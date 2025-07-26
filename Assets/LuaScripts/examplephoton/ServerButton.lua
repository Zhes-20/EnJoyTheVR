function JoinRoomBut()
    local name = Text:GetComponent("TMPro.TextMeshProUGUI").text
    EVRPhoton:JoinRoom(name, "Game")
end
