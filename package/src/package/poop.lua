local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")

-- Simple UI Framework
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "ObjectClonerUI"
screenGui.ResetOnSpawn = false
screenGui.Parent = Players.LocalPlayer:WaitForChild("PlayerGui")

local mainFrame = Instance.new("Frame")
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.5, -100)
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Object Cloner"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.BackgroundTransparency = 1
title.Parent = mainFrame

-- Input fields
local pathToCloneLabel = Instance.new("TextLabel")
pathToCloneLabel.Size = UDim2.new(1, -20, 0, 20)
pathToCloneLabel.Position = UDim2.new(0, 10, 0, 40)
pathToCloneLabel.Text = "Path to clone:"
pathToCloneLabel.TextColor3 = Color3.new(1, 1, 1)
pathToCloneLabel.Font = Enum.Font.SourceSans
pathToCloneLabel.TextSize = 14
pathToCloneLabel.BackgroundTransparency = 1
pathToCloneLabel.TextXAlignment = Enum.TextXAlignment.Left
pathToCloneLabel.Parent = mainFrame

local pathToCloneBox = Instance.new("TextBox")
pathToCloneBox.ClearTextOnFocus = false
pathToCloneBox.Size = UDim2.new(1, -20, 0, 25)
pathToCloneBox.Position = UDim2.new(0, 10, 0, 60)
pathToCloneBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
pathToCloneBox.BorderSizePixel = 0
pathToCloneBox.Text = ""
pathToCloneBox.TextColor3 = Color3.new(1, 1, 1)
pathToCloneBox.Font = Enum.Font.SourceSans
pathToCloneBox.TextSize = 14
pathToCloneBox.Parent = mainFrame

local buildPathLabel = Instance.new("TextLabel")
buildPathLabel.Size = UDim2.new(1, -20, 0, 20)
buildPathLabel.Position = UDim2.new(0, 10, 0, 90)
buildPathLabel.Text = "Path to build from:"
buildPathLabel.TextColor3 = Color3.new(1, 1, 1)
buildPathLabel.Font = Enum.Font.SourceSans
buildPathLabel.TextSize = 14
buildPathLabel.BackgroundTransparency = 1
buildPathLabel.TextXAlignment = Enum.TextXAlignment.Left
buildPathLabel.Parent = mainFrame

local buildPathBox = Instance.new("TextBox")
pathToCloneBox.ClearTextOnFocus = false
buildPathBox.Size = UDim2.new(1, -20, 0, 25)
buildPathBox.Position = UDim2.new(0, 10, 0, 110)
buildPathBox.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
buildPathBox.BorderSizePixel = 0
buildPathBox.Text = ""
buildPathBox.TextColor3 = Color3.new(1, 1, 1)
buildPathBox.Font = Enum.Font.SourceSans
buildPathBox.TextSize = 14
buildPathBox.Parent = mainFrame

-- ✅ ADD THIS FIX
buildPathBox.ClearTextOnFocus = false

-- Buttons
local cloneButton = Instance.new("TextButton")
cloneButton.Size = UDim2.new(0.45, 0, 0, 30)
cloneButton.Position = UDim2.new(0.025, 0, 0, 145)
cloneButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
cloneButton.BorderSizePixel = 0
cloneButton.Text = "Clone"
cloneButton.TextColor3 = Color3.new(1, 1, 1)
cloneButton.Font = Enum.Font.SourceSans
cloneButton.TextSize = 14
cloneButton.Parent = mainFrame

local buildButton = Instance.new("TextButton")
buildButton.Size = UDim2.new(0.45, 0, 0, 30)
buildButton.Position = UDim2.new(0.525, 0, 0, 145)
buildButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
buildButton.BorderSizePixel = 0
buildButton.Text = "Build"
buildButton.TextColor3 = Color3.new(1, 1, 1)
buildButton.Font = Enum.Font.SourceSans
buildButton.TextSize = 14
buildButton.Parent = mainFrame

