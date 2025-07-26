-- Получаем инъекции, переданные через C#
local navMeshAgent = navMeshAgent  -- NavMeshAgent для движения
local animator = animator  -- Animator для анимации

-- Функция для обновления анимации
function Update()
    -- Получаем компонент Animator
    local animatorComponent = animator:GetComponent("Animator")
    
    -- Получаем компонент NavMeshAgent
    local navMeshAgentComponent = navMeshAgent:GetComponent("NavMeshAgent")
    
    -- Устанавливаем параметр "speed" анимации равным скорости NavMeshAgent
    local speed = navMeshAgentComponent.velocity.magnitude  -- Получаем скорость
    animatorComponent:SetFloat("speed", speed)  -- Устанавливаем значение для анимации
end
