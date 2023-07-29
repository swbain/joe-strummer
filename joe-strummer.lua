-- joe-strummer: strum sequencer for norns + grid + just friends

function init()
    redraw()
end

function redraw()
    screen.clear()
    screen.level(15)
    screen.move(0,40)
    screen.text("strum a chord")
    screen.update()
end
