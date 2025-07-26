local object = LHand

function Start()
    if LHand:GetComponent("PhotonView").IsMine == true then
        EVR:SetNewHandL(object)
    end
end