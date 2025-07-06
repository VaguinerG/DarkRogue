import raylib, ./admob, raygui
import external/nimsystemfonts
include settings, setup
include internal/[assets]
include scenes/[logo, menu]

initWindow(baseWidth, baseHeight, "Dark Rogue")
initAssets()

block:
    while not windowShouldClose():
        updateVars()
        setMouseScale(1.0, 1.0)
        setMouseOffset(0, 0)
        drawing:
            clearBackground(MENU_BG_COLOR)
            drawText($getScreenWidth() & "x" & $getScreenHeight(), 0, 0, 10, RED)
            drawText($getRenderWidth() & "x" & $getRenderHeight(), 0, 20, 10, RED)
            drawCircle(getMouseX(), getMouseY(), 50, RED)
            case GAME_SCENE:
                of LOGO:
                    drawLogoScene()
                of MENU:
                    drawMenuScreen()
                else:
                    discard

closeWindow()