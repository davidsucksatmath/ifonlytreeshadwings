-- GitHub raw base URL
local BASE = "https://raw.githubusercontent.com/davidsucksatmath/ifonlytreeshadwings/main/package/src/package/client/"

-- List of all Lua files (relative to BASE)
local files = {
    "cloner/init.lua",
    "cloner/properties.lua",
    "cloner/sera.lua",
    "iris/init.lua",
    "iris/API.lua",
    "iris/Internal.lua",
    "iris/PubTypes.lua",
    "iris/Types.lua",
    "iris/WidgetTypes.lua",
    "iris/config.lua",
    "iris/demoWindow.lua",
    "iris/widgets/Button.lua",
    "iris/widgets/CheckBox.lua",
    "iris/widgets/Combo.lua",
    "iris/widgets/Format.lua",
    "iris/widgets/Image.lua",
    "iris/widgets/Input.lua",
    "iris/widgets/Menu.lua",
    "iris/widgets/Plot.lua",
    "iris/widgets/RadioButton.lua",
    "iris/widgets/Root.lua",
    "iris/widgets/Table.lua",
    "iris/widgets/Text.lua",
    "iris/widgets/Tree.lua",
    "iris/widgets/Window.lua",
}

-- Split path into parts (e.g., "iris/widgets/Button" → { "iris", "widgets", "Button" })
local function splitPath(path)
    local t = {}
    for part in string.gmatch(path, "[^/]+") do
        part = part:gsub("%.lua$", "") -- Remove .lua extension
        t[#t + 1] = part
    end
    return t
end

-- Root of module tree
local registry = {}

-- Build tree structure and attach loaders
for _, path in ipairs(files) do
    local parts = splitPath(path)
    local current = registry
    for i = 1, #parts - 1 do
        current[parts[i]] = current[parts[i]] or {}
        current = current[parts[i]]
    end

    local moduleName = parts[#parts]
    current[moduleName] = {
        __isModule = true,
        __src = BASE .. path,
        __loaded = false,
    }
end

-- Inject fake script.parent links for require(script.X)
local function injectParents(tbl, parent)
    for name, value in pairs(tbl) do
        if type(value) == "table" then
            value.__parent = tbl
            injectParents(value, tbl)
        end
    end
end
injectParents(registry)

-- Load module source with fake script tree
local function loadModule(module)
    if module.__loaded then return module.__value end

    local src = game:HttpGet(module.__src)
    local env = {
        script = setmetatable({}, {
            __index = function(_, k)
                return module.__parent and module.__parent[k]
            end
        })
    }
    setmetatable(env, { __index = getfenv() })

    local fn = loadstring(src)
    setfenv(fn, env)
    module.__value = fn()
    module.__loaded = true
    return module.__value
end

-- Replace require(script.X) simulation
local function fakeRequire(mod)
    return loadModule(mod)
end

-- 🔥 Entry point (load cloner/init.lua or iris/init.lua or whatever)
return fakeRequire(registry.cloner)
