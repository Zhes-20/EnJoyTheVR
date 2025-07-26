function Update()
    if EVRPhoton.OnConnectedToMasterISOK == true then
        Text:GetComponent("TMPro.TextMeshProUGUI").text = "Connected to Master"
    else
        Text:GetComponent("TMPro.TextMeshProUGUI").text = "Not Connected to Master"
    end
end