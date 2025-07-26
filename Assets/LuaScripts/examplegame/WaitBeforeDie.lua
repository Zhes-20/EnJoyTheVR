-- Получаем инъекции, переданные через C#
local animator = animator  -- Animator для анимации

-- Функция для смерти
function Die()
    -- Получаем компонент Animator
    local animatorComponent = animator:GetComponent("Animator")
    
    -- Устанавливаем параметр "Death" в 1.0f для активации анимации смерти
    animatorComponent:SetFloat("Death", 1.0)
end
