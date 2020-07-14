push = require "push"
Class = require "class"

require "Mappa"
require "Bird"
require "LivelloGenerale"

require "Livello1"
require "Livello2"
require "Livello3"
require "Livello4"


local WINDOW_WIDTH = 1080
local WINDOW_HEIGHT = 620

VIRTUAL_WIDTH = 1080
VIRTUAL_HEIGHT = 620

local cheLivello

function love.load()
	
	contatorePartitePerse = 0
	vite = 3
	cheLivello = 1

	
	love.graphics.setDefaultFilter("nearest", "nearest")
	love.window.setTitle("FLAPPY BIRD !")


	fontLv = love.graphics.newFont("Fonts/font.ttf", 40)
	fontVittSconf = love.graphics.newFont("Fonts/font.ttf", 80)
	love.graphics.setFont(fontLv)


	push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
		fullscreen = false,
		vsync = true,
		resizable = false
	})


	mappa = Mappa()
	bird = Bird()
	livello = LivelloGenerale()		--classe che contiene le basi dei vari livelli
	
	
	statoGioco = "fermo"
	
	
	suoni = {
		["volo"] = love.audio.newSource("Sounds/volo.mp3", "static"),
		["game_over"] = love.audio.newSource("Sounds/game_over.wav", "static"),
		["vittoria"] = love.audio.newSource("Sounds/vittoria.wav", "static")
	}
	
end

function love.keypressed(key)
	if key == "escape" then
		love.event.quit()
	elseif key == "return" then
		if statoGioco == "fermo" then
			statoGioco = "start"
		elseif statoGioco == "perso" then
			resetTutto()
		end
	end
end

function resetTutto()
	statoGioco = "fermo"
	contatorePartitePerse = contatorePartitePerse + 1
	mappa:reset(false)			--un flag che uso per andare a ripristinare la velocita della telecamera o no
	bird:reset()
	if contatorePartitePerse == 3 then
		cheLivello = 1
		contatorePartitePerse = 0
	end
	vite = 3-contatorePartitePerse
end

function love.update(dt)

	if statoGioco == "start" then
			--se flappy bird si trova 60 px dopo l'ultimo tubo finisce il livello			
		if (mappa.livello ~= nil) and (bird.x >= mappa.livello.x_tubo+livello.parteDelTubo["width"]+60) then
			mappa:reset(true)	--un flag che uso per andare a ripristinare la velocita della telecamera o no
			bird:reset()
			statoGioco = "fermo"
			cheLivello = cheLivello + 1
		end
		mappa:update(dt)
		bird:update(dt)
	end
	
end

function love.draw()
	
		--(ho creato solo 4 livelli)
	if cheLivello <= 4 and cheLivello >= 1 then
		mappa:render(cheLivello)
		bird:render()
	else
		statoGioco = "vittoria"
		suoni["vittoria"]:play()
	end

	if statoGioco == "fermo" then
		
		love.graphics.print("press ENTER to play.\npress SPACE to fly.", VIRTUAL_WIDTH/2-200, VIRTUAL_HEIGHT-70)
		
	elseif statoGioco == "vittoria" then

		love.graphics.setFont(fontVittSconf)
		love.graphics.setColor(0, 1, 0, 1)
		love.graphics.print("livelli completati !!!", 150, VIRTUAL_HEIGHT/2)
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.setFont(fontLv)

	elseif statoGioco == "perso" then
		
		love.graphics.setFont(fontVittSconf)
		love.graphics.setColor(1, 0, 0, 1)
		love.graphics.print("game over\npress ENTER to\n play again", VIRTUAL_WIDTH/2-350, VIRTUAL_HEIGHT/2-10)
		love.graphics.setColor(1, 1, 1, 1)
		love.graphics.setFont(fontLv)
	else
		
		love.graphics.print("FINE DEL\n LIVELLO "..tostring(cheLivello), mappa.livello.x_tubo+livello.parteDelTubo["width"]+60, VIRTUAL_HEIGHT/2)
		
		love.graphics.setColor(1, 99/255, 71/255, 1)
		love.graphics.print("LIVELLO "..tostring(cheLivello), VIRTUAL_WIDTH/2-70, VIRTUAL_HEIGHT-50)
		love.graphics.setColor(1, 1, 1, 1)

		love.graphics.setColor(1, 0, 0, 1)
		local str = "i"
		if vite == 1 then
			str = "e"
		end
		love.graphics.print(tostring(vite).." vite rimanent"..str, 30, VIRTUAL_HEIGHT-50)
		love.graphics.setColor(1, 1, 1, 1)
		
	end
		
		--sposta l'intera finestra sulle x
	love.graphics.translate(-math.floor(mappa.camX), 0)
	
end