local properties_tbl = {
	Accessory = {
		"AccessoryType"
	},
	Accoutrement = {
		"AttachmentForward",
		"AttachmentPoint",
		"AttachmentPos",
		"AttachmentRight",
		"AttachmentUp"
	},
	AlignOrientation = {
		"AlignType",
		"CFrame",
		"MaxAngularVelocity",
		"MaxTorque",
		"Mode",
		"PrimaryAxis",
		"PrimaryAxisOnly",
		"ReactionTorqueEnabled",
		"Responsiveness",
		"RigidityEnabled",
		"SecondaryAxis"
	},
	AlignPosition = {
		"ApplyAtCenterOfMass",
		"MaxForce",
		"MaxVelocity",
		"Mode",
		"Position",
		"ReactionForceEnabled",
		"Responsiveness",
		"RigidityEnabled"
	},
	AngularVelocity = {
		"AngularVelocity",
		"MaxTorque",
		"ReactionTorqueEnabled",
		"RelativeTo"
	},
	Animation = {
		"AnimationId"
	},
	AnimationClip = {
		"Loop",
		"Priority"
	},
	AnimationTrack = {
		"Animation",
		"IsPlaying",
		"Length",
		"Looped",
		"Priority",
		"Speed",
		"TimePosition",
		"WeightCurrent",
		"WeightTarget"
	},
	ArcHandles = {
		"Axes"
	},
	Atmosphere = {
		"Color",
		"Decay",
		"Density",
		"Glare",
		"Haze",
		"Offset"
	},
	Attachment = {
		"Axis",
		"CFrame",
		"Orientation",
		"Position",
		"SecondaryAxis",
		"Visible",
		"WorldAxis",
		"WorldCFrame",
		"WorldOrientation",
		"WorldPosition",
		"WorldSecondaryAxis"
	},
	BackpackItem = {
		"TextureId"
	},
	BallSocketConstraint = {
		"LimitsEnabled",
		"MaxFrictionTorque",
		"Radius",
		"Restitution",
		"TwistLimitsEnabled",
		"TwistLowerAngle",
		"TwistUpperAngle",
		"UpperAngle"
	},
	BasePart = {
		"Anchored",
		"AssemblyAngularVelocity",
		"AssemblyCenterOfMass",
		"AssemblyLinearVelocity",
		"AssemblyMass",
		"AssemblyRootPart",
		"BackSurface",
		"BottomSurface",
		"BrickColor",
		"CFrame",
		"CanCollide",
		"CanQuery",
		"CanTouch",
		"CastShadow",
		"CenterOfMass",
		"CollisionGroupId",
		"Color",
		"CustomPhysicalProperties",
		"FrontSurface",
		"LeftSurface",
		"Locked",
		"Mass",
		"Massless",
		"Material",
		"MaterialVariant",
		"Orientation",
		"PivotOffset",
		"Position",
		"Reflectance",
		"ResizeIncrement",
		"ResizeableFaces",
		"RightSurface",
		"RootPriority",
		"Rotation",
		"Size",
		"TopSurface",
		"Transparency"
	},
	BaseScript = {
		"Disabled",
		"LinkedSource"
	},
	BaseWrap = {
		"CageMeshId",
		"CageOrigin",
		"CageOriginWorld",
		"HSRAssetId",
		"ImportOrigin",
		"ImportOriginWorld"
	},
	Beam = {
		"Attachment0",
		"Attachment1",
		"Brightness",
		"Color",
		"CurveSize0",
		"CurveSize1",
		"Enabled",
		"FaceCamera",
		"LightEmission",
		"LightInfluence",
		"Segments",
		"Texture",
		"TextureLength",
		"TextureMode",
		"TextureSpeed",
		"Transparency",
		"Width0",
		"Width1",
		"ZOffset"
	},
	BillboardGui = {
		"Active",
		"Adornee",
		"AlwaysOnTop",
		"Brightness",
		"ClipsDescendants",
		"CurrentDistance",
		"DistanceLowerLimit",
		"DistanceStep",
		"DistanceUpperLimit",
		"ExtentsOffset",
		"ExtentsOffsetWorldSpace",
		"LightInfluence",
		"MaxDistance",
		"PlayerToHideFrom",
		"Size",
		"SizeOffset",
		"StudsOffset",
		"StudsOffsetWorldSpace"
	},
	BloomEffect = {
		"Intensity",
		"Size",
		"Threshold"
	},
	BlurEffect = {
		"Size"
	},
	BodyAngularVelocity = {
		"AngularVelocity",
		"MaxTorque",
		"P"
	},
	BodyColors = {
		"HeadColor",
		"HeadColor3",
		"LeftArmColor",
		"LeftArmColor3",
		"LeftLegColor",
		"LeftLegColor3",
		"RightArmColor",
		"RightArmColor3",
		"RightLegColor",
		"RightLegColor3",
		"TorsoColor",
		"TorsoColor3"
	},
	BodyForce = {
		"Force"
	},
	BodyGyro = {
		"CFrame",
		"D",
		"MaxTorque",
		"P"
	},
	BodyPosition = {
		"D",
		"MaxForce",
		"P",
		"Position"
	},
	BodyThrust = {
		"Force",
		"Location"
	},
	BodyVelocity = {
		"MaxForce",
		"P",
		"Velocity"
	},
	Bone = {
		"Transform",
		"TransformedCFrame",
		"TransformedWorldCFrame"
	},
	BoolValue = {
		"Value"
	},
	BoxHandleAdornment = {
		"Size"
	},
	BrickColorValue = {
		"Value"
	},
	CFrameValue = {
		"Value"
	},
	Camera = {
		"CFrame",
		"CameraSubject",
		"CameraType",
		"DiagonalFieldOfView",
		"FieldOfView",
		"FieldOfViewMode",
		"Focus",
		"HeadLocked",
		"HeadScale",
		"MaxAxisFieldOfView",
		"NearPlaneZ",
		"ViewportSize"
	},
	CanvasGroup = {
		"GroupColor",
		"GroupTransparency"
	},
	ChannelSelectorSoundEffect = {
		"Channel"
	},
	CharacterMesh = {
		"BaseTextureId",
		"BodyPart",
		"MeshId",
		"OverlayTextureId"
	},
	Chat = {
		"BubbleChatEnabled",
		"LoadDefaultChat"
	},
	ChatInputBarConfiguration = {
		"Enabled",
		"TargetTextChannel"
	},
	ChatWindowConfiguration = {
		"Enabled"
	},
	ChorusSoundEffect = {
		"Depth",
		"Mix",
		"Rate"
	},
	ClickDetector = {
		"CursorIcon",
		"MaxActivationDistance"
	},
	Clothing = {
		"Color3"
	},
	Clouds = {
		"Color",
		"Cover",
		"Density",
		"Enabled"
	},
	Color3Value = {
		"Value"
	},
	ColorCorrectionEffect = {
		"Brightness",
		"Contrast",
		"Saturation",
		"TintColor"
	},
	CommandInstance = {
		"AllowGUIAccessPoints",
		"Checked",
		"DefaultShortcut",
		"DisplayName",
		"Enabled",
		"Icon",
		"Name",
		"Permission",
		"StatusTip"
	},
	CompressorSoundEffect = {
		"Attack",
		"GainMakeup",
		"Ratio",
		"Release",
		"SideChain",
		"Threshold"
	},
	ConeHandleAdornment = {
		"Height",
		"Radius"
	},
	Constraint = {
		"Active",
		"Attachment0",
		"Attachment1",
		"Color",
		"Enabled",
		"Visible"
	},
	ContentProvider = {
		"BaseUrl",
		"RequestQueueSize"
	},
	CoreGui = {
		"SelectionImageObject",
		"Version"
	},
	CustomEventReceiver = {
		"Source"
	},
	CylinderHandleAdornment = {
		"Angle",
		"Height",
		"InnerRadius",
		"Radius"
	},
	CylindricalConstraint = {
		"AngularActuatorType",
		"AngularLimitsEnabled",
		"AngularResponsiveness",
		"AngularRestitution",
		"AngularSpeed",
		"AngularVelocity",
		"CurrentAngle",
		"InclinationAngle",
		"LowerAngle",
		"MotorMaxAngularAcceleration",
		"MotorMaxTorque",
		"RotationAxisVisible",
		"ServoMaxTorque",
		"TargetAngle",
		"UpperAngle",
		"WorldRotationAxis"
	},
	DataModel = {
		"CreatorId",
		"CreatorType",
		"GameId",
		"Genre",
		"JobId",
		"PlaceId",
		"PlaceVersion",
		--"PrivateServerId",
		--"PrivateServerOwnerId",
		"Workspace"
	},
	DataModelMesh = {
		"Offset",
		"Scale",
		"VertexColor"
	},
	DataStoreInfo = {
		"CreatedTime",
		"DataStoreName",
		"UpdatedTime"
	},
	DataStoreKey = {
		"KeyName"
	},
	DataStoreKeyInfo = {
		"CreatedTime",
		"UpdatedTime",
		"Version"
	},
	DataStoreObjectVersionInfo = {
		"CreatedTime",
		"IsDeleted",
		"Version"
	},
	DataStoreOptions = {
		"AllScopes"
	},
	DataStoreService = {
		"AutomaticRetry"
	},
	DebugSettings = {
		"DataModel",
		"InstanceCount",
		"IsScriptStackTracingEnabled",
		"JobCount",
		"PlayerCount",
		"ReportSoundWarnings",
		"RobloxVersion",
		"TickCountPreciseOverride"
	},
	DebuggerBreakpoint = {
		"Condition",
		"ContinueExecution",
		"IsEnabled",
		"Line",
		"LogExpression",
		"isContextDependentBreakpoint"
	},
	DebuggerManager = {
		"DebuggingEnabled"
	},
	DebuggerWatch = {
		"Expression"
	},
	Decal = {
		"Color3",
		"Texture",
		"Transparency",
		"ZIndex"
	},
	DepthOfFieldEffect = {
		"FarIntensity",
		"FocusDistance",
		"InFocusRadius",
		"NearIntensity"
	},
	Dialog = {
		"BehaviorType",
		"ConversationDistance",
		"GoodbyeChoiceActive",
		"GoodbyeDialog",
		"InUse",
		"InitialPrompt",
		"Purpose",
		"Tone",
		"TriggerDistance",
		"TriggerOffset"
	},
	DialogChoice = {
		"GoodbyeChoiceActive",
		"GoodbyeDialog",
		"ResponseDialog",
		"UserDialog"
	},
	DistortionSoundEffect = {
		"Level"
	},
	DockWidgetPluginGui = {
		"HostWidgetWasRestored"
	},
	DoubleConstrainedValue = {
		"MaxValue",
		"MinValue",
		"Value"
	},
	DraggerService = {
		"AlignDraggedObjects",
		"AngleSnapEnabled",
		"AngleSnapIncrement",
		"AnimateHover",
		"CollisionsEnabled",
		"DraggerCoordinateSpace",
		"DraggerMovementMode",
		"GeometrySnapColor",
		"HoverAnimateFrequency",
		"HoverThickness",
		"JointsEnabled",
		"LinearSnapEnabled",
		"LinearSnapIncrement",
		"PivotSnapToGeometry",
		"ShowHover",
		"ShowPivotIndicator"
	},
	DynamicRotate = {
		"BaseAngle"
	},
	EchoSoundEffect = {
		"Delay",
		"DryLevel",
		"Feedback",
		"WetLevel"
	},
	EqualizerSoundEffect = {
		"HighGain",
		"LowGain",
		"MidGain"
	},
	EulerRotationCurve = {
		"RotationOrder"
	},
	Explosion = {
		"BlastPressure",
		"BlastRadius",
		"DestroyJointRadiusPercent",
		"ExplosionType",
		"Position",
		"TimeScale",
		"Visible"
	},
	FaceControls = {
		"ChinRaiser",
		"ChinRaiserUpperLip",
		"Corrugator",
		"EyesLookDown",
		"EyesLookLeft",
		"EyesLookRight",
		"EyesLookUp",
		"FlatPucker",
		"Funneler",
		"JawDrop",
		"JawLeft",
		"JawRight",
		"LeftBrowLowerer",
		"LeftCheekPuff",
		"LeftCheekRaiser",
		"LeftDimpler",
		"LeftEyeClosed",
		"LeftEyeUpperLidRaiser",
		"LeftInnerBrowRaiser",
		"LeftLipCornerDown",
		"LeftLipCornerPuller",
		"LeftLipStretcher",
		"LeftLowerLipDepressor",
		"LeftNoseWrinkler",
		"LeftOuterBrowRaiser",
		"LeftUpperLipRaiser",
		"LipPresser",
		"LipsTogether",
		"LowerLipSuck",
		"MouthLeft",
		"MouthRight",
		"Pucker",
		"RightBrowLowerer",
		"RightCheekPuff",
		"RightCheekRaiser",
		"RightDimpler",
		"RightEyeClosed",
		"RightEyeUpperLidRaiser",
		"RightInnerBrowRaiser",
		"RightLipCornerDown",
		"RightLipCornerPuller",
		"RightLipStretcher",
		"RightLowerLipDepressor",
		"RightNoseWrinkler",
		"RightOuterBrowRaiser",
		"RightUpperLipRaiser",
		"TongueDown",
		"TongueOut",
		"TongueUp",
		"UpperLipSuck"
	},
	FaceInstance = {
		"Face"
	},
	Feature = {
		"FaceId",
		"InOut",
		"LeftRight",
		"TopBottom"
	},
	FileMesh = {
		"MeshId",
		"TextureId"
	},
	Fire = {
		"Color",
		"Enabled",
		"Heat",
		"SecondaryColor",
		"Size",
		"TimeScale"
	},
	Flag = {
		"TeamColor"
	},
	FlagStand = {
		"TeamColor"
	},
	FlangeSoundEffect = {
		"Depth",
		"Mix",
		"Rate"
	},
	FloatCurve = {
		"Length"
	},
	FloorWire = {
		"CycleOffset",
		"From",
		"StudsBetweenTextures",
		"Texture",
		"TextureSize",
		"To",
		"Velocity",
		"WireRadius"
	},
	ForceField = {
		"Visible"
	},
	Frame = {
		"Style"
	},
	FunctionalTest = {
		"Description"
	},
	GameSettings = {
		"AdditionalCoreIncludeDirs",
		"OverrideStarterScript",
		"VideoCaptureEnabled",
		"VideoRecording"
	},
	GamepadService = {
		"GamepadCursorEnabled"
	},
	Glue = {
		"F0",
		"F1",
		"F2",
		"F3"
	},
	GuiBase2d = {
		"AbsolutePosition",
		"AbsoluteRotation",
		"AbsoluteSize",
		"AutoLocalize",
		"RootLocalizationTable"
	},
	GuiBase3d = {
		"Color3",
		"Transparency",
		"Visible"
	},
	GuiButton = {
		"AutoButtonColor",
		"Modal",
		"Selected",
		"Style"
	},
	GuiObject = {
		"Active",
		"AnchorPoint",
		"AutomaticSize",
		"BackgroundColor3",
		"BackgroundTransparency",
		"BorderColor3",
		"BorderMode",
		"BorderSizePixel",
		"ClipsDescendants",
		"LayoutOrder",
		"NextSelectionDown",
		"NextSelectionLeft",
		"NextSelectionRight",
		"NextSelectionUp",
		"Position",
		"Rotation",
		"Selectable",
		"SelectionImageObject",
		"Size",
		"SizeConstraint",
		"Visible",
		"ZIndex"
	},
	GuiService = {
		"AutoSelectGuiEnabled",
		"CoreGuiNavigationEnabled",
		"GuiNavigationEnabled",
		"MenuIsOpen",
		"SelectedObject",
		"TouchControlsEnabled"
	},
	HandleAdornment = {
		"AdornCullingMode",
		"AlwaysOnTop",
		"CFrame",
		"SizeRelativeOffset",
		"ZIndex"
	},
	Handles = {
		"Faces",
		"Style"
	},
	Highlight = {
		"Adornee",
		"DepthMode",
		"Enabled",
		"FillColor",
		"FillTransparency",
		"OutlineColor",
		"OutlineTransparency"
	},
	HingeConstraint = {
		"ActuatorType",
		"AngularResponsiveness",
		"AngularSpeed",
		"AngularVelocity",
		"CurrentAngle",
		"LimitsEnabled",
		"LowerAngle",
		"MotorMaxAcceleration",
		"MotorMaxTorque",
		"Radius",
		"Restitution",
		"ServoMaxTorque",
		"TargetAngle",
		"UpperAngle"
	},
	HopperBin = {
		"Active",
		"BinType"
	},
	HttpService = {
		"HttpEnabled"
	},
	Humanoid = {
		"AutoJumpEnabled",
		"AutoRotate",
		"AutomaticScalingEnabled",
		"BreakJointsOnDeath",
		"CameraOffset",
		"DisplayDistanceType",
		"DisplayName",
		"FloorMaterial",
		"Health",
		"HealthDisplayDistance",
		"HealthDisplayType",
		"HipHeight",
		"Jump",
		"JumpHeight",
		"JumpPower",
		"MaxHealth",
		"MaxSlopeAngle",
		"MoveDirection",
		"NameDisplayDistance",
		"NameOcclusion",
		"PlatformStand",
		"RequiresNeck",
		"RigType",
		"RootPart",
		"SeatPart",
		"Sit",
		"TargetPoint",
		"UseJumpPower",
		"WalkSpeed",
		"WalkToPart",
		"WalkToPoint"
	},
	HumanoidDescription = {
		"AccessoryBlob",
		"BackAccessory",
		"BodyTypeScale",
		"ClimbAnimation",
		"DepthScale",
		"Face",
		"FaceAccessory",
		"FallAnimation",
		"FrontAccessory",
		"GraphicTShirt",
		"HairAccessory",
		"HatAccessory",
		"Head",
		"HeadColor",
		"HeadScale",
		"HeightScale",
		"IdleAnimation",
		"JumpAnimation",
		"LeftArm",
		"LeftArmColor",
		"LeftLeg",
		"LeftLegColor",
		"NeckAccessory",
		"Pants",
		"ProportionScale",
		"RightArm",
		"RightArmColor",
		"RightLeg",
		"RightLegColor",
		"RunAnimation",
		"Shirt",
		"ShouldersAccessory",
		"SwimAnimation",
		"Torso",
		"TorsoColor",
		"WaistAccessory",
		"WalkAnimation",
		"WidthScale"
	},
	ImageButton = {
		"HoverImage",
		"Image",
		"ImageColor3",
		"ImageRectOffset",
		"ImageRectSize",
		"ImageTransparency",
		"IsLoaded",
		"PressedImage",
		"ResampleMode",
		"ScaleType",
		"SliceCenter",
		"SliceScale",
		"TileSize"
	},
	ImageHandleAdornment = {
		"Image",
		"Size"
	},
	ImageLabel = {
		"Image",
		"ImageColor3",
		"ImageRectOffset",
		"ImageRectSize",
		"ImageTransparency",
		"IsLoaded",
		"ResampleMode",
		"ScaleType",
		"SliceCenter",
		"SliceScale",
		"TileSize"
	},
	ImporterBaseSettings = {
		"Id",
		"ImportName",
		"ShouldImport"
	},
	ImporterGroupSettings = {
		"Anchored",
		"ImportAsModelAsset",
		"InsertInWorkspace"
	},
	ImporterMaterialSettings = {
		"DiffuseFilePath",
		"IsPbr",
		"MetalnessFilePath",
		"NormalFilePath",
		"RoughnessFilePath"
	},
	ImporterMeshSettings = {
		"Anchored",
		"Dimensions",
		"DoubleSided",
		"IgnoreVertexColors",
		"PolygonCount"
	},
	ImporterRootSettings = {
		"Anchored",
		"FileDimensions",
		"ImportAsModelAsset",
		"InsertInWorkspace",
		"InvertNegativeFaces",
		"MergeMeshes",
		"PolygonCount",
		"RigType",
		"ScaleUnit",
		"WorldForward",
		"WorldUp"
	},
	ImporterTextureSettings = {
		"FilePath"
	},
	InputObject = {
		"Delta",
		"KeyCode",
		"Position",
		"UserInputState",
		"UserInputType"
	},
	InsertService = {
		"AllowClientInsertModels"
	},
	Instance = {
		"Archivable",
		"ClassName",
		"Name",
		"Parent",
		"PropertyStatusStudio"
	},
	InstanceAdornment = {
		"Adornee"
	},
	IntConstrainedValue = {
		"MaxValue",
		"MinValue",
		"Value"
	},
	IntValue = {
		"Value"
	},
	JointInstance = {
		"Active",
		"C0",
		"C1",
		"Enabled",
		"Part0",
		"Part1"
	},
	Keyframe = {
		"Time"
	},
	KeyframeMarker = {
		"Value"
	},
	LayerCollector = {
		"Enabled",
		"ResetOnSpawn",
		"ZIndexBehavior"
	},
	Light = {
		"Brightness",
		"Color",
		"Enabled",
		"Shadows"
	},
	Lighting = {
		"Ambient",
		"Brightness",
		"ClockTime",
		"ColorShift_Bottom",
		"ColorShift_Top",
		"EnvironmentDiffuseScale",
		"EnvironmentSpecularScale",
		"ExposureCompensation",
		"FogColor",
		"FogEnd",
		"FogStart",
		"GeographicLatitude",
		"GlobalShadows",
		"OutdoorAmbient",
		"ShadowSoftness",
		"Technology",
		"TimeOfDay"
	},
	LineForce = {
		"ApplyAtCenterOfMass",
		"InverseSquareLaw",
		"Magnitude",
		"MaxForce",
		"ReactionForceEnabled"
	},
	LineHandleAdornment = {
		"Length",
		"Thickness"
	},
	LinearVelocity = {
		"LineDirection",
		"LineVelocity",
		"MaxForce",
		"PlaneVelocity",
		"PrimaryTangentAxis",
		"RelativeTo",
		"SecondaryTangentAxis",
		"VectorVelocity",
		"VelocityConstraintMode"
	},
	LocalizationService = {
		"RobloxLocaleId",
		"SystemLocaleId"
	},
	LocalizationTable = {
		"SourceLocaleId"
	},
	LuaSourceContainer = {
		"CurrentEditor"
	},
	MarkerCurve = {
		"Length"
	},
	MaterialService = {
		"AsphaltName",
		"BasaltName",
		"Brick",
		"BrickName",
		"Cobblestone",
		"CobblestoneName",
		"Concrete",
		"ConcreteName",
		"CorrodedMetal",
		"CorrodedMetalName",
		"CrackedLavaName",
		"DiamondPlate",
		"DiamondPlateName",
		"Fabric",
		"FabricName",
		"Foil",
		"FoilName",
		"GlacierName",
		"Granite",
		"GraniteName",
		"Grass",
		"GrassName",
		"GroundName",
		"Ice",
		"IceName",
		"LeafyGrassName",
		"LimestoneName",
		"Marble",
		"MarbleName",
		"Metal",
		"MetalName",
		"MudName",
		"PavementName",
		"Pebble",
		"PebbleName",
		"Plastic",
		"PlasticName",
		"RockName",
		"SaltName",
		"Sand",
		"SandName",
		"SandstoneName",
		"Slate",
		"SlateName",
		"SmoothPlastic",
		"SmoothPlasticName",
		"SnowName",
		"TerrainAsphalt",
		"TerrainBasalt",
		"TerrainBrick",
		"TerrainCobblestone",
		"TerrainConcrete",
		"TerrainCrackedLava",
		"TerrainGlacier",
		"TerrainGrass",
		"TerrainGround",
		"TerrainIce",
		"TerrainLeafyGrass",
		"TerrainLimestone",
		"TerrainMud",
		"TerrainPavement",
		"TerrainRock",
		"TerrainSalt",
		"TerrainSand",
		"TerrainSandstone",
		"TerrainSlate",
		"TerrainSnow",
		"TerrainWoodPlanks",
		"Use2022Materials",
		"Wood",
		"WoodName",
		"WoodPlanks",
		"WoodPlanksName"
	},
	MaterialVariant = {
		"BaseMaterial",
		"ColorMap",
		"MaterialPattern",
		"MetalnessMap",
		"NormalMap",
		"RoughnessMap",
		"StudsPerTile"
	},
	MeshPart = {
		"DoubleSided",
		"MeshId",
		"MeshSize",
		"RenderFidelity",
		"TextureID"
	},
	Message = {
		"Text"
	},
	Model = {
		"LevelOfDetail",
		"PrimaryPart",
		"WorldPivot"
	},
	ModuleScript = {
		"LinkedSource",
		"Source"
	},
	Motor = {
		"CurrentAngle",
		"DesiredAngle",
		"MaxVelocity"
	},
	Motor6D = {
		"ChildName",
		"ParentName"
	},
	Mouse = {
		"Hit",
		"Icon",
		"Origin",
		"Target",
		"TargetFilter",
		"TargetSurface",
		"UnitRay",
		"ViewSizeX",
		"ViewSizeY",
		"X",
		"Y"
	},
	NetworkSettings = {
		"HttpProxyEnabled",
		"HttpProxyURL",
		"IncomingReplicationLag",
		"PrintJoinSizeBreakdown",
		"PrintPhysicsErrors",
		"PrintStreamInstanceQuota",
		"RandomizeJoinInstanceOrder",
		"RenderStreamedRegions",
		"ShowActiveAnimationAsset"
	},
	NoCollisionConstraint = {
		"Enabled",
		"Part0",
		"Part1"
	},
	NotificationService = {
		"IsLuaGameDetailsEnabled",
		"SelectedTheme"
	},
	NumberPose = {
		"Value"
	},
	NumberValue = {
		"Value"
	},
	ObjectValue = {
		"Value"
	},
	PVAdornment = {
		"Adornee"
	},
	PackageLink = {
		"AutoUpdate",
		"Creator",
		"PackageAssetName",
		"PackageId",
		"PermissionLevel",
		"Status",
		"VersionNumber"
	},
	Pages = {
		"IsFinished"
	},
	Pants = {
		"PantsTemplate"
	},
	Part = {
		"Shape"
	},
	PartAdornment = {
		"Adornee"
	},
	PartOperation = {
		"RenderFidelity",
		"SmoothingAngle",
		"TriangleCount",
		"UsePartColor"
	},
	ParticleEmitter = {
		"Acceleration",
		"Brightness",
		"Color",
		"Drag",
		"EmissionDirection",
		"Enabled",
		"FlipbookFramerate",
		"FlipbookIncompatible",
		"FlipbookLayout",
		"FlipbookMode",
		"FlipbookStartRandom",
		"Lifetime",
		"LightEmission",
		"LightInfluence",
		"LockedToPart",
		"Orientation",
		"Rate",
		"RotSpeed",
		"Rotation",
		"Shape",
		"ShapeInOut",
		"ShapePartial",
		"ShapeStyle",
		"Size",
		"Speed",
		"SpreadAngle",
		"Squash",
		"Texture",
		"TimeScale",
		"Transparency",
		"VelocityInheritance",
		"ZOffset"
	},
	Path = {
		"Status"
	},
	PathfindingLink = {
		"Attachment0",
		"Attachment1",
		"IsBidirectional",
		"Label"
	},
	PathfindingModifier = {
		"Label",
		"PassThrough"
	},
	PhysicsSettings = {
		"AllowSleep",
		"AreAnchorsShown",
		"AreAssembliesShown",
		"AreAwakePartsHighlighted",
		"AreBodyTypesShown",
		"AreContactIslandsShown",
		"AreContactPointsShown",
		"AreJointCoordinatesShown",
		"AreMechanismsShown",
		"AreModelCoordsShown",
		"AreOwnersShown",
		"ArePartCoordsShown",
		"AreRegionsShown",
		"AreTerrainReplicationRegionsShown",
		"AreTimestepsShown",
		"AreUnalignedPartsShown",
		"AreWorldCoordsShown",
		"DisableCSGv2",
		"IsInterpolationThrottleShown",
		"IsReceiveAgeShown",
		"IsTreeShown",
		"PhysicsEnvironmentalThrottle",
		"ShowDecompositionGeometry",
		"ThrottleAdjustTime",
		"UseCSGv2"
	},
	PitchShiftSoundEffect = {
		"Octave"
	},
	Player = {
		"AccountAge",
		"AutoJumpEnabled",
		"CameraMaxZoomDistance",
		"CameraMinZoomDistance",
		"CameraMode",
		"CanLoadCharacterAppearance",
		"Character",
		"CharacterAppearanceId",
		"DevCameraOcclusionMode",
		"DevComputerCameraMode",
		"DevComputerMovementMode",
		"DevEnableMouseLock",
		"DevTouchCameraMode",
		"DevTouchMovementMode",
		"DisplayName",
		"FollowUserId",
		"GameplayPaused",
		"HealthDisplayDistance",
		"MembershipType",
		"NameDisplayDistance",
		"Neutral",
		"ReplicationFocus",
		"RespawnLocation",
		"Team",
		"TeamColor",
		"UserId"
	},
	PlayerGui = {
		"CurrentScreenOrientation",
		"ScreenOrientation",
		"SelectionImageObject"
	},
	Players = {
		"BubbleChat",
		"CharacterAutoLoads",
		"ClassicChat",
		"LocalPlayer",
		"MaxPlayers",
		"PreferredPlayers",
		"RespawnTime"
	},
	Plugin = {
		"CollisionEnabled",
		"GridSize"
	},
	PluginAction = {
		"ActionId",
		"AllowBinding",
		"StatusTip",
		"Text"
	},
	PluginDragEvent = {
		"Data",
		"MimeType",
		"Position",
		"Sender"
	},
	PluginGui = {
		"Title"
	},
	PluginMenu = {
		"Icon",
		"Title"
	},
	PluginToolbarButton = {
		"ClickableWhenViewportHidden",
		"Enabled",
		"Icon"
	},
	PointLight = {
		"Range"
	},
	Pose = {
		"CFrame"
	},
	PoseBase = {
		"EasingDirection",
		"EasingStyle",
		"Weight"
	},
	PostEffect = {
		"Enabled"
	},
	ProximityPrompt = {
		"ActionText",
		"AutoLocalize",
		"ClickablePrompt",
		"Enabled",
		"Exclusivity",
		"GamepadKeyCode",
		"HoldDuration",
		"KeyboardKeyCode",
		"MaxActivationDistance",
		"ObjectText",
		"RequiresLineOfSight",
		"RootLocalizationTable",
		"Style",
		"UIOffset"
	},
	ProximityPromptService = {
		"Enabled",
		"MaxPromptsVisible"
	},
	RayValue = {
		"Value"
	},
	ReflectionMetadataClass = {
		"ExplorerImageIndex",
		"ExplorerOrder",
		"Insertable",
		"PreferredParent"
	},
	ReflectionMetadataItem = {
		"Browsable",
		"ClassCategory",
		"ClientOnly",
		"Constraint",
		"Deprecated",
		"EditingDisabled",
		"EditorType",
		"FFlag",
		"IsBackend",
		"PropertyOrder",
		"ScriptContext",
		"ServerOnly",
		"UIMaximum",
		"UIMinimum",
		"UINumTicks"
	},
	RenderSettings = {
		"AutoFRMLevel",
		"EagerBulkExecution",
		"EditQualityLevel",
		"ExportMergeByMaterial",
		"FrameRateManager",
		"GraphicsMode",
		"MeshCacheSize",
		"MeshPartDetailLevel",
		"QualityLevel",
		"ReloadAssets",
		"RenderCSGTrianglesDebug",
		"ShowBoundingBoxes"
	},
	RenderingTest = {
		"CFrame",
		"ComparisonDiffThreshold",
		"ComparisonMethod",
		"ComparisonPsnrThreshold",
		"Description",
		"FieldOfView",
		"Orientation",
		"Position",
		"QualityLevel",
		"ShouldSkip",
		"Ticket"
	},
	ReverbSoundEffect = {
		"DecayTime",
		"Density",
		"Diffusion",
		"DryLevel",
		"WetLevel"
	},
	RigidConstraint = {
		"Broken",
		"DestructionEnabled",
		"DestructionForce",
		"DestructionTorque"
	},
	RocketPropulsion = {
		"CartoonFactor",
		"MaxSpeed",
		"MaxThrust",
		"MaxTorque",
		"Target",
		"TargetOffset",
		"TargetRadius",
		"ThrustD",
		"ThrustP",
		"TurnD",
		"TurnP"
	},
	RodConstraint = {
		"CurrentDistance",
		"Length",
		"LimitAngle0",
		"LimitAngle1",
		"LimitsEnabled",
		"Thickness"
	},
	RopeConstraint = {
		"CurrentDistance",
		"Length",
		"Restitution",
		"Thickness",
		"WinchEnabled",
		"WinchForce",
		"WinchResponsiveness",
		"WinchSpeed",
		"WinchTarget"
	},
	RotationCurve = {
		"Length"
	},
	RunService = {
		"ClientGitHash"
	},
	ScreenGui = {
		"DisplayOrder",
		"IgnoreGuiInset"
	},
	Script = {
		"Source"
	},
	ScriptDebugger = {
		"CurrentLine",
		"IsDebugging",
		"IsPaused",
		"Script"
	},
	ScrollingFrame = {
		"AbsoluteCanvasSize",
		"AbsoluteWindowSize",
		"AutomaticCanvasSize",
		"BottomImage",
		"CanvasPosition",
		"CanvasSize",
		"ElasticBehavior",
		"HorizontalScrollBarInset",
		"MidImage",
		"ScrollBarImageColor3",
		"ScrollBarImageTransparency",
		"ScrollBarThickness",
		"ScrollingDirection",
		"ScrollingEnabled",
		"TopImage",
		"VerticalScrollBarInset",
		"VerticalScrollBarPosition"
	},
	Seat = {
		"Disabled",
		"Occupant"
	},
	Selection = {
		"SelectionThickness"
	},
	SelectionBox = {
		"LineThickness",
		"SurfaceColor3",
		"SurfaceTransparency"
	},
	SelectionLasso = {
		"Humanoid"
	},
	SelectionPartLasso = {
		"Part"
	},
	SelectionPointLasso = {
		"Point"
	},
	SelectionSphere = {
		"SurfaceColor3",
		"SurfaceTransparency"
	},
	ServerScriptService = {
		"LoadStringEnabled"
	},
	Shirt = {
		"ShirtTemplate"
	},
	ShirtGraphic = {
		"Color3",
		"Graphic"
	},
	SkateboardController = {
		"Steer",
		"Throttle"
	},
	SkateboardPlatform = {
		"Controller",
		"ControllingHumanoid",
		"Steer",
		"StickyWheels",
		"Throttle"
	},
	Skin = {
		"SkinColor"
	},
	Sky = {
		"CelestialBodiesShown",
		"MoonAngularSize",
		"MoonTextureId",
		"SkyboxBk",
		"SkyboxDn",
		"SkyboxFt",
		"SkyboxLf",
		"SkyboxRt",
		"SkyboxUp",
		"StarCount",
		"SunAngularSize",
		"SunTextureId"
	},
	SlidingBallConstraint = {
		"ActuatorType",
		"CurrentPosition",
		"LimitsEnabled",
		"LinearResponsiveness",
		"LowerLimit",
		"MotorMaxAcceleration",
		"MotorMaxForce",
		"Restitution",
		"ServoMaxForce",
		"Size",
		"Speed",
		"TargetPosition",
		"UpperLimit",
		"Velocity"
	},
	Smoke = {
		"Color",
		"Enabled",
		"Opacity",
		"RiseVelocity",
		"Size",
		"TimeScale"
	},
	Sound = {
		"ChannelCount",
		"IsLoaded",
		"IsPaused",
		"IsPlaying",
		"Looped",
		"PlayOnRemove",
		"PlaybackLoudness",
		"PlaybackSpeed",
		"Playing",
		"RollOffMaxDistance",
		"RollOffMinDistance",
		"RollOffMode",
		"SoundGroup",
		"SoundId",
		"TimeLength",
		"TimePosition",
		"Volume"
	},
	SoundEffect = {
		"Enabled",
		"Priority"
	},
	SoundGroup = {
		"Volume"
	},
	SoundService = {
		"AmbientReverb",
		"DistanceFactor",
		"DopplerScale",
		"RespectFilteringEnabled",
		"RolloffScale"
	},
	Sparkles = {
		"Enabled",
		"SparkleColor",
		"TimeScale"
	},
	SpawnLocation = {
		"AllowTeamChangeOnTouch",
		"Duration",
		"Enabled",
		"Neutral",
		"TeamColor"
	},
	Speaker = {
		"ChannelCount",
		"PlaybackLoudness",
		"RollOffMaxDistance",
		"RollOffMinDistance",
		"RollOffMode",
		"SoundGroup",
		"Source",
		"Volume"
	},
	SpecialMesh = {
		"MeshType"
	},
	SphereHandleAdornment = {
		"Radius"
	},
	SpotLight = {
		"Angle",
		"Face",
		"Range"
	},
	SpringConstraint = {
		"Coils",
		"CurrentLength",
		"Damping",
		"FreeLength",
		"LimitsEnabled",
		"MaxForce",
		"MaxLength",
		"MinLength",
		"Radius",
		"Stiffness",
		"Thickness"
	},
	StarterGui = {
		"ScreenOrientation",
		"ShowDevelopmentGui",
		"VirtualCursorMode"
	},
	StarterPlayer = {
		"AutoJumpEnabled",
		"CameraMaxZoomDistance",
		"CameraMinZoomDistance",
		"CameraMode",
		"CharacterJumpHeight",
		"CharacterJumpPower",
		"CharacterMaxSlopeAngle",
		"CharacterUseJumpPower",
		"CharacterWalkSpeed",
		"DevCameraOcclusionMode",
		"DevComputerCameraMovementMode",
		"DevComputerMovementMode",
		"DevTouchCameraMovementMode",
		"DevTouchMovementMode",
		"EnableMouseLockOption",
		"HealthDisplayDistance",
		"LoadCharacterAppearance",
		"NameDisplayDistance",
		"UserEmotesEnabled"
	},
	Stats = {
		"ContactsCount",
		"DataReceiveKbps",
		"DataSendKbps",
		"HeartbeatTimeMs",
		"InstanceCount",
		"MovingPrimitivesCount",
		"PhysicsReceiveKbps",
		"PhysicsSendKbps",
		"PhysicsStepTimeMs",
		"PrimitivesCount"
	},
	StringValue = {
		"Value"
	},
	Studio = {
		"CommandBarLocalState",
		"DefaultScriptFileDir",
		"DeprecatedObjectsShown",
		"DisplayLanguage",
		"Font",
		"LocalAssetsFolder",
		"LuaDebuggerEnabled",
		"OverrideCoreScripts",
		"OverrideCoreScriptsDir",
		"PermissionLevelShown",
		"PluginDebuggingEnabled",
		"PluginsDir",
		"Rulers",
		"RuntimeUndoBehavior",
		"ScriptTimeoutLength",
		"ShowCorePackagesInExplorer",
		"Theme"
	},
	StudioService = {
		"ActiveScript",
		"DraggerSolveConstraints",
		"DrawConstraintsOnTop",
		"GridSize",
		"RotateIncrement",
		"ShowConstraintDetails",
		"StudioLocaleId",
		"UseLocalSpace"
	},
	SunRaysEffect = {
		"Intensity",
		"Spread"
	},
	SurfaceAppearance = {
		"AlphaMode",
		"ColorMap",
		"MetalnessMap",
		"NormalMap",
		"RoughnessMap"
	},
	SurfaceGui = {
		"Active",
		"Adornee",
		"AlwaysOnTop",
		"Brightness",
		"CanvasSize",
		"ClipsDescendants",
		"Face",
		"LightInfluence",
		"PixelsPerStud",
		"SizingMode",
		"ToolPunchThroughDistance",
		"ZOffset"
	},
	SurfaceLight = {
		"Angle",
		"Face",
		"Range"
	},
	SurfaceSelection = {
		"TargetSurface"
	},
	TaskScheduler = {
		"SchedulerDutyCycle",
		"SchedulerRate",
		"ThreadPoolConfig",
		"ThreadPoolSize"
	},
	Team = {
		"AutoAssignable",
		"TeamColor"
	},
	TeleportAsyncResult = {
		--"PrivateServerId",
		"ReservedServerAccessCode"
	},
	TeleportOptions = {
		"ReservedServerAccessCode",
		"ServerInstanceId",
		"ShouldReserveServer"
	},
	Terrain = {
		"Decoration",
		"MaterialColors",
		"MaxExtents",
		"WaterColor",
		"WaterReflectance",
		"WaterTransparency",
		"WaterWaveSize",
		"WaterWaveSpeed"
	},
	TerrainDetail = {
		"ColorMap",
		"Face",
		"MaterialPattern",
		"MetalnessMap",
		"NormalMap",
		"RoughnessMap",
		"StudsPerTile"
	},
	TerrainRegion = {
		"SizeInCells"
	},
	TestService = {
		"AutoRuns",
		"Description",
		"ErrorCount",
		"ExecuteWithStudioRun",
		"Is30FpsThrottleEnabled",
		"IsPhysicsEnvironmentalThrottled",
		"IsSleepAllowed",
		"NumberOfPlayers",
		"SimulateSecondsLag",
		"TestCount",
		"Timeout",
		"WarnCount"
	},
	TextBox = {
		"ClearTextOnFocus",
		"ContentText",
		"CursorPosition",
		"Font",
		"FontFace",
		"LineHeight",
		"MaxVisibleGraphemes",
		"MultiLine",
		"PlaceholderColor3",
		"PlaceholderText",
		"RichText",
		"SelectionStart",
		"ShowNativeInput",
		"Text",
		"TextBounds",
		"TextColor3",
		"TextEditable",
		"TextFits",
		"TextScaled",
		"TextSize",
		"TextStrokeColor3",
		"TextStrokeTransparency",
		"TextTransparency",
		"TextTruncate",
		"TextWrapped",
		"TextXAlignment",
		"TextYAlignment"
	},
	TextButton = {
		"ContentText",
		"Font",
		"FontFace",
		"LineHeight",
		"MaxVisibleGraphemes",
		"RichText",
		"Text",
		"TextBounds",
		"TextColor3",
		"TextFits",
		"TextScaled",
		"TextSize",
		"TextStrokeColor3",
		"TextStrokeTransparency",
		"TextTransparency",
		"TextTruncate",
		"TextWrapped",
		"TextXAlignment",
		"TextYAlignment"
	},
	TextChatCommand = {
		"Enabled",
		"PrimaryAlias",
		"SecondaryAlias"
	},
	TextChatMessage = {
		"MessageId",
		"Metadata",
		"PrefixText",
		"Status",
		"Text",
		"TextChannel",
		"TextSource",
		"Timestamp"
	},
	TextChatMessageProperties = {
		"PrefixText",
		"Text"
	},
	TextChatService = {
		"ChatVersion",
		"CreateDefaultCommands",
		"CreateDefaultTextChannels"
	},
	TextLabel = {
		"ContentText",
		"Font",
		"FontFace",
		"LineHeight",
		"MaxVisibleGraphemes",
		"RichText",
		"Text",
		"TextBounds",
		"TextColor3",
		"TextFits",
		"TextScaled",
		"TextSize",
		"TextStrokeColor3",
		"TextStrokeTransparency",
		"TextTransparency",
		"TextTruncate",
		"TextWrapped",
		"TextXAlignment",
		"TextYAlignment"
	},
	TextSource = {
		"CanSend",
		"UserId"
	},
	Texture = {
		"OffsetStudsU",
		"OffsetStudsV",
		"StudsPerTileU",
		"StudsPerTileV"
	},
	Tool = {
		"CanBeDropped",
		"Enabled",
		"Grip",
		"GripForward",
		"GripPos",
		"GripRight",
		"GripUp",
		"ManualActivationOnly",
		"RequiresHandle",
		"ToolTip"
	},
	Torque = {
		"RelativeTo",
		"Torque"
	},
	TorsionSpringConstraint = {
		"Coils",
		"CurrentAngle",
		"Damping",
		"LimitsEnabled",
		"MaxAngle",
		"MaxTorque",
		"Radius",
		"Restitution",
		"Stiffness"
	},
	Trail = {
		"Attachment0",
		"Attachment1",
		"Brightness",
		"Color",
		"Enabled",
		"FaceCamera",
		"Lifetime",
		"LightEmission",
		"LightInfluence",
		"MaxLength",
		"MinLength",
		"Texture",
		"TextureLength",
		"TextureMode",
		"Transparency",
		"WidthScale"
	},
	Translator = {
		"LocaleId"
	},
	TremoloSoundEffect = {
		"Depth",
		"Duty",
		"Frequency"
	},
	TriangleMeshPart = {
		"CollisionFidelity"
	},
	TrussPart = {
		"Style"
	},
	Tween = {
		"Instance",
		"TweenInfo"
	},
	TweenBase = {
		"PlaybackState"
	},
	UIAspectRatioConstraint = {
		"AspectRatio",
		"AspectType",
		"DominantAxis"
	},
	UICorner = {
		"CornerRadius"
	},
	UIGradient = {
		"Color",
		"Enabled",
		"Offset",
		"Rotation",
		"Transparency"
	},
	UIGridLayout = {
		"AbsoluteCellCount",
		"AbsoluteCellSize",
		"CellPadding",
		"CellSize",
		"FillDirectionMaxCells",
		"StartCorner"
	},
	UIGridStyleLayout = {
		"AbsoluteContentSize",
		"FillDirection",
		"HorizontalAlignment",
		"SortOrder",
		"VerticalAlignment"
	},
	UIListLayout = {
		"Padding"
	},
	UIPadding = {
		"PaddingBottom",
		"PaddingLeft",
		"PaddingRight",
		"PaddingTop"
	},
	UIPageLayout = {
		"Animated",
		"Circular",
		"CurrentPage",
		"EasingDirection",
		"EasingStyle",
		"GamepadInputEnabled",
		"Padding",
		"ScrollWheelInputEnabled",
		"TouchInputEnabled",
		"TweenTime"
	},
	UIScale = {
		"Scale"
	},
	UISizeConstraint = {
		"MaxSize",
		"MinSize"
	},
	UIStroke = {
		"ApplyStrokeMode",
		"Color",
		"Enabled",
		"LineJoinMode",
		"Thickness",
		"Transparency"
	},
	UITableLayout = {
		"FillEmptySpaceColumns",
		"FillEmptySpaceRows",
		"MajorAxis",
		"Padding"
	},
	UITextSizeConstraint = {
		"MaxTextSize",
		"MinTextSize"
	},
	UniversalConstraint = {
		"LimitsEnabled",
		"MaxAngle",
		"Radius",
		"Restitution"
	},
	UserGameSettings = {
		"AllTutorialsDisabled",
		"CameraMode",
		"ChatVisible",
		"ComputerCameraMovementMode",
		"ComputerMovementMode",
		"ControlMode",
		"Fullscreen",
		"GamepadCameraSensitivity",
		"GraphicsQualityLevel",
		"HasEverUsedVR",
		"MasterVolume",
		"MouseSensitivity",
		"OnboardingsCompleted",
		"RCCProfilerRecordFrameRate",
		"RCCProfilerRecordTimeFrame",
		"RotationType",
		"SavedQualityLevel",
		"StartMaximized",
		"StartScreenPosition",
		"StartScreenSize",
		"TouchCameraMovementMode",
		"TouchMovementMode",
		"UsedCoreGuiIsVisibleToggle",
		"UsedCustomGuiIsVisibleToggle",
		"UsedHideHudShortcut",
		"VREnabled",
		"VRRotationIntensity",
		"VignetteEnabled"
	},
	UserInputService = {
		"AccelerometerEnabled",
		"GamepadEnabled",
		"GyroscopeEnabled",
		"KeyboardEnabled",
		"MouseBehavior",
		"MouseDeltaSensitivity",
		"MouseEnabled",
		"MouseIconEnabled",
		"OnScreenKeyboardPosition",
		"OnScreenKeyboardSize",
		"OnScreenKeyboardVisible",
		"TouchEnabled",
		"VREnabled"
	},
	VRService = {
		"GuiInputUserCFrame",
		"VREnabled"
	},
	Vector3Value = {
		"Value"
	},
	VectorForce = {
		"ApplyAtCenterOfMass",
		"Force",
		"RelativeTo"
	},
	VehicleSeat = {
		"AreHingesDetected",
		"Disabled",
		"HeadsUpDisplay",
		"MaxSpeed",
		"Occupant",
		"Steer",
		"SteerFloat",
		"Throttle",
		"ThrottleFloat",
		"Torque",
		"TurnSpeed"
	},
	VelocityMotor = {
		"CurrentAngle",
		"DesiredAngle",
		"Hole",
		"MaxVelocity"
	},
	VideoFrame = {
		"IsLoaded",
		"Looped",
		"Playing",
		"Resolution",
		"TimeLength",
		"TimePosition",
		"Video",
		"Volume"
	},
	ViewportFrame = {
		"Ambient",
		"CurrentCamera",
		"ImageColor3",
		"ImageTransparency",
		"LightColor",
		"LightDirection"
	},
	VoiceChatService = {
		"EnableDefaultVoice"
	},
	VoiceSource = {
		"UserId"
	},
	WeldConstraint = {
		"Active",
		"Enabled",
		"Part0",
		"Part1"
	},
	Workspace = {
		"AllowThirdPartySales",
		"AnimationWeightedBlendFix",
		"ClientAnimatorThrottling",
		"CurrentCamera",
		"DistributedGameTime",
		"FallenPartsDestroyHeight",
		"GlobalWind",
		"Gravity",
		"HumanoidOnlySetCollisionsOnStateChange",
		"InterpolationThrottling",
		"MeshPartHeadsAndAccessories",
		"PhysicsSteppingMethod",
		"ReplicateInstanceDestroySetting",
		"Retargeting",
		"SignalBehavior",
		"StreamOutBehavior",
		"StreamingEnabled",
		"StreamingMinRadius",
		"StreamingPauseMode",
		"StreamingTargetRadius",
		"Terrain",
		"TouchesUseCollisionGroups"
	},
	WrapLayer = {
		"BindOffset",
		"Color",
		"DebugMode",
		"Enabled",
		"Order",
		"Puffiness",
		"ReferenceMeshId",
		"ReferenceOrigin",
		"ReferenceOriginWorld",
		"ShrinkFactor"
	},
	WrapTarget = {
		"Color",
		"DebugMode",
		"Stiffness"
	}
}

