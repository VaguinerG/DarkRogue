import raylib, ./admob, raygui
import external/nimsystemfonts
include settings, setup
include internal/[assets]
include scenes/[logo, menu]

initWindow(600, 300, "Dark Rogue")
initAssets()

block:
    while not windowShouldClose():
        updateVars()
        drawing:
            clearBackground(MENU_BG_COLOR)
            drawCircle(getMouseX(), getMouseY(), 50, RED)
            case GAME_SCENE:
                of LOGO:
                    drawLogoScene()
                of MENU:
                    drawMenuScreen()
                else:
                    discard

closeWindow()