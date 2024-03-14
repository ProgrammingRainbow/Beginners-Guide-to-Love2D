local game = {}

function game:load()
    self.background = love.graphics.newImage("images/background.png")
end

function game:draw()
    love.graphics.draw(self.background)
end

function game:rand_color()
    local r = math.random()
    local g = math.random()
    local b = math.random()
    love.graphics.setBackgroundColor(r, g, b, 1)
end

function love.keypressed(k)
    if k == "escape" then
        love.event.quit()
    elseif k == "space" then
        game:rand_color()
    end
end

function love.load()
    math.randomseed(os.time())
    game:load()
end

function love.update()
end

function love.draw()
    game:draw()
end
