-- joe-strummer: strum sequencer for norns + grid + just friends

g = grid.connect()

steps = {0, 0, 0, 0, 0, 0, 0, 0, 0}

active_note = 1

g.key = function(x, y, z)
    if z == 1 and x < 10 then
        steps[x] = y
    end
    grid_redraw()
end

function init()
    redraw()
    grid_redraw()
    clock.run(rep)
end

strum = function()
    t = 0.1
    tm = 1.15
    for i=1,9 do
        note()
        clock.sleep(t)
        t = t * tm
    end
    active_note = 0
    grid_redraw()
end

function note()
    active_note = active_note + 1
    grid_redraw()
end

function redraw()
    screen.clear()
    screen.level(15)
    screen.move(0, 40)
    screen.text("strum a chord")
    screen.update()
end

function grid_redraw()
    g:all(0)
    for x = 1, 9 do
        if steps[x] > 0 then
            if x == active_note then
                g:led(x, steps[x], 15)
            else
                g:led(x, steps[x], 5)
            end
        end
    end
    g:refresh()
end

rep = function()
    while true do
        clock.run(strum)
        clock.sleep(5)
    end
end
