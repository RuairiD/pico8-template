-- START CLASSIC
local Object = {}
Object.__index = Object


function Object:new()
end


function Object:extend()
    local cls = {}
    for k, v in pairs(self) do
        if sub(k, 1, 2) == "__" then
            cls[k] = v
        end
    end
    cls.__index = cls
    cls.super = self
    setmetatable(cls, self)
    return cls
end


function Object:implement(...)
    for _, cls in pairs({...}) do
        for k, v in pairs(cls) do
            if self[k] == nil and type(v) == "function" then
                self[k] = v
            end
        end
    end
end


function Object:is(T)
    local mt = getmetatable(self)
    while mt do
        if mt == T then
            return true
        end
        mt = getmetatable(mt)
    end
    return false
end


function Object:__tostring()
    return "Object"
end


function Object:__call(...)
    local obj = setmetatable({}, self)
    obj:new(...)
    return obj
end
-- END CLASSIC

local Player = Object:extend()

function Player:new(x, y)
    self.x = x
    self.y = y
end

function Player:update()
    self.x = self.x + rnd(2) - 1
    self.y = self.y + rnd(2) - 1
end

function Player:draw()
    spr(0, self.x, self.y)
end

-- START MAIN
local player

function _init()
    player = Player(60, 60)
end

function _update()
    player:update()
end

function _draw()
    cls()
    print('This is an empty project.')
    player:draw()
end
-- END MAIN
