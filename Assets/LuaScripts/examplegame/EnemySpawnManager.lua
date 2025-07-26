-- Получаем инъекции, переданные через C#
local spawnPoint = spawnPoint  -- Точка спавна
local zombiePrefab = zombiePrefab  -- Префаб зомби (должен быть GameObject)
local waveText = waveText  -- TextMeshPro для отображения текущей волны
local zombiesLeftText = zombiesLeftText  -- TextMeshPro для оставшихся зомби
local waveTimerText = waveTimerText  -- TextMeshPro для таймера до следующей волны

-- Константы и переменные
local baseZombiesPerWave = 2
local zombiesLeft = 0
local currentWave = 0
local waveInProgress = false
local timeBetweenWaves = 10

-- Функция для обновления текста на экране
local function UpdateUIText()
    -- Получаем компоненты TextMeshPro для каждого текста
    local waveTextComponent = waveText:GetComponent("TMPro.TextMeshProUGUI")
    local zombiesLeftTextComponent = zombiesLeftText:GetComponent("TMPro.TextMeshProUGUI")
    local waveTimerTextComponent = waveTimerText:GetComponent("TMPro.TextMeshProUGUI")

    -- Обновляем текст
    waveTextComponent.text = "Волна: " .. currentWave
    zombiesLeftTextComponent.text = "Осталось зомби: " .. zombiesLeft
    waveTimerTextComponent.text = "Время до следующей волны: " .. math.max(0, math.floor(timeBetweenWaves))
end

-- Функция для старта новой волны
function StartWave()
    -- Увеличиваем текущую волну
    currentWave = currentWave + 1
    zombiesLeft = baseZombiesPerWave + currentWave * 2  -- Увеличение количества зомби с каждой волной
    if currentWave == 1 then
        zombiesLeft = zombiesLeft + 1
    end

    -- Спавним зомби
    for i = 1, zombiesLeft do
        CS.UnityEngine.Debug.Log("Зомби спавнится...")  -- Логирование (можно удалить позже)

        -- Получаем позицию точки спавна через Transform.position
        local spawnPos = spawnPoint:GetComponent("Transform").position  -- Получаем позицию точки спавна
        print(spawnPos)  -- Логирование позиции для отладки
        
        -- Создаем новый объект без передачи поворота напрямую
        local newZombie = CS.UnityEngine.Object.Instantiate(zombiePrefab)  -- Спавним зомби без поворота

        -- Поворот можно установить вручную, если нужно:
        newZombie:GetComponent("Transform").position = spawnPos  -- Устанавливаем поворот по умолчанию (если нужно)
        
        CS.UnityEngine.Debug.Log("Зомби спавнится...")  -- Логирование (можно удалить позже)
    end

    -- Обновляем текст после старта новой волны
    UpdateUIText()
end

-- Функция для уменьшения оставшихся зомби
function OnZombieKilled()
    -- Уменьшаем количество оставшихся зомби
    zombiesLeft = zombiesLeft - 1
    CS.UnityEngine.Debug.Log("Осталось зомби: " .. zombiesLeft)

    -- Обновляем текст после того, как зомби был убит
    UpdateUIText()

    -- Если все зомби убиты, начинаем новую волну
    if zombiesLeft <= 0 then
        waveInProgress = false
        timeBetweenWaves = 10  -- Сброс таймера на следующее время между волнами
        CS.UnityEngine.Debug.Log("Зомби убиты! Подготовка к следующей волне.")
        UpdateUIText()  -- Обновление текста после завершения волны
    end
end

-- Функция для обновления состояния игры
function Update()
    if waveInProgress then
        -- Логика для работы во время волны
        -- Например, проверка на количество оставшихся зомби или таймер между волнами
        if zombiesLeft <= 0 then
            waveInProgress = false
            timeBetweenWaves = 10  -- Сброс таймера на следующее время между волнами
            CS.UnityEngine.Debug.Log("Зомби убиты! Подготовка к следующей волне.")
            UpdateUIText()  -- Обновление текста после завершения волны
        end
    else
        -- Логика для времени между волнами
        timeBetweenWaves = timeBetweenWaves - CS.UnityEngine.Time.deltaTime
        if timeBetweenWaves <= 0 then
            waveInProgress = true
            StartWave()  -- Запуск новой волны
        end
    end

    -- Обновление текста для таймера
    UpdateUIText()
end
