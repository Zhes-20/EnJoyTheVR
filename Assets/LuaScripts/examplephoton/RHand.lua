local object = RHand

function Start()
    if RHand:GetComponent("PhotonView").IsMine == true then
        EVR:SetNewHandR(object)
    end
end