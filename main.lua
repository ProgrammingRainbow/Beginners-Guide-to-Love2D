local game = {
    text = "Love",
    text_x = 200,
    text_y = 0,
    text_vel = 3,
    text_xvel = 3,
    text_yvel = 3,

    sprite_x = 0,
    sprite_y = 0,
    sprite_vel = 5,
}

function game:load()
    self.background = love.graphics.newImage("images/background.png")

    self.font = love.graphics.newFont("fonts/freesansbold.ttf", 60)
    love.graphics.setFont(game.font)
    self.text_w = self.font:getWidth(game.text)
    self.text_h = self.font:getHeight()

    self.sprite = love.graphics.newImage("images/lua-logo.png")
    self.sprite_w, self.sprite_h = self.sprite:getDimensions()

    self.lua = love.audio.newSource("sounds/lua.ogg", "static")
    self.love = love.audio.newSource("sounds/love.ogg", "static")
    self.music = love.audio.newSource("music/freesoftwaresong-8bit.ogg", "stream")

    self.music:setLooping(true)
    self.music:play()
end

function game:draw()
    love.graphics.draw(self.background)
    love.graphics.print(self.text, self.text_x, self.text_y)
    love.graphics.draw(self.sprite, self.sprite_x, self.sprite_y)
end

function game:rand_color()
    local r = math.random()
    local g = math.random()
    local b = math.random()
    love.graphics.setBackgroundColor(r, g, b, 1)
    self.lua:clone():play()
end

function game:update_text()
    self.text_x = self.text_x + self.text_xvel
    self.text_y = self.text_y + self.text_yvel
    if self.text_x < 0 then
        self.text_xvel = self.text_vel
        self.love:clone():play()
    end
    if self.text_x + self.text_w > love.graphics.getWidth() then
        self.text_xvel = -self.text_vel
        self.love:clone():play()
    end
    if self.text_y < 0 then
        self.text_yvel = self.text_vel
        self.love:clone():play()
    end
    if self.text_y + self.text_h > love.graphics.getHeight() then
        self.text_yvel = -self.text_vel
        self.love:clone():play()
    end
end

function game:update_sprite()
    if love.keyboard.isDown("left") then
        self.sprite_x = self.sprite_x - self.sprite_vel
    end
    if love.keyboard.isDown("right") then
        self.sprite_x = self.sprite_x + self.sprite_vel
    end
    if love.keyboard.isDown("up") then
        self.sprite_y = self.sprite_y - self.sprite_vel
    end
    if love.keyboard.isDown("down") then
        self.sprite_y = self.sprite_y + self.sprite_vel
    end
end

function game:pause_music()
    if self.music:isPlaying() then
        self.music:pause()
    else
        self.music:play()
    end
end

function love.keypressed(k)
    if k == "escape" then
        love.event.quit()
    elseif k == "space" then
        game:rand_color()
    elseif k == "m" then
        game:pause_music()
    end
end

function love.load()
    math.randomseed(os.time())
    game:load()
end

function love.update()
    game:update_text()
    game:update_sprite()
end

function love.draw()
    game:draw()
end
