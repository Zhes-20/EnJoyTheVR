-- Получаем инъекции, переданные через C#
local spawnPoint = spawnPoint  -- Точка спавна для покупки
local weaponPrefab = weaponPrefab  -- Префаб оружия
local playerBalance = playerBalance  -- Ссылка на скрипт PlayerBalance
local playerBalanceScript = playerBalanceScript  -- Ссылка на скрипт, в котором есть ReduceBalance
local weaponCostText = weaponCostText  -- Ссылка на компонент TextMeshProUGUI с текстом стоимости оружия

-- Функция для получения текущего баланса из TextMeshProUGUI компонента
function GetBalance()
    local balanceTextComponent = playerBalance:GetComponent("TMPro.TextMeshProUGUI")  -- Получаем компонент TextMeshProUGUI
    local balanceText = balanceTextComponent.text  -- Получаем текст баланса
    local balance = tonumber(balanceText:match("(%d+)"))  -- Извлекаем число из строки
    print(balance)
    return balance or 0  -- Возвращаем баланс или 0, если парсинг не удался
end

function Start()
    GetBalance()
    GetWeaponCost()
end

-- Метод для извлечения стоимости оружия из текста
function GetWeaponCost()
    local text = weaponCostText:GetComponent("TMPro.TextMeshProUGUI").text  -- Получаем текст из компонента
    local cost = tonumber(text:match("(%d+)"))  -- Извлекаем число из строки
    print(cost)
    return cost or 0  -- Возвращаем стоимость или 0, если парсинг не удался
end

-- Метод для уменьшения баланса
function ReduceBalance(amount)
    local ScriptBalance = playerBalanceScript:GetComponent("CustomLuaLoader")  -- Получаем CustomLuaLoader
    local reduceTimes = amount / 25  -- Определяем, сколько раз нужно уменьшить баланс

    for i = 1, reduceTimes do
        ScriptBalance:InvokeLuaFunction("ReduceBalance")  -- Вызываем метод ReduceBalance из CustomLuaLoader
    end
end

-- Метод покупки оружия
function PurchaseWeapon()
    local weaponCost = GetWeaponCost()  -- Получаем стоимость оружия из текста

    -- Проверяем, хватает ли баланса для покупки оружия
    if GetBalance() >= weaponCost then
        ReduceBalance(weaponCost)  -- Уменьшаем баланс
        SpawnWeapon()  -- Спавним оружие
    else
        -- Логируем, если недостаточно средств
        CS.UnityEngine.Debug.Log("Недостаточно средств для покупки оружия")
    end
end

-- Метод спавна оружия в выбранной точке
function SpawnWeapon()
    -- Создаем оружие в заданной точке спавна
    local SpawnedWeapon = CS.UnityEngine.Object.Instantiate(weaponPrefab)

    SpawnedWeapon:GetComponent("Transform").position = spawnPoint:GetComponent("Transform").position
end
