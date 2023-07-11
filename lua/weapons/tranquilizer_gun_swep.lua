SWEP.Base = "arccw_base"
SWEP.Spawnable = true -- this obviously has to be set to true
SWEP.Author = "BIBI"
SWEP.Category = "BIBI weapons" -- edit this if you like
SWEP.AdminOnly = false
SWEP.Slot = 4

SWEP.PrintName = "Fusil tranquillisant"
SWEP.Trivia_Class = "Fusil tranquillisant"
SWEP.Trivia_Desc = "Fusil de précision moderne américain."
SWEP.Trivia_Manufacturer = "Remington Arms"
SWEP.Trivia_Calibre = "Fléchette tranquilisante"
SWEP.Trivia_Country = "United States"
SWEP.Trivia_Year = "1988"

SWEP.UseHands = false

SWEP.ViewModel = "models/weapons/fas2/view/snipers/m24.mdl"
SWEP.WorldModel = "models/weapons/fas2/world/snipers/m24.mdl"
SWEP.ViewModelFOV = 60

SWEP.DefaultBodygroups = "00000000"
SWEP.DefaultSkin = 0

SWEP.Damage = 0
SWEP.DamageMin = 0 -- damage done at maximum range
SWEP.Range = 800 -- in METRES
SWEP.Penetration = 20
SWEP.DamageType = DMG_BULLET
SWEP.MuzzleVelocity = 790 -- projectile or phys bullet muzzle velocity

SWEP.TracerNum = 0 -- tracer every X

SWEP.Bipod_Integral = true -- Integral bipod (ie, weapon model has one)
SWEP.BipodDispersion = 0.7 -- Bipod dispersion for Integral bipods
SWEP.BipodRecoil = 0.25 -- Bipod recoil for Integral bipods

SWEP.ChamberSize = 0 -- how many rounds can be chambered.
SWEP.Primary.ClipSize = 1 -- DefaultClip is automatically set.

SWEP.ManualAction = true
SWEP.NoLastCycle = true

SWEP.Recoil = 2.5
SWEP.RecoilSide = 0.2

SWEP.RecoilRise = 0.06
SWEP.RecoilPunch = 0.5
SWEP.VisualRecoilMult = 1
SWEP.MaxRecoilBlowback = 1
SWEP.MaxRecoilPunch = 1
SWEP.RecoilPunchBack = 1
SWEP.RecoilVMShake = 0

SWEP.Sway = 0.5

SWEP.Delay = 0.2 -- 60 / RPM.
SWEP.Num = 1 -- number of shots per trigger pull.
SWEP.Firemodes = {
    {
        PrintName = "Bolt",
        Mode = 1,
    },
    {
        Mode = 0
    }
}

SWEP.NotForNPCS = true

SWEP.AccuracyMOA = 0 -- accuracy in Minutes of Angle. There are 60 MOA in a degree.
SWEP.HipDispersion = 250 -- inaccuracy added by hip firing.
SWEP.MoveDispersion = 150 -- inaccuracy added by moving. Applies in sights as well! Walking speed is considered as "maximum".
SWEP.SightsDispersion = 0 -- dispersion that remains even in sights
SWEP.JumpDispersion = 300 -- dispersion penalty when in the air

SWEP.Primary.Ammo = "tranquilizer_flechette" -- what ammo type the gun uses

SWEP.ShootVol = 110 -- volume of shoot sound
SWEP.ShootPitch = 100 -- pitch of shoot sound

SWEP.ShootSound = "Firearms2_M24_S"
SWEP.ShootDrySound = "fas2/empty_sniperrifles.wav" -- Add an attachment hook for Hook_GetShootDrySound please!
SWEP.DistantShootSound = "fas2/distant/m24.ogg"
SWEP.ShootSoundSilenced = "Firearms2_M24_S"
SWEP.FiremodeSound = "Firearms2.Firemode_Switch"

SWEP.MuzzleEffect = "muzzleflash_m24"

SWEP.ShellModel = "models/weapons/hunter_flechette.mdl"
SWEP.ShellScale = 1
SWEP.ShellSounds = ArcCW.Firearms2_Casings_Rifle
SWEP.ShellPitch = 100
SWEP.ShellTime = 1 -- add shell life time

SWEP.MuzzleEffectAttachment = 1 -- which attachment to put the muzzle on
SWEP.CaseEffectAttachment = 2 -- which attachment to put the case effect on

SWEP.SpeedMult = 0.8
SWEP.SightedSpeedMult = 0.75

