repeat wait() until game:IsLoaded()

pcall(function()
    repeat wait() until game.Players.LocalPlayer.Character
    repeat wait() until game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
end)

local part = Instance.new("Part", workspace)
part.Name = "WinterThemeSnowPart"
part.Size = Vector3.new(1000, 0, 1000)
part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0)
part.Anchored = true
part.CanCollide = false
part.Transparency = 1

spawn(function()
    while true do
        wait(5)
        part.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0, 50, 0)
    end
end)

local ParticleEmitter = Instance.new("ParticleEmitter", part)
ParticleEmitter.LightInfluence = 0
ParticleEmitter.Texture = "rbxassetid://118641183"
ParticleEmitter.Lifetime = NumberRange.new(200, 200)
ParticleEmitter.EmissionDirection = Enum.NormalId.Bottom
ParticleEmitter.Rate = 250

local Lighting = game.Lighting
sethiddenproperty(game.Lighting,"Technology",Enum.Technology.Future)
Lighting["ColorShift_Top"] = Color3.fromRGB(175, 221, 225)
Lighting.Brightness = 0.5
Lighting.ShadowSoftness = 0.08
Lighting.OutdoorAmbient = Color3.fromRGB(0,0,0)
Lighting.TimeOfDay = "07:00:00"
Lighting.EnvironmentDiffuseScale = 0.5
Lighting.EnvironmentSpecularScale = 0.5
Lighting.ExposureCompensation = 0.1

local Atmosphere = Instance.new("Atmosphere", Lighting)
Atmosphere.Name = "WinterThemeAtmosphere"
Atmosphere.Color = Color3.fromRGB(255, 255, 255)
Atmosphere.Decay = Color3.fromRGB(255, 255, 255)
Atmosphere.Haze = 2.16
Atmosphere.Glare = 0.1
Atmosphere.Density = 0.4

if workspace:FindFirstChild("Terrain") then
    local Terrain = workspace.Terrain
    sethiddenproperty(Terrain, "Decoration", true)
    Terrain:SetMaterialColor(Enum.Material.Grass, Color3.fromRGB(255, 255, 255))
end

if Lighting:FindFirstChildWhichIsA("Sky") then
    local Sky = Lighting.Sky
    Sky.SunAngularSize = 8
end

if Lighting:FindFirstChildWhichIsA("BloomEffect") then
    local Bloom = Lighting.Bloom
    Bloom.Intensity = 0.1
    Bloom.Size = 24
    Bloom.Threshold = 2
else
    local Bloom = Instance.new("BloomEffect", Lighting)
    Bloom.Name = "WinterThemeBloom"
    Bloom.Intensity = 0.1
    Bloom.Size = 24
    Bloom.Threshold = 2
end

if Lighting:FindFirstChildWhichIsA("SunRaysEffect") then
    local SunRays = Lighting.SunRays
    SunRays.Intensity = 0.01
    SunRays.Spread = 0.1
else
    local SunRays = Instance.new("SunRaysEffect", Lighting)
    SunRays.Name = "WinterThemeSunRays"
    SunRays.Intensity = 0.01
    SunRays.Spread = 0.1
end

if Lighting:FindFirstChildWhichIsA("ColorCorrectionEffect") then
    local ColorCorrection = Lighting.ColorCorrection
else
    local ColorCorrection = Instance.new("ColorCorrectionEffect", Lighting)
    ColorCorrection.Name = "WinterThemeColorCorrection"
end

