function Start()
    EVRPhoton:Instantiate("Cube", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    EVRPhoton:Instantiate("LHand", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    EVRPhoton:Instantiate("RHand", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    CS.UnityEngine.Debug.Log("OBJECTS_ARE_READY")
end