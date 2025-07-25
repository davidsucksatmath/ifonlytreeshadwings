local properties_tbl = require(script.properties)
local sera = require(script.sera)

local schemas = {}

local function sera_type_from_value(value)
	local t = typeof(value)
	if t == "number" then return sera.Float64 end
	if t == "string" then return sera.String8 end
	if t == "boolean" then return sera.Bool end
	if t == "Vector3" then return sera.Vector3 end
	if t == "CFrame" then return sera.CFrame end
	if t == "Color3" then return sera.Color3 end
	if t == "EnumItem" then return sera.EnumItem end
	return nil
end

local function schemas_from_instance(instance)
	local class_name = instance.ClassName
	if schemas[class_name] or not properties_tbl[class_name] then return end

	local fields = {}
	for _, prop_name in ipairs(properties_tbl[class_name]) do
		local value = instance[prop_name]
		local sera_type = sera_type_from_value(value)
		if sera_type then
			fields[prop_name] = sera_type
		end
	end

	if next(fields) then
		schemas[class_name] = sera.Schema(fields)
	end
end

local function extract_properties(instance)
	local class_name = instance.ClassName
	local to_extract = properties_tbl[class_name]
	if not to_extract then return {} end

	local data = {}
	for _, prop_name in ipairs(to_extract) do
		data[prop_name] = instance[prop_name]
	end
	return data
end

local function apply_properties(instance, properties)
	for prop, value in pairs(properties) do
		instance[prop] = value
	end
end

local function build_tree(instance)
	schemas_from_instance(instance)

	local tree = {
		class_name = instance.ClassName,
		name = instance.Name,
		properties = extract_properties(instance),
		children = {},
	}

	for _, child in ipairs(instance:GetChildren()) do
		table.insert(tree.children, build_tree(child))
	end

	return tree
end

local function index_children_by_name(children)
	local map = {}
	for _, child in ipairs(children) do
		map[child.Name] = child
	end
	return map
end

local function write_tree_into_instance(instance, tree)
	instance.Name = tree.name or instance.Name
	apply_properties(instance, tree.properties or {})

	local existing_children = index_children_by_name(instance:GetChildren())
	local new_children_map = {}

	for _, child_tree in ipairs(tree.children or {}) do
		local existing = existing_children[child_tree.name]
		local child_instance

		if existing and existing.ClassName == child_tree.class_name then
			child_instance = existing
		else
			if existing then existing:Destroy() end
			child_instance = Instance.new(child_tree.class_name)
			child_instance.Name = child_tree.name
			child_instance.Parent = instance
		end

		new_children_map[child_tree.name] = true
		apply_properties(child_instance, child_tree.properties or {})
		write_tree_into_instance(child_instance, child_tree)
	end

	for _, child in ipairs(instance:GetChildren()) do
		if not new_children_map[child.Name] then
			child:Destroy()
		end
	end
end

local module = {}

function module.build_tree_and_schemas(root_instance)
	return build_tree(root_instance), schemas
end

function module.write_tree_into_instance(root_instance, tree)
	write_tree_into_instance(root_instance, tree)
end

return module
