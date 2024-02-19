require 'settings'

flags = {
    fullscreen = fullscreen,
    vsync = vsync,
    --fullscreentype = 'exclusive',
    fullscreentype = 'desktop',
}

love.window.setMode(screen_width, screen_height , flags)
