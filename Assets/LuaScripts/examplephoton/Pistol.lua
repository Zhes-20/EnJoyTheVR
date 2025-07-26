local rigidbody = self:GetComponent("Rigidbody")
--local EVRPhotonObjSync = self:GetComponent("EVRPhotonObjSync")
local weapon = self:GetComponent("RaycastWeapon")
local BKeycode = EVR:BKeyCode()

function pistolShot()
    CS.UnityEngine.Debug.Log(self)
    EVRPhoton:Sync(self, "BNG.RaycastWeapon", "Shoot")
end

function SetOwnershipToLocal()
    EVRPhoton:SetOwnership(self)
end

-- function ShootFromLua()
--     if self:GetComponent("PhotonView").IsMine == false then
--         weapon:Shoot()
--         CS.UnityEngine.Debug.Log(self:GetComponent("PhotonView").IsMine)
--     end
-- end

function Update()
    if self:GetComponent("PhotonView").IsMine == true then
        rigidbody.isKinematic = false
    else
        rigidbody.isKinematic = true
    end
    if CS.UnityEngine.Input.GetKey(BKeycode) then
        --weapon:Shoot()
        pistolShot()
        CS.UnityEngine.Debug.Log("SHOOT!")
    end
end
