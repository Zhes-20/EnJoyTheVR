local balance = 0
local balanceText = balanceText

-- Функция для добавления баланса
function AddBalance()
    balance = balance + 25
    UpdateBalanceText()
end

-- Функция для уменьшения баланса на 25
function ReduceBalance()
    balance = balance - 25
    UpdateBalanceText()  -- Обновляем текст баланса
end

-- Функция для обновления текста баланса в TextMeshProUGUI
function UpdateBalanceText()
    local balanceTextComponent = balanceText:GetComponent("TMPro.TextMeshProUGUI")
    balanceTextComponent.text = "Баланс: " .. balance  -- Обновляем текст
end

UpdateBalanceText()
