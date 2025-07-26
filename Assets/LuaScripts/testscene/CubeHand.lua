local object = Cube
function Start()
    if Cube:GetComponent("PhotonView").IsMine == true then
        EVR:SetNewHand(object)
    end
end