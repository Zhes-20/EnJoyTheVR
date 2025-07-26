function Start()
    EVRPhoton:Instantiate("Cube", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    EVRPhoton:Instantiate("LHand", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    EVRPhoton:Instantiate("RHand", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    -- EVRPhoton:CheckIfMaster()
    -- if EVRPhoton.IsMaster == true then
    --     EVRPhoton:Instantiate("Box", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    -- end
    -- if EVRPhoton.IsMaster == false then
    --     CS.UnityEngine.Debug.Log("NOTMASTER")
    -- end
    --EVRPhoton:Instantiate("Box", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    EVRPhoton:Instantiate("Pistol", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    CS.UnityEngine.Debug.Log("ObjectsAreReady")
end