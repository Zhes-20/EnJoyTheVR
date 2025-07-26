local rigidbody = self:GetComponent("Rigidbody")

function Update()
    if self:GetComponent("PhotonView").IsMine == true then
        rigidbody.isKinematic = false
    else
        rigidbody.isKinematic = true
    end
end

function SetOwnershipToLocal()
    EVRPhoton:SetOwnership(self)
end