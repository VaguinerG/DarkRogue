setTraceLogLevel(None)
setConfigFlags(flags(WindowResizable, Msaa4xHint, VsyncHint))

type GameScenes = enum
    LOGO, MENU, CHARACTER_SELECTION

const
    SYSTEM_FONTS = getSystemFonts()

var
    MENU_BG_COLOR = Color(r: 32, g: 32, b: 29, a: 255)
    MENU_FONT = getFontDefault()
    GAME_SCENE: GameScenes = LOGO
    WINDOW_CENTER: Vector2

proc updateVars() =
    WINDOW_CENTER = Vector2(x: getScreenWidth() / 2, y: getScreenHeight() / 2)

const
    NIM_LOGO_RAW = staticRead("assets/images/logos/nim.png")
    RAYLIB_LOGO_RAW = staticRead("assets/images/logos/raylib.png")

var
    NIM_LOGO: Texture2D
    RAYLIB_LOGO: Texture2D