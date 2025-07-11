using UnityEngine;
using Photon.Pun;
using Photon.Realtime;

namespace EVR
{
    public class RoomManager : MonoBehaviourPunCallbacks
    {
        public GameObject EVR; // Убедитесь, что это ссылка на объект с компонентом API

        // void Start()
        // {
        //     CreateRoom();
        // }
        public override void OnConnectedToMaster()
        {
            Debug.Log("Connected to master server");
            CreateRoom();
        }
        public void CreateRoom()
        {
            PhotonNetwork.CreateRoom("test");
        }

        public void JoinRoom()
        {
            PhotonNetwork.JoinRoom("test");
        }

        public override void OnJoinedRoom()
        {
            // Получаем компонент API из объекта EVR
            API api = EVR.GetComponent<API>();
            
            // Проверяем, что компонент существует
            if (api != null)
            {
                api.LoadScene("Game", true); // Вызов метода LoadScene
            }
            else
            {
                Debug.LogError("Компонент API не найден на объекте EVR.");
            }
        }
    }
}