function Update()
    if EVRPhoton.OnConnectedToMasterISOK == true then
        Text:GetComponent("TMPro.TextMeshProUGUI").text = "Подключено / Connected"
    else
        Text:GetComponent("TMPro.TextMeshProUGUI").text = "Подключение... / Connection"
    end
end