var
  sceneDuration = 10.0
  fadeDuration = sceneDuration / 5.0

proc drawLogoScene() =
    if sceneDuration == 10.0: sceneDuration += getTime()
    let currentTime = getTime()

    if currentTime >= sceneDuration or isMouseButtonPressed(LEFT):
        GAME_SCENE = MENU
        return

    let fadeInAlpha  = clamp(currentTime / fadeDuration, 0.0, 1.0)
    let fadeOutAlpha = clamp((sceneDuration - currentTime) / fadeDuration, 0.0, 1.0)
    let alpha = min(fadeInAlpha, fadeOutAlpha)

    let tint = Color(r: 255, g: 255, b: 255, a: uint8(alpha * 255))

    for i, logo in @[addr NIM_LOGO, addr RAYLIB_LOGO].pairs:
        drawTexture(logo[], int32 i * 200, 0, tint)