SWEP.IronSightStruct = {
    Pos = Vector(-2.756, -4.2, 1.843),
    Ang = Angle(0.6, 0.02, 0),
    Magnification = 1.1,
    SwitchToSound = {"fas2/weapon_sightraise.wav", "fas2/weapon_sightraise2.wav"}, -- sound that plays when switching to this sight
    SwitchFromSound = {"fas2/weapon_sightlower.wav", "fas2/weapon_sightlower2.wav"},
}

SWEP.SightTime = 0.4

SWEP.HoldtypeHolstered = "passive"
SWEP.HoldtypeActive = "ar2"
SWEP.HoldtypeSights = "ar2"
SWEP.HoldtypeCustomize = "slam"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_AR2

SWEP.CanBash = true

SWEP.ActivePos = Vector(0, 0, 1)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.CrouchPos = Vector(-2.1, -3, 0)
SWEP.CrouchAng = Angle(0, 0, -25)

SWEP.HolsterPos = Vector(5.532, -3, 0.5)
SWEP.HolsterAng = Angle(-4.633, 36.881, 0)

SWEP.SprintPos = Vector(5.532, -3, 0.5)
SWEP.SprintAng = Angle(-4.633, 36.881, 0)

SWEP.BarrelOffsetSighted = Vector(0, 0, 0)
SWEP.BarrelOffsetHip = Vector(3, 0, -3)

SWEP.CustomizePos = Vector(5.824, 0, -1.897)
SWEP.CustomizeAng = Angle(12.149, 30.547, 0)

SWEP.BarrelLength = 32

SWEP.AttachmentElements = {
    ["suppressor"] = {
        VMBodygroups = {{ind = 2, bg = 1}},
        WMBodygroups = {{ind = 1, bg = 1}},
    },
    ["762ap"] = {
        VMBodygroups = {{ind = 3, bg = 1}},
    },
}
SWEP.Attachments = {
    {
        PrintName = "Mount",
        DefaultAttName = "Ironsight",
        Slot = {"fas2_leupold_scope","fas2_sight", "fas2_scope"},
        Bone = "Dummy04",
        Offset = {
            vpos = Vector(-2.15, -1.165, 0),
            vang = Angle(0, 0, 270),
            wpos = Vector(10.2, 0.68, -6.2),
            wang = Angle(-10.393, 0, 180)
        },
        ExtraSightDist = 1.7,
        Installed = "fas2_scope_leupold",
        Integral = true,
        WMScale = Vector(1.7, 1.7, 1.7),
        CorrectivePos = Vector(0, 0, 0),
        CorrectiveAng = Angle(0, 0, 0)
    },
    {
        PrintName = "Skill",
        Slot = "fas2_nomen",
    },
}

SWEP.Hook_SelectReloadAnimation = function(wep, anim)
    local clip = (wep.Primary.ClipSize - wep:Clip1())
    local nomen = wep.Attachments[2].Installed and "_nomen" or ""

    return "reload_" .. clip .. nomen
end

SWEP.Hook_SelectCycleAnimation = function(wep, anim)
    local iron = (wep:GetState() == ArcCW.STATE_SIGHTS and "_iron") or ""
    local nomen = wep.Attachments[2].Installed and "_nomen" or ""

    return "cycle" .. iron .. nomen
end

