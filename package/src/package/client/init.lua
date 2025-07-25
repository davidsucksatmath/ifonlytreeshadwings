local module = {}

local HttpService = game:GetService("HttpService")

local cloner_exploit = require(script.cloner)
local iris = require(script.iris).Init()

local building_path = iris.State("")
local path_state = iris.State("")

local function get_instance_from_path(path)
	local current = game
	for part in path:gmatch("[^%.]+") do
		if part ~= "game" then
			current = current:FindFirstChild(part)
			if not current then return nil end
		end
	end
	return current
end

iris:Connect(function()
	iris.Window({"object cloner"})
	iris.InputText("path to clone", {text = path_state})
	iris.InputText("path to build from", {text = building_path})

	if iris.Button({"clone"}).clicked() then
		local instance = get_instance_from_path(path_state.value)
		if instance then
			local tree = cloner_exploit.build_tree_and_schemas(instance)
			building_path:set(path_state.value)
			path_state:set(HttpService:JSONEncode(tree))
		else
			warn("path not correct: cannot find instance to clone")
		end
	end

	if iris.Button({"build"}).clicked() then
		local instance = get_instance_from_path(building_path.value)
		if not instance then
			warn("build path not correct: instance not found")
			return
		end

		local success, tree = pcall(function()
			return HttpService:JSONDecode(path_state.value)
		end)

		if success and tree then
			cloner_exploit.write_tree_into_instance(instance, tree)
		else
			warn("failed to decode tree JSON")
		end
	end

	iris.End()
end)

return module
