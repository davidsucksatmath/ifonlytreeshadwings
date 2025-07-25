-- Main GitHub path
local BASE = "https://raw.githubusercontent.com/davidsucksatmath/ifonlytreeshadwings/main/package/src/package/client/"

-- List of all relative Lua module paths
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

-- Utility to split a path by "/"
local function splitPath(path)
    local t = {}
    for part in path:gmatch("[^/]+") do
        table.insert(t, part:gsub("%.lua$", "")) -- remove ".lua"
    end
    return t
end

-- Module registry
local registry = {}

-- Build fake tree
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

-- Load module source
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
    setmetatable(env, {__index = getfenv()})
    local fn = loadstring(src)
    setfenv(fn, env)
    module.__value = fn()
    module.__loaded = true
    return module.__value
end

-- Recursively inject parents for fake script lookup
local function injectParents(tbl, parent)
    for k, v in pairs(tbl) do
        if type(v) == "table" and v.__isModule then
            v.__parent = tbl
        elseif type(v) == "table" then
            injectParents(v, tbl)
        end
    end
end
injectParents(registry)

-- Simulate running `require(script.cloner)` etc.
local function fakeRequire(mod)
    return loadModule(mod)
end

-- Now run your main script (init)
return fakeRequire(registry["cloner"]) -- or ["init"], depending on which is your true entry point