-- Core functionality
local function getInstanceFromPath(path)
    local current = game
    for part in path:gmatch("[^%.]+") do
        if part ~= "game" then
            current = current:FindFirstChild(part)
            if not current then return nil end
        end
    end
    return current
end

local function extractProperties(instance)
    local class_name = instance.ClassName
    local to_extract = properties_tbl[class_name] or {}
    
    local data = {}
    for _, prop_name in ipairs(to_extract) do
        data[prop_name] = instance[prop_name]
    end
    return data
end

local function applyProperties(instance, properties)
    for prop, value in pairs(properties) do
        pcall(function()
            instance[prop] = value
        end)
    end
end

local function buildTree(instance)
    local tree = {
        class_name = instance.ClassName,
        name = instance.Name,
        properties = extractProperties(instance),
        children = {},
    }

    for _, child in ipairs(instance:GetChildren()) do
        table.insert(tree.children, buildTree(child))
    end

    return tree
end

local function writeTreeIntoInstance(parent, tree)
    local instance = Instance.new(tree.class_name)
    instance.Name = tree.name
    applyProperties(instance, tree.properties)
    
    for _, childTree in ipairs(tree.children) do
        writeTreeIntoInstance(instance, childTree)
    end
    
    instance.Parent = parent
    return instance
end

-- Button actions
cloneButton.MouseButton1Click:Connect(function()
    local path = pathToCloneBox.Text
    if path == "" then return end
    
    local instance = getInstanceFromPath(path)
    if instance then
        local tree = buildTree(instance)
        buildPathBox.Text = path

        -- ✅ FIX HERE: avoid focus issues before setting text
        UserInputService:SetFocusedTextBox(nil)
        task.defer(function()
            pathToCloneBox.Text = HttpService:JSONEncode(tree)
        end)

        setclipboard(tostring(tree))
    else
        warn("Path not correct: cannot find instance to clone")
    end
end)

buildButton.MouseButton1Click:Connect(function()
    local buildPath = buildPathBox.Text
    if buildPath == "" then return end
    
    local instance = getInstanceFromPath(buildPath)
    if not instance then
        warn("Build path not correct: instance not found")
        return
    end

    local success, tree = pcall(function()
        return HttpService:JSONDecode(pathToCloneBox.Text)
    end)

    if success and tree then
        writeTreeIntoInstance(instance, tree)
    else
        warn("Failed to decode tree JSON")
    end
end)

-- Simple draggable window
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

title.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

title.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