SWEP.Animations = {
    ["idle"] = false,
    ["draw"] = {
        Source = "draw",
        Time = 20/30,
		SoundTable = {{s = "Firearms2.Deploy", t = 0}},
    },
    ["draw_empty"] = {
        Source = "draw_empty",
        Time = 20/30,
		SoundTable = {{s = "Firearms2.Deploy", t = 0}},
    },
    ["holster"] = {
        Source = "holster",
        Time = 20/60,
		SoundTable = {{s = "Firearms2.Holster", t = 0}},
    },
    ["holster_empty"] = {
        Source = "holster_empty",
        Time = 20/60,
		SoundTable = {{s = "Firearms2.Holster", t = 0}},
    },
    ["fire"] = {
        Source = "fire",
        Time = 15/30,
        MinProgress = 0.4,
    },
    ["fire_iron"] = {
        Source = "fire_scoped",
        Time = 15/30,
        MinProgress = 0.37,
    },
    ["cycle"] = {
        Source = {"cock01", "cock02", "cock03"},
        Time = 40/30,
        ACT_HL2MP_GESTURE_RELOAD_SHOTGUN,
        ShellEjectAt = 0.45,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup", t = 0.25},
        {s = "Firearms2.M24_Boltback", t = 0.45},
        {s = "Firearms2.M24_Boltforward", t = 0.65},
        {s = "Firearms2.M24_Boltdown", t = 0.85}    
        },
    },
    ["cycle_iron"] = {
        Source = {"cock01_scoped", "cock02_scoped", "cock03_scoped"},
        Time = 40/30,
        ShellEjectAt = 0.45,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup", t = 0.25},
        {s = "Firearms2.M24_Boltback", t = 0.45},
        {s = "Firearms2.M24_Boltforward", t = 0.65},
        {s = "Firearms2.M24_Boltdown", t = 0.85}    
        },
    },
    ["cycle_nomen"] = {
        Source = {"cock_nmc_01", "cock_nmc_02", "cock_nmc_03"},
        Time = 25/30,
        ShellEjectAt = 0.3,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup_Nomen", t = 0.15},
        {s = "Firearms2.M24_Boltback_Nomen", t = 0.3},
        {s = "Firearms2.M24_Boltforward_Nomen", t = 0.45},
        {s = "Firearms2.M24_Boltdown_Nomen", t = 0.6}    
        },
    },
    ["cycle_iron_nomen"] = {
        Source = {"cock_nmc_01_scoped", "cock_nmc_02_scoped", "cock_nmc_03_scoped"},
        Time = 25/30,
        ShellEjectAt = 0.3,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup_Nomen", t = 0.15},
        {s = "Firearms2.M24_Boltback_Nomen", t = 0.3},
        {s = "Firearms2.M24_Boltforward_Nomen", t = 0.45},
        {s = "Firearms2.M24_Boltdown_Nomen", t = 0.6}    
        },
    },
    ["reload_1"] = {
        Source = "reload_1",
        Time = 165/40,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup", t = 0.45},
        {s = "Firearms2.M24_Boltback", t = 0.6},
        {s = "Firearms2.M24_Eject", t = 0.7},
        {s = "Firearms2.M24_Insert", t = 1.15},
        {s = "Firearms2.M24_Insert", t = 2.6},
        {s = "Firearms2.M24_Boltforward", t = 3.35},
        {s = "Firearms2.M24_Boltdown", t = 3.55}
        },
    },
    ["reload_2"] = {
        Source = "reload_2",
        Time = 180/40,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup", t = 0.45},
        {s = "Firearms2.M24_Boltback", t = 0.6},
        {s = "Firearms2.M24_Eject", t = 0.7},
        {s = "Firearms2.M24_Insert", t = 1.15},
        {s = "Firearms2.M24_Insert", t = 2.6},
        {s = "Firearms2.M24_Insert", t = 3.1},
        {s = "Firearms2.M24_Boltforward", t = 3.7},
        {s = "Firearms2.M24_Boltdown", t = 3.95}
        },
    },
    ["reload_3"] = {
        Source = "reload_3",
        Time = 195/40,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup", t = 0.45},
        {s = "Firearms2.M24_Boltback", t = 0.6},
        {s = "Firearms2.M24_Eject", t = 0.7},
        {s = "Firearms2.M24_Insert", t = 1.15},
        {s = "Firearms2.M24_Insert", t = 2.6},
        {s = "Firearms2.M24_Insert", t = 3.1},
        {s = "Firearms2.M24_Insert", t = 3.55},
        {s = "Firearms2.M24_Boltforward", t = 4.1},
        {s = "Firearms2.M24_Boltdown", t = 4.35}
        },
    },
    ["reload_4"] = {
        Source = "reload_4",
        Time = 210/40,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup", t = 0.45},
        {s = "Firearms2.M24_Boltback", t = 0.6},
        {s = "Firearms2.M24_Eject", t = 0.7},
        {s = "Firearms2.M24_Insert", t = 1.15},
        {s = "Firearms2.M24_Insert", t = 2.6},
        {s = "Firearms2.M24_Insert", t = 3.1},
        {s = "Firearms2.M24_Insert", t = 3.55},
        {s = "Firearms2.M24_Insert", t = 3.9},
        {s = "Firearms2.M24_Boltforward", t = 4.5},
        {s = "Firearms2.M24_Boltdown", t = 4.75}
        },
    },
        ["reload_5"] = {
        Source = "reload_empty",
        Time = 180/40,
        ShellEjectAt = 0.5,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup", t = 0.4},
        {s = "Firearms2.M24_Boltback", t = 0.5},
        {s = "Firearms2.M24_Insert", t = 1.55},
        {s = "Firearms2.M24_Insert", t = 1.95},
        {s = "Firearms2.M24_Insert", t = 2.35},
        {s = "Firearms2.M24_Insert", t = 2.75},
        {s = "Firearms2.M24_Insert", t = 3.15},
        {s = "Firearms2.M24_Boltforward", t = 3.7},
        {s = "Firearms2.M24_Boltdown", t = 3.9}
        },
    },

    ["reload_1_nomen"] = {
        Source = "reload_1_nomen",
        Time = 165/50,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup_Nomen", t = 0.3},
        {s = "Firearms2.M24_Boltback_Nomen", t = 0.4},
        {s = "Firearms2.M24_Eject", t = 0.5},
        {s = "Firearms2.M24_Insert", t = 0.9},
        {s = "Firearms2.M24_Insert", t = 2.1},
        {s = "Firearms2.M24_Boltforward_Nomen", t = 2.7},
        {s = "Firearms2.M24_Boltdown_Nomen", t = 2.85}
        },
    },
    ["reload_2_nomen"] = {
        Source = "reload_2_nomen",
        Time = 180/50,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup_Nomen", t = 0.3},
        {s = "Firearms2.M24_Boltback_Nomen", t = 0.4},
        {s = "Firearms2.M24_Eject", t = 0.5},
        {s = "Firearms2.M24_Insert", t = 0.9},
        {s = "Firearms2.M24_Insert", t = 2.1},
        {s = "Firearms2.M24_Insert", t = 2.5},
        {s = "Firearms2.M24_Boltforward_Nomen", t = 3},
        {s = "Firearms2.M24_Boltdown_Nomen", t = 3.15}
        },
    },
    ["reload_3_nomen"] = {
        Source = "reload_3_nomen",
        Time = 195/50,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup_Nomen", t = 0.3},
        {s = "Firearms2.M24_Boltback_Nomen", t = 0.4},
        {s = "Firearms2.M24_Eject", t = 0.5},
        {s = "Firearms2.M24_Insert", t = 0.9},
        {s = "Firearms2.M24_Insert", t = 2.1},
        {s = "Firearms2.M24_Insert", t = 2.5},
        {s = "Firearms2.M24_Insert", t = 2.8},
        {s = "Firearms2.M24_Boltforward_Nomen", t = 3.3},
        {s = "Firearms2.M24_Boltdown_Nomen", t = 3.45}
        },
    },
    ["reload_4_nomen"] = {
        Source = "reload_4_nomen",
        Time = 210/50,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup_Nomen", t = 0.3},
        {s = "Firearms2.M24_Boltback_Nomen", t = 0.4},
        {s = "Firearms2.M24_Eject", t = 0.5},
        {s = "Firearms2.M24_Insert", t = 0.9},
        {s = "Firearms2.M24_Insert", t = 2.1},
        {s = "Firearms2.M24_Insert", t = 2.5},
        {s = "Firearms2.M24_Insert", t = 2.8},
        {s = "Firearms2.M24_Insert", t = 3.15},
        {s = "Firearms2.M24_Boltforward_Nomen", t = 3.6},
        {s = "Firearms2.M24_Boltdown_Nomen", t = 3.75}
        },
    },
    ["reload_5_nomen"] = {
        Source = "reload_empty_nomen",
        Time = 180/50,
        ShellEjectAt = 0.4,
        SoundTable = {
        {s = "Firearms2.Cloth_Movement", t = 0},
        {s = "Firearms2.M24_Boltup_Nomen", t = 0.3},
        {s = "Firearms2.M24_Boltback_Nomen", t = 0.4},
        {s = "Firearms2.M24_Insert", t = 1.2},
        {s = "Firearms2.M24_Insert", t = 1.5},
        {s = "Firearms2.M24_Insert", t = 1.8},
        {s = "Firearms2.M24_Insert", t = 2.2},
        {s = "Firearms2.M24_Insert", t = 2.5},
        {s = "Firearms2.M24_Boltforward_Nomen", t = 3},
        {s = "Firearms2.M24_Boltdown_Nomen", t = 3.15}
        },
    },
}

function SWEP:DoPrimaryFire(isent, data)
    if SERVER then
        local ent = ents.Create( "tranquilizer_dart" )
        if ( !IsValid( ent ) ) then return end

        local Forward = self:GetOwner():GetAimVector()

        ent:SetPos( self:GetOwner():GetShootPos() + Forward * 35 )
        ent:SetAngles( self:GetOwner():EyeAngles() + Angle(0, 48, 0))
        ent:SetOwner( self:GetOwner() )
        ent:Spawn()
        ent:Activate()

        ent:SetVelocity( Forward * 4000 )
    end
end