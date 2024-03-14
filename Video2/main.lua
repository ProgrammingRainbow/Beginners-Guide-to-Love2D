local game = {
    text = "Love",
    text_x = 200,
    text_y = 0,
    text_vel = 3,
    text_xvel = 3,
    text_yvel = 3,
}

function game:load()
    self.background = love.graphics.newImage("images/background.png")

    self.font = love.graphics.newFont("fonts/freesansbold.ttf", 60)
    love.graphics.setFont(game.font)
    self.text_w = self.font:getWidth(game.text)
    self.text_h = self.font:getHeight()
end

function game:draw()
    love.graphics.draw(self.background)
    love.graphics.print(self.text, self.text_x, self.text_y)
end

function game:rand_color()
    local r = math.random()
    local g = math.random()
    local b = math.random()
    love.graphics.setBackgroundColor(r, g, b, 1)
end

function game:update_text()
    self.text_x = self.text_x + self.text_xvel
    self.text_y = self.text_y + self.text_yvel
    if self.text_x < 0 then
        self.text_xvel = self.text_vel
    end
    if self.text_x + self.text_w > love.graphics.getWidth() then
        self.text_xvel = -self.text_vel
    end
    if self.text_y < 0 then
        self.text_yvel = self.text_vel
    end
    if self.text_y + self.text_h > love.graphics.getHeight() then
        self.text_yvel = -self.text_vel
    end
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
    game:update_text()
end

function love.draw()
    game:draw()
end
