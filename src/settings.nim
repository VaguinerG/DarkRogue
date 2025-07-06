setTraceLogLevel(None)
setConfigFlags(flags(WindowResizable, Msaa4xHint, VsyncHint))

type GameScenes = enum
    LOGO, MENU, CHARACTER_SELECTION

const
    baseWidth = 1440
    baseHeight = 900

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

proc updateMouseTransform() =
  let screenW = getScreenWidth()
  let screenH = getScreenHeight()

  if screenW != baseWidth or screenH != baseHeight:
    let scale = min(screenW.float32 / baseWidth.float32, screenH.float32 / baseHeight.float32)

    let offsetX = ((screenW.float32 - (baseWidth.float32 * scale)) / 2).int
    let offsetY = ((screenH.float32 - (baseHeight.float32 * scale)) / 2).int

    setMouseOffset(int32 offsetX, int32 offsetY)
    setMouseScale(1.0 / scale, 1.0 / scale)
  else:
    setMouseOffset(0, 0)
    setMouseScale(1.0, 1.0)