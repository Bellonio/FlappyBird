Bird = Class{}

	--le tre posizioni di flappy bird
local flappyBirdScende = 	{["width"] = 34, ["height"] = 24}
local flappyBirdFermo = 	{["width"] = 34, ["height"] = 24}
local flappyBirdSale = 	{["width"] = 34, ["height"] = 24}

local VOLO = -350			--negativo xke deve salire, cioe' diminuire la y
local GRAVITA = 150

function Bird:init()
	
	flappyBirdScende["image"] = 	love.graphics.newImage("Sprites/flappyBird_scende.png")
	flappyBirdFermo["image"] = 	love.graphics.newImage("Sprites/flappyBird_fermo.png")
	flappyBirdSale["image"] = 		love.graphics.newImage("Sprites/flappyBird_vola.png")
	
		--dati che mi serviranno e percio' ho deciso di fare degli attributi, ogni immagine di flappy bird ha le stesse dimensioni, percio' potevo prenderne una qualsiasi'
	self.width = flappyBirdSale["width"]
	self.height = flappyBirdSale["height"]
	
	self.x = 50
	self.y = VIRTUAL_HEIGHT/2-100
	
	self.dy = 0
	self.dx = 0
end

function Bird:reset()
	self.x = 50
	self.y = VIRTUAL_HEIGHT/2-100
	
	self.dy = 0
	self.dx = 0
end

function Bird:update(dt)
	
	self.dy = GRAVITA
	if love.keyboard.isDown("space") then
		suoni["volo"]:play()
		self.dy = VOLO
	end
	self.y = self.y+self.dy*dt
	
		--caso in cui la telecamera smetta di muoversi e allora sara' flappy bird a muoversi
	if self.dx ~= 0 then
		self.x = self.x+self.dx*dt
	end
end

function Bird:render()
	if self.dy < 0 then
		love.graphics.draw(flappyBirdSale["image"], self.x, self.y)
	elseif self.dy > 0 then
		love.graphics.draw(flappyBirdScende["image"], self.x, self.y)
	end
	
	if statoGioco ~= "start" then
		love.graphics.draw(flappyBirdFermo["image"], self.x, self.y)
	end
end
