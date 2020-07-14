Mappa = Class{}

local cielo = 	{["width"] = 288, ["height"] = 125}
local sfondo = 	{["width"] = 288, ["height"] = 135}

local VELOCITA_TELECAMERA = 100

function Mappa:init()
	
	cielo["image"] = 	love.graphics.newImage("Sprites/cielo.png")
	sfondo["image"] =	love.graphics.newImage("Sprites/sfondo.png")

		--la base verra' usata anche in altre classi quindi mi serve che sia accessibile'
	self.base = 	{["width"] = 288, ["height"] = 112}
	self.base["image"] = love.graphics.newImage("Sprites/base.png")
	
	self.camX = 0
	self.livello = nil		-- il livello verra' istanziato dopo aver creato la mappa
end

function Mappa:reset(flag)
	self.camX = 0
		--aumento la velocita' della videocamera tra un livello e l'altro
	if flag == true then
		VELOCITA_TELECAMERA = VELOCITA_TELECAMERA+20
	else
		VELOCITA_TELECAMERA = 100
	end
end

function Mappa:update(dt)
		--una volta raggiunto il limite la "telecamera" si ferma ma devo far proseguire flappy bird, percio' gli setto un dx
	if (self.livello ~= nil) and (self.camX <= (self.livello.x_tubo*5)) then
		self.camX = self.camX+VELOCITA_TELECAMERA*dt
	else
		bird.dx = VELOCITA_TELECAMERA
	end
end

function Mappa:render(cheLv)
	
		--ora crea la mappa colonna per colonna
	
	local x = 0
	while(x < VIRTUAL_WIDTH*2) do
		love.graphics.draw(self.base["image"], x-self.camX, VIRTUAL_HEIGHT-self.base["height"]+15)
		love.graphics.draw(sfondo["image"], x-self.camX, VIRTUAL_HEIGHT-self.base["height"]-sfondo["height"]+15)
		
			--dopo aver inserito la terra e lo sfondo (nuvole e citta) riempe tutto il resto dello spazio col cielo
			
			--volendo fare la base leggermente piu' bassa di quello che era (per quello il "+15") ho sballato un po le misure, con il ciclo avrei lasciato 15 px vuoti	in alto percio' ho rimpito la prima riga col cielo (tecnicamente una parte di essa verra' messa in secondo piano dalla seconda linea di cielo)
		local y=0
		love.graphics.draw(cielo["image"], x-self.camX, y)
		while(y < VIRTUAL_HEIGHT-self.base["height"]-sfondo["height"]) do
			love.graphics.draw(cielo["image"], x-self.camX, y+15)
			y = y+cielo["height"]
		end
		x = x+self.base["width"]
	end
	
		--poi creo il livello, livello che con i tubi mettera' in secondo piano molte immagini (sfodno e cielo), per questo ho dovuto crearlo DOPO aver creato lo sfondo
	self:creaLivello(cheLv)
end

function Mappa:creaLivello(lv)
	if lv == 1 then
		self.livello = Livello1()
	elseif lv == 2 then
		self.livello = Livello2()
	elseif lv == 3 then
		self.livello = Livello3()
	elseif lv == 4 then
		self.livello = Livello4()
	end
	self.livello:render()
end
