local navMeshAgent = navMeshAgent
local player = EVR.Player  -- Объявляем глобальную переменную для игрока

function Update()
    -- Проверяем, что player и navMeshAgent не равны nil
    if player and navMeshAgent then
        -- Устанавливаем цель для NavMeshAgent
        navMeshAgent:GetComponent("NavMeshAgent"):SetDestination(player:GetComponent("Transform").position)
    end
end
