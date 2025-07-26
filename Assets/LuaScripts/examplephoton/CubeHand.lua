local object = Cube

function Start()
    if Cube:GetComponent("PhotonView").IsMine == true then
        EVR:SetNewHead(object)
    end
end