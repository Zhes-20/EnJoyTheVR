using UnityEngine;
using Photon.Pun;

public class SpawnManager : MonoBehaviour
{
    public GameObject Player;

    private void Awake()
    {
        PhotonNetwork.Instantiate(Player.name, Vector3.zero, Quaternion.identity);
    }

}
