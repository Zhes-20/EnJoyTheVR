[![Typing SVG](https://readme-typing-svg.herokuapp.com?font=Oswald&weight=700&size=25&duration=1500&pause=1&color=F70000&background=100BFF00&multiline=true&repeat=false&width=435&height=80&lines=EnJoyTheVR;%D0%A8%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD+%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F)](https://git.io/typing-svg)

[🇬🇧 English version](README_EN.md)<br/>
[Примеры приложений](https://github.com/Zhes-20/EnJoyTheVR/tree/main/Assets/Scenes)<br/>
[Видео-гайд по созданию приложений (Устарело)](https://vkvideo.ru/video-221809760_456239080)<br/>
[Видео-гайд по созданию многопользовательских приложений (Устарело)](https://vkvideo.ru/video-221809760_456239081)

Если вы хотите создать приложение для EnJoyTheVR, напишите в личные сообщения группы [ВКонтакте](https://vk.com/enjoythevr) или создайте Issue в репозитории на GitHub. После одобрения вашей идеи вам будет предоставлена личная версия EnJoyTheVR, предназначенная для разработчиков.

---

## Как создать своё приложение для EnJoyTheVR

1. **Загрузите проект Unity (Версия Unity - 2022.3.16)**

2. **Создайте новую сцену.** Если это первоначальная сцена, назовите её тем же именем, что и ваша игра. *(Можно использовать только строчные буквы)*.

3. **Заполните название бандла в инспекторе.** Это и есть название вашей игры. *(В дальнейшем во всех сценах необходимо указывать данный бандл.)*

   ![AssetBundle](https://github.com/user-attachments/assets/3a467aa2-a898-4c05-b24b-b7e9dc85ab12)

4. **Создайте пустой объект, назовите его “spawn”.** На его месте будет появляться игрок.

**Крайне рекомендуется посмотреть примеры [готовых приложений](https://github.com/Zhes-20/EnJoyTheVR/tree/main/Assets/SampleScenes).**

---

## Свобода настройки игрока и взаимодействий

Шаблон поддерживает три режима сборки игрока и взаимодействий через параметры(их можно указать в симуляторе в префабе EVR.API на сцене, далее указываются мною в магазине):

- `UseDefaultPlayer` (bool)
- `UsesInteraction` (bool)
- `UsesDefaultCanvas` (bool)

В зависимости от комбинации вы можете:

1. **Полностью собрать игрока с нуля** (`UseDefaultPlayer=false`):
   - Добавьте на сцену объекты `MyHMD`, `MyLeftHand`, `MyRightHand`.
   - Сделайте ваши обьекты дочерними у созданных.
   - При `UsesInteraction=false` — собственные руки (важно! взаимодействие с UI остаётся стандартным).
   - При `UsesDefaultCanvas=false` — создайте `MyCanvas` для кастомного сенсорного управления.

2. **Использовать готового игрока с базовой механикой** (`UseDefaultPlayer=true`):
   - При `UsesInteraction=true` — используйте встроенное взаимодействие (руки).
   - При `UsesDefaultCanvas=true` — используйте стандартный сенсорный Canvas.
   - При `UsesInteraction=false` или `UsesDefaultCanvas=false` — комбинируйте с добавлением `MyLeftHand`, `MyRightHand`, `MyCanvas`, `MyHead`, `MyPlayer`.

3. **Смешанный режим** — сочетайте параметры для оптимального результата.

---

## Как писать скрипты?

Создание игры для EnJoyTheVR схоже с созданием обычной игры, однако в связи с ограничением бандлов Unity скрипты должны быть написаны на Lua. Однако в проекте уже присутсвуют некоторые ассеты, которые могут быть использованы, как готовое решение для некоторых решений (их использование допускается только для разработки приложений под EnJoyTheVR).

### Использование CustomLuaLoader

Чтобы использовать Lua-скрипты, необходимо воспользоваться `CustomLuaLoader.cs`. Добавьте этот скрипт на нужный игровой объект и заполните поля:

- **CustomModeDirectory** — название вашей игры
- **LuaScriptName** — название скрипта, который будет использоваться
- **Injections** — объекты, которые необходимо передать в скрипт для дальнейшего использования

   ![CustomLuaLoader](https://github.com/user-attachments/assets/5c0f25b7-eebc-4c83-b907-6d89a4d29edd)

   - **Name** — название объекта, которое будет использоваться в вашем скрипте
   - **Value** — объект, который необходимо передать

Lua-скрипты размещаются по следующему пути: `Проект/Assets/LuaScripts/<CustomModeDirectory>/<LuaScriptName>.lua`. *(Данный путь будет выведен в Debug log при старте.)*

Чтобы вызвать функцию извне, активируйте метод `CustomLuaLoader.InvokeLuaFunction("LUAFUNCTIONNAME")` и впишите название функции:

![InvokeFunction](https://github.com/user-attachments/assets/38d1bcf6-5a2d-4a48-a9a6-9edea968f751)

### Использование LuaTriggerInvoker

Добавьте компонент LuaTriggerInvoker на объект с триггер-коллайдером.

Укажите targetCollider — объект, при столкновении с которым будет вызвана Lua-функция (например, коллайдер головы игрока) или установите флаг UseHead = true, чтобы автоматически использовать GameObject.Find("HeadCollision") как цель.

Назначьте CustomLuaLoader — компонент, отвечающий за выполнение Lua-функций.

Отметьте, какие события должны вызывать Lua-функции:

✅ callOnEnter — срабатывает при входе в триггер.

✅ callOnExit — при выходе из триггера.

✅ callOnStay — при нахождении внутри триггера каждый кадр.

Впишите названия Lua-функций, которые должны вызываться (onEnterFunction, onExitFunction, onStayFunction).



---

## Как «собрать» игру?

1. В скрипте BuildAssetBundles впишите необходимую платформу: "iOS/Android"; Нажмите на кнопку **Build AssetBundles**:

   ![BuildAssetBundles](https://github.com/user-attachments/assets/539cf9e4-2b59-4e57-9f1d-a64bd3af27e6)

---

## Формат игры

Игра должна быть в следующем формате:

- Папка с названием игры
  - Файлы бандла
  - Обложка в формате `logo.png`
  - Папка `Resources`
    - Скрипты Lua

![GameFormat](https://github.com/user-attachments/assets/2f58c45f-68f5-4fc6-be04-ac58d0542865)

---

## Тестирование на устройствах

### Android
Переместите игру по следующему пути:
`Android/data/com.Zhes.EnJoyTheVR/files/Apps/`

### iOS
Переместите игру по следующему пути:
`На iPhone/EnJoyTheVR/Apps/`

Добавьте свою игру в файл "installed_apps.json" в папке EnJoyTheVR по формату:
{
        "folderName": "DemoScene",
        "version": "0.0.1",
        "entryScene": "DemoScene",
        "name": "DemoScene",
        "usesInteraction": "false",
        "usesDefaultPlayer": "true",
        "usesDefaultCanvas": "true"
}

---

## EnJoyTheVR API: EVR.API

Для использования API необходимо поместить префаб с названием **EVR.API** на первую сцену вашего приложения.

![Prefab1](https://github.com/user-attachments/assets/ee0e6c3a-678a-4d28-b80b-565fdeced2fb)
![Prefab2](https://github.com/user-attachments/assets/6c91332b-34d9-4226-a16e-683ac758dd3c)

### Описание API

#### OnExit()
Впишите эту функцию в ваш Lua скрипт, если хотите выполнить какие-то действия перед закрытием игры.
**Пример:**
```lua
function OnExit()
    LeavePlaneAndTPToSpawn()
end
```

#### EVR.UseTouchMode
Возвращает true, если игрок запустил приложение в сенсорном (не VR) режиме. Это означает, что управление осуществляется через сенсорный экран, без гарнитуры VR.

**Пример:**
```lua
function Start()
    if EVR.UseTouchMode then
        print("Сенсорный режим активен")
    end
end
```

#### EVR.Use6DOF
Возвращает true, если у игрока активно отслеживание головы (6 степеней свободы). Это может быть, например, при использовании телефона как VR-шлема с гироскопом и камерой.

**Пример:**
```lua
function Start()
    if EVR.Use6DOF then
        print("Игрок использует трекинг головы")
        -- активируем функции, связанные с ориентацией в пространстве
    end
end
```

#### EVR.UseHandTracking 
Возвращает true, если у игрока активно отслеживание рук.
```lua
function Start()
    if EVR.UseHandTracking then
        print("Игрок использует трекинг рук")
    else
        print("Отслеживание рук не доступно")
    end
end
```

#### EVR.IsPC
Возвращает true, если игрок на платформе PC.
```lua
function Start()
    if EVR.IsPC then
        print("Игрок играет с ПК")
    else
        print("Икрок со смартфона или Quest")
    end
end
```

### Эти свойства позволяют адаптировать интерфейс, управление и механику под конкретные возможности устройства пользователя.

#### EVR.Player
Возвращает GameObject игрока.

**Пример:**
```lua
local player = EVR.Player
function Start()
    player:GetComponent("Transform").position = Vector3(0, 0, 0)
end
```

#### EVR.PlayerHead
Возвращает GameObject головы игрока.

**Пример:**
```lua
local player = EVR.PlayerHead
function Start()
    player:GetComponent("Transform").position = Vector3(0, 0, 0)
end
```

#### EVR:Save(string, value)
Сохраняет значение в системе PlayerPrefs по указанному ключу.

**Пример:**
```lua
function Start()
    EVR:Save("Name", "John")
    EVR:Save("Score", 100)
    EVR:Save("IsAlive", true)
end
```

#### EVR:Load(string, string)
Загружает сохранённое значение из PlayerPrefs по указанному ключу.

**Пример:**
```lua
local playerName = EVR:Load("Name", "string")
local score = EVR:Load("Score", "int")
local isAlive = EVR:Load("IsAlive", "bool")
```

#### EVR:SetTime(float)
Устанавливает масштаб времени в игре, изменяя скорость его течения.

**Пример:**
```lua
function Start()
    EVR:SetTime(0.2)
end
```

#### EVR:CloseApp()
Закрывает приложение, возвращая игрока в главное лобби.

**Пример:**
```lua
function Update()
    if CS.UnityEngine.Input.GetKey(CS.UnityEngine.KeyCode.Return) then
        EVR:CloseApp()
        CS.UnityEngine.Debug.Log("AppWasClosed")
    end
end
```

#### EVR:LoadScene(string, bool)
Загружает сцену из AssetBundle. Аргументы:
- `string` — название сцены.
- `bool` — оставить ли предыдущую сцену загруженной.

**Пример:**
```lua
function Start()
    EVR:LoadScene("TestScene", true)
    CS.UnityEngine.Debug.Log("TestScene Loaded")
end
```

#### EVR:SetPlayerCollider(float Height = 2.0, float Radius = 0.1)
Меняет коллайдер основного игрока.

**Пример:**
```lua
function Start()
    EVR:SetPlayerCollider(5.5, 1.5)
end
```

#### EVR:SetHeight(float Height = 1.65)
Меняет стандартную высоты головы игрока.

**Пример:**
```lua
function Start()
    EVR:SetHeight(0.5)
end
```

#### EVR:DoJump()
Так как прыжки не совсем свойственны для VR, данная возможность вынесена в отдельный метод.

**Пример:**
```lua
function Start()
    EVR:DoJump()
end
```

#### EVR:SetJumpForce(float JF = 3f) 
Меняет силу(высоту) прыжка игрока.

**Пример:**
```lua
function Start()
    EVR:SetJumpForce(10.5) 
end
```

#### EVR:SetPlayerSpeed(float movementSpeed = 3.0f, float strafeSpeed = 3.0f) 
Меняет скорость перемещения игрока.

**Пример:**
```lua
function Start()
    EVR:SetPlayerSpeed(10.5, 8.5) 
end
```

#### EVR:BlockStick()
Блокирует стандартное перемещение (стик).

**Пример:**
```lua
EVR:BlockStick()
```

#### EVR:UnblockStick()
Разблокирует стандартное перемещение (стик).

**Пример:**
```lua
EVR:UnblockStick()
```

#### EVR:EnableKeyboard(TMP_InputField, Transform = null)
Включает клавиатуру, указывается InputField, для которого требуется ввод.

**Пример:**
```lua
EVR:EnableKeyboard(InputField, spawnplace:GetComponent("Transform")
```

#### EVR:DisableKeyboard()
Отключает клавиатуру.

**Пример:**
```lua
EVR:DisableKeyboard()
```

#### EVR:BKeyCode()
Передаёт KeyCode для кнопки "B" на контроллере.<br/>
(Аналогично с AKeyCode(), XKeyCode(), YKeyCode(), RStickButtonKeyCode(), LStickButtonKeyCode(), RKeyCode(), LKeyCode(), ZRKeyCode(), ZLKeyCode(), UPKeyCode(), DownKeyCode(), LeftKeyCode(), RightKeyCode()) /левый стик - "Horizontal"/"Vertical", правый стик - "HorizontalRight"/"VerticalRight"/

**Пример:**
```lua
local BKeycode = EVR:BKeyCode()

if CS.UnityEngine.Input.GetKey(BKeycode) then
   CS.UnityEngine.Debug.Log("BButton")
end
```

#### EVR:EnableLoading()
Включает экран загрузки.

**Пример:**
```lua
EVR:EnableLoading()
```

#### EVR:DisableLoading()
Отключает экран загрузки.

**Пример:**
```lua
EVR:DisableLoading()
```


---

## Мультиплеер: EVRPhoton

Многопользовательские приложения в EnJoyTheVR основаны на [Photon 2](https://www.photonengine.com). Для использования EVRPhoton необходимо поместить префаб с названием **EVRPhoton** на каждую сцену вашего приложения, где происходит взаимодействие с функциями Photon.

<img width="80" alt="Снимок экрана 2025-01-20 в 00 36 44" src="https://github.com/user-attachments/assets/99e8c0f7-c6ef-4d30-bec6-dbcd3e361d32" />

Для подключения к PhotonNetwork используйте скрипт "PhotonSetConnection.cs", поместите его на любой обьект стартовой сцены, укажите необходимые настройки, в App Id Realtime укажите Id приложения из личного кабинета [PhotonEngine](https://dashboard.photonengine.com).

В проекте также присутствуют вспомогательные скрипты, которые было бы проблематично реализовать через Lua:

- **EVRPhotonObjSync.cs** - Поместите его на объект, методы которого хотите синхронизировать в дальнейшем. (См. описание API)
- **EVRPhotonServerList.cs** - Создан для работы со списком созданных комнат, требует указания serverPanelPrefab, contentParent.
- **EVRPhotonServerPanel.cs** - Используется для определения serverPanelPrefab в скрипте **EVRPhotonServerList.cs**. Необходимо указать: TMP_Text roomNameText, TMP_Text playerCountText.

### Описание API

#### EVRPhoton:RegisterInPool(string name, bool needDestroy = false)
Регистрация объектов в пуле для дальнейшего использования в мультиплеере. Необходимо сделать это в стартовой сцене в **function Start()**.

**Пример:**
```lua
function Start()
    EVRPhoton:RegisterInPool("Cube")
    EVRPhoton:RegisterInPool("LHand")
    EVRPhoton:RegisterInPool("RHand")
    EVRPhoton:RegisterInPool("Pistol")
end
```

#### EVRPhoton:CreateRoom(string name, string MapName = null)
Создание комнаты, с последующей загрузкой сцены с названием указанным в MapName(при значении по умолчанию загрузка сцены не происходит).

**Пример:**
```lua
EVRPhoton:CreateRoom(name, "Game")
```

#### EVRPhoton:JoinRoom(string name, string MapName = null)
Подключение к существующей комнате, с последующей загрузкой сцены с названием указанным в MapName(при значении по умолчанию загрузка сцены не происходит).

**Пример:**
```lua
function JoinRoomBut()
    local name = Text:GetComponent("TMPro.TextMeshProUGUI").text
    EVRPhoton:JoinRoom(name, "Game")
end
```

#### EVRPhoton:LeaveRoom(string MapName = null)
Отключение от комнаты, с последующей загрузкой сцены с названием указанным в MapName(при значении по умолчанию загрузка сцены не происходит).

**Пример:**
```lua
EVRPhoton:LeaveRoom("lobby")
```

#### EVRPhoton:DisconnectFromMaster()
Отключение от PhotonNetwork.
**Пример:**
```lua
EVRPhoton:DisconnectFromMaster()
```

#### EVRPhoton:Instantiate(string name, Vector3 vector, Quaternion quaternion)
Инициализация зарегестрированного объекта в пуле на заданных координатах.
**Пример:**
```lua
function Start()
    EVRPhoton:Instantiate("Cube", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    EVRPhoton:Instantiate("LHand", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    EVRPhoton:Instantiate("RHand", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
end
```

#### EVRPhoton:SetOwnership(GameObject targetObject)
Передать владение GameObject локальному игроку.
**Пример:**
```lua
EVRPhoton:SetOwnership(pistol)
```

#### EVRPhoton:Sync(GameObject targetObject, string scriptName, string methodName, string parameters = null)
Синхронизировать исполнение нужного метода нужного объекта между игроками. На этом объекте должен находиться скрипт "EVRPhotonObjSync.cs"
**Пример:**
```lua
EVRPhoton:Sync(pistol, "gun", "shoot")
```

#### EVRPhoton:CheckIfMaster()
Обновить переменную EVRPhoton.IsMaster.
**Пример:**
```lua
function Start()
    EVRPhoton:CheckIfMaster()
    if EVRPhoton.IsMaster == true then
        EVRPhoton:Instantiate("Box", CS.UnityEngine.Vector3.zero, CS.UnityEngine.Quaternion.identity)
    end
end
```

#### EVRPhoton.NickName
Возвращает текущий никнейм игрока (PhotonNetwork)
**Пример:**
```lua
function Start()
    CS.UnityEngine.Debug.Log(EVRPhoton.NickName)
end
```

#### EVRPhoton:SetNickName(string)
Устанавливает новый никнейм игрока (PhotonNetwork)
**Пример:**
```lua
function Start()
    EVRPhoton:SetNickName("NickName")
end
```


