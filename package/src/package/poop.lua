--!nocheck
--!nolint

local HttpService = game:GetService("HttpService")

local targetting_paths = {
	"ReplicatedStorage",
}

local m_Properties = {
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

local function get_instance(path)
	local current = game
	for part in path:gmatch("[^%.]+") do
		current = current and current:FindFirstChild(part)
	end
	return current
end

local function format_value(value)
	local typeOfValue = typeof(value)

	if typeOfValue == "CFrame" then
		local x, y, z = value:GetComponents()
		return string.format("CFrame.new(%s, %s, %s)", x, y, z)
	elseif typeOfValue == "Vector3" then
		return string.format("Vector3.new(%s, %s, %s)", value.X, value.Y, value.Z)
	elseif typeOfValue == "Vector2" then
		return string.format("Vector2.new(%s, %s)", value.X, value.Y)
	elseif typeOfValue == "Color3" then
		return string.format("Color3.new(%s, %s, %s)", value.R, value.G, value.B)
	elseif typeOfValue == "UDim" then
		return string.format("UDim.new(%s, %s)", value.Scale, value.Offset)
	elseif typeOfValue == "UDim2" then
		return string.format("UDim2.new(%s, %s, %s, %s)", 
			value.X.Scale, value.X.Offset, 
			value.Y.Scale, value.Y.Offset)
	elseif typeOfValue == "BrickColor" then
		return string.format("BrickColor.new(%s)", tostring(value))
	elseif typeOfValue == "NumberSequence" then
		local points = {}
		for _, point in ipairs(value.Keypoints) do
			table.insert(points, string.format("%s, %s", point.Time, point.Value))
		end
		return string.format("NumberSequence.new(%s)", table.concat(points, ", "))
	elseif typeOfValue == "ColorSequence" then
		local points = {}
		for _, point in ipairs(value.Keypoints) do
			table.insert(points, string.format("%s, Color3.new(%s, %s, %s)", 
				point.Time, point.Value.R, point.Value.G, point.Value.B))
		end
		return string.format("ColorSequence.new(%s)", table.concat(points, ", "))
	elseif typeOfValue == "Rect" then
		return string.format("Rect.new(%s, %s, %s, %s)", 
			value.Min.X, value.Min.Y, 
			value.Max.X, value.Max.Y)
	elseif typeOfValue == "Ray" then
		return string.format("Ray.new(Vector3.new(%s, %s, %s), Vector3.new(%s, %s, %s))", 
			value.Origin.X, value.Origin.Y, value.Origin.Z,
			value.Direction.X, value.Direction.Y, value.Direction.Z)
	elseif typeOfValue == "NumberRange" then
		return string.format("NumberRange.new(%s, %s)", value.Min, value.Max)
	elseif typeOfValue == "Faces" then
		local faces = {}
		-- Check all possible NormalId directions
		local directions = {"Top", "Bottom", "Left", "Right", "Front", "Back"}
		for _, dir in ipairs(directions) do
			if value[dir] then
				table.insert(faces, string.format("%s", dir))
			end
		end
		return string.format("Faces.new(%s)", table.concat(faces, ", "))
	elseif typeOfValue == "Region3" then
		return string.format("Region3.new(Vector3.new(%s, %s, %s), Vector3.new(%s, %s, %s))", 
			value.CFrame.Position.X, value.CFrame.Position.Y, value.CFrame.Position.Z,
			value.Size.X, value.Size.Y, value.Size.Z)
	elseif typeOfValue == "Region3int16" then
		return string.format("Region3int16.new(Vector3int16.new(%s, %s, %s), Vector3int16.new(%s, %s, %s))", 
			value.Min.X, value.Min.Y, value.Min.Z,
			value.Max.X, value.Max.Y, value.Max.Z)
	elseif typeOfValue == "EnumItem" then
		return tostring(value) -- Returns "Enum.Material.Plastic" etc.
	elseif typeOfValue == "Instance" then
		-- string.format("Instance.new(%s)", value.ClassName)
		return string.format("%s", value.ClassName)
	else
		return tostring(value) -- Fallback for other types
	end
end

local function get_properties(instance, property_list)
	local props = {}
	for class, properties in pairs(property_list) do
		if instance:IsA(class) then
			for _, prop in ipairs(properties) do
				local success, value = pcall(function() 
					return instance[prop] 
				end)
				if success then
					props[prop] = format_value(value)
				else
					props[prop] = nil
				end
			end
		end
	end
	return props
end

local function create_tree(instance)
	local tree = {
		class_name = instance.ClassName,
		name = instance.Name,
		properties = get_properties(instance, m_Properties),
		children = {}
	}

	for _, child in ipairs(instance:GetChildren()) do
		table.insert(tree.children, create_tree(child))
	end

	return tree
end

local trees = {}
for _, path in ipairs(targetting_paths) do
	local instance = get_instance(path)
	if instance then
		trees[path] = create_tree(instance)
	end
end

--local function overwrite_place(trees)
--	for path, tree in pairs(trees) do
--		local the_service = game:GetService(tree.class_name)
--		if the_service then
--			for prop, value in next, tree.properties do
--				local success, err = pcall(function()
--					the_service[prop] = value
--				end)
--			end

--			local function process_children(parent_instance, children)
--				for _, child in ipairs(children) do
--					local child_instance = parent_instance:FindFirstChild(child.name)
--					if not child_instance then
--						child_instance = Instance.new(child.class_name)
--						child_instance.Name = child.name
--						child_instance.Parent = parent_instance
--					end

--					for prop, value in next, child.properties do
--						local success, err = pcall(function()
--							child_instance[prop] = value
--						end)
--					end

--					if next(child.children) then
--						process_children(child_instance, child.children)
--					end
--				end
--			end

--			process_children(the_service, tree.children)
--		end
--	end
--end
----------------------------------
local defaultSettings = {
	pretty = false;
	robloxFullName = false;
	robloxProperFullName = true;
	robloxClassName = true;
	tabs = false;
	semicolons = false;
	spaces = 3;
	sortKeys = true;
}

-- lua keywords
local keywords = {["and"]=true, ["break"]=true, ["do"]=true, ["else"]=true,
	["elseif"]=true, ["end"]=true, ["false"]=true, ["for"]=true, ["function"]=true,
	["if"]=true, ["in"]=true, ["local"]=true, ["nil"]=true, ["not"]=true, ["or"]=true,
	["repeat"]=true, ["return"]=true, ["then"]=true, ["true"]=true, ["until"]=true, ["while"]=true}

local function isLuaIdentifier(str)
	if type(str) ~= "string" then return false end
	-- must be nonempty
	if str:len() == 0 then return false end
	-- can only contain a-z, A-Z, 0-9 and underscore
	if str:find("[^%d%a_]") then return false end
	-- cannot begin with digit
	if tonumber(str:sub(1, 1)) then return false end
	-- cannot be keyword
	if keywords[str] then return false end
	return true
end

-- works like Instance:GetFullName(), but invalid Lua identifiers are fixed (e.g. workspace["The Dude"].Humanoid)
local function properFullName(object, usePeriod)
	if object == nil or object == game then return "" end

	local s = object.Name
	local usePeriod = true
	if not isLuaIdentifier(s) then
		s = ("[%q]"):format(s)
		usePeriod = false
	end

	if not object.Parent or object.Parent == game then
		return s
	else
		return properFullName(object.Parent) .. (usePeriod and "." or "") .. s 
	end
end

local depth = 0
local shown
local INDENT
local reprSettings
local rep = {}

function rep.repr(value, reprSettings)
	reprSettings = reprSettings or defaultSettings
	INDENT = (" "):rep(reprSettings.spaces or defaultSettings.spaces)
	if reprSettings.tabs then
		INDENT = "\t"
	end

	local v = value --args[1]
	local tabs = INDENT:rep(depth)

	if depth == 0 then
		shown = {}
	end
	if type(v) == "string" then
		return ("%q"):format(v)
	elseif type(v) == "number" then
		if v == math.huge then return "math.huge" end
		if v == -math.huge then return "-math.huge" end
		return tonumber(v)
	elseif type(v) == "boolean" then
		return tostring(v)
	elseif type(v) == "nil" then
		return "nil"
	elseif type(v) == "table" and type(v.__tostring) == "function" then
		return tostring(v.__tostring(v))
	elseif type(v) == "table" and getmetatable(v) and type(getmetatable(v).__tostring) == "function" then
		return tostring(getmetatable(v).__tostring(v))
	elseif type(v) == "table" then
		if shown[v] then return "{CYCLIC}" end
		shown[v] = true
		local str = "{" .. (reprSettings.pretty and ("\n" .. INDENT .. tabs) or "")
		local isArray = true
		for k, v in pairs(v) do
			if type(k) ~= "number" then
				isArray = false
				break
			end
		end
		if isArray then
			for i = 1, #v do
				if i ~= 1 then
					str = str .. (reprSettings.semicolons and ";" or ",") .. (reprSettings.pretty and ("\n" .. INDENT .. tabs) or " ")
				end
				depth = depth + 1
				str = str .. rep.repr(v[i], reprSettings)
				depth = depth - 1
			end
		else
			local keyOrder = {}
			local keyValueStrings = {}
			for k, v in pairs(v) do
				depth = depth + 1
				local kStr = isLuaIdentifier(k) and k or ("[" .. rep.repr(k, reprSettings) .. "]")
				local vStr = rep.repr(v, reprSettings)
				--[[str = str .. ("%s = %s"):format(
					isLuaIdentifier(k) and k or ("[" .. repr(k, reprSettings) .. "]"),
					repr(v, reprSettings)
				)]]
				table.insert(keyOrder, kStr)
				keyValueStrings[kStr] = vStr
				depth = depth - 1
			end
			if reprSettings.sortKeys then table.sort(keyOrder) end
			local first = true
			for _, kStr in pairs(keyOrder) do
				if not first then
					str = str .. (reprSettings.semicolons and ";" or ",") .. (reprSettings.pretty and ("\n" .. INDENT .. tabs) or " ")
				end
				str = str .. ("%s = %s"):format(kStr, keyValueStrings[kStr])
				first = false
			end
		end
		shown[v] = false
		if reprSettings.pretty then
			str = str .. "\n" .. tabs
		end
		str = str .. "}"
		return str
	elseif typeof then
		-- Check Roblox types
		if typeof(v) == "Instance" then
			return  (reprSettings.robloxFullName
				and (reprSettings.robloxProperFullName and properFullName(v) or v:GetFullName())
				or v.Name) .. (reprSettings.robloxClassName and ((" (%s)"):format(v.ClassName)) or "")
		elseif typeof(v) == "Axes" then
			local s = {}
			if v.X then table.insert(s, rep.repr(Enum.Axis.X, reprSettings)) end
			if v.Y then table.insert(s, rep.repr(Enum.Axis.Y, reprSettings)) end
			if v.Z then table.insert(s, rep.repr(Enum.Axis.Z, reprSettings)) end
			return ("Axes.new(%s)"):format(table.concat(s, ", "))
		elseif typeof(v) == "BrickColor" then
			return ("BrickColor.new(%q)"):format(v.Name)
		elseif typeof(v) == "CFrame" then
			return ("CFrame.new(%s)"):format(table.concat({v:GetComponents()}, ", "))
		elseif typeof(v) == "Color3" then
			return ("Color3.new(%d, %d, %d)"):format(v.r, v.g, v.b)
		elseif typeof(v) == "ColorSequence" then
			if #v.Keypoints > 2 then
				return ("ColorSequence.new(%s)"):format(rep.repr(v.Keypoints, reprSettings))
			else
				if v.Keypoints[1].Value == v.Keypoints[2].Value then
					return ("ColorSequence.new(%s)"):format(rep.repr(v.Keypoints[1].Value, reprSettings))
				else
					return ("ColorSequence.new(%s, %s)"):format(
						rep.repr(v.Keypoints[1].Value, reprSettings),
						rep.repr(v.Keypoints[2].Value, reprSettings)
					)
				end
			end
		elseif typeof(v) == "ColorSequenceKeypoint" then
			return ("ColorSequenceKeypoint.new(%d, %s)"):format(v.Time, rep.repr(v.Value, reprSettings))
		elseif typeof(v) == "DockWidgetPluginGuiInfo" then
			return ("DockWidgetPluginGuiInfo.new(%s, %s, %s, %s, %s, %s, %s)"):format(
				rep.repr(v.InitialDockState, reprSettings),
				rep.repr(v.InitialEnabled, reprSettings),
				rep.repr(v.InitialEnabledShouldOverrideRestore, reprSettings),
				rep.repr(v.FloatingXSize, reprSettings),
				rep.repr(v.FloatingYSize, reprSettings),
				rep.repr(v.MinWidth, reprSettings),
				rep.repr(v.MinHeight, reprSettings)
			)
		elseif typeof(v) == "Enums" then
			return "Enums"
		elseif typeof(v) == "Enum" then
			return ("Enum.%s"):format(tostring(v))
		elseif typeof(v) == "EnumItem" then
			return ("Enum.%s.%s"):format(tostring(v.EnumType), v.Name)
		elseif typeof(v) == "Faces" then
			local s = {}
			for _, enumItem in pairs(Enum.NormalId:GetEnumItems()) do
				if v[enumItem.Name] then
					table.insert(s, rep.repr(enumItem, reprSettings))
				end
			end
			return ("Faces.new(%s)"):format(table.concat(s, ", "))
		elseif typeof(v) == "NumberRange" then
			if v.Min == v.Max then
				return ("NumberRange.new(%d)"):format(v.Min)
			else
				return ("NumberRange.new(%d, %d)"):format(v.Min, v.Max)
			end
		elseif typeof(v) == "NumberSequence" then
			if #v.Keypoints > 2 then
				return ("NumberSequence.new(%s)"):format(rep.repr(v.Keypoints, reprSettings))
			else
				if v.Keypoints[1].Value == v.Keypoints[2].Value then
					return ("NumberSequence.new(%d)"):format(v.Keypoints[1].Value)
				else
					return ("NumberSequence.new(%d, %d)"):format(v.Keypoints[1].Value, v.Keypoints[2].Value)
				end
			end
		elseif typeof(v) == "NumberSequenceKeypoint" then
			if v.Envelope ~= 0 then
				return ("NumberSequenceKeypoint.new(%d, %d, %d)"):format(v.Time, v.Value, v.Envelope)
			else
				return ("NumberSequenceKeypoint.new(%d, %d)"):format(v.Time, v.Value)
			end
		elseif typeof(v) == "PathWaypoint" then
			return ("PathWaypoint.new(%s, %s)"):format(
				rep.repr(v.Position, reprSettings),
				rep.repr(v.Action, reprSettings)
			)
		elseif typeof(v) == "PhysicalProperties" then
			return ("PhysicalProperties.new(%d, %d, %d, %d, %d)"):format(
				v.Density, v.Friction, v.Elasticity, v.FrictionWeight, v.ElasticityWeight
			)
		elseif typeof(v) == "Random" then
			return "<Random>"
		elseif typeof(v) == "Ray" then
			return ("Ray.new(%s, %s)"):format(
				rep.repr(v.Origin, reprSettings),
				rep.repr(v.Direction, reprSettings)
			)
		elseif typeof(v) == "RBXScriptConnection" then
			return "<RBXScriptConnection>"
		elseif typeof(v) == "RBXScriptSignal" then
			return "<RBXScriptSignal>"
		elseif typeof(v) == "Rect" then
			return ("Rect.new(%d, %d, %d, %d)"):format(
				v.Min.X, v.Min.Y, v.Max.X, v.Max.Y
			)
		elseif typeof(v) == "Region3" then
			local min = v.CFrame.p + v.Size * -.5
			local max = v.CFrame.p + v.Size * .5
			return ("Region3.new(%s, %s)"):format(
				rep.repr(min, reprSettings),
				rep.repr(max, reprSettings)
			)
		elseif typeof(v) == "Region3int16" then
			return ("Region3int16.new(%s, %s)"):format(
				rep.repr(v.Min, reprSettings),
				repr(v.Max, reprSettings)
			)
		elseif typeof(v) == "TweenInfo" then
			return ("TweenInfo.new(%d, %s, %s, %d, %s, %d)"):format(
				v.Time, rep.repr(v.EasingStyle, reprSettings), rep.repr(v.EasingDirection, reprSettings),
				v.RepeatCount, rep.repr(v.Reverses, reprSettings), v.DelayTime
			)
		elseif typeof(v) == "UDim" then
			return ("UDim.new(%d, %d)"):format(
				v.Scale, v.Offset
			)
		elseif typeof(v) == "UDim2" then
			return ("UDim2.new(%d, %d, %d, %d)"):format(
				v.X.Scale, v.X.Offset, v.Y.Scale, v.Y.Offset
			)
		elseif typeof(v) == "Vector2" then
			return ("Vector2.new(%d, %d)"):format(v.X, v.Y)
		elseif typeof(v) == "Vector2int16" then
			return ("Vector2int16.new(%d, %d)"):format(v.X, v.Y)
		elseif typeof(v) == "Vector3" then
			return ("Vector3.new(%d, %d, %d)"):format(v.X, v.Y, v.Z)
		elseif typeof(v) == "Vector3int16" then
			return ("Vector3int16.new(%d, %d, %d)"):format(v.X, v.Y, v.Z)
		elseif typeof(v) == "DateTime" then
			return ("DateTime.fromIsoDate(%q)"):format(v:ToIsoDate())
		else
			return "<Roblox:" .. typeof(v) .. ">"
		end
	else
		return "<" .. type(v) .. ">"
	end
end
-------------------

local str = rep.repr(trees)

local tb = Instance.new("TextBox")
tb.ClearTextOnFocus = false
tb.Text = str
tb.Size = UDim2.fromOffset(50, 50)
tb.Position = UDim2.fromScale(0.5, 0.5)
tb.AnchorPoint = Vector2.new(0.5, 0.5)
local sg = Instance.new("ScreenGui")
sg.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
tb.Parent = sg
sg.ZIndexBehavior = Enum.ZIndexBehavior.Global
tb.ZIndex = math.huge
