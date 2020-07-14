LivelloGenerale = Class{}

	--questa classe contiene le 3 immagini riguardanti i tubi e la funzione per il controllo della collisione
function LivelloGenerale:init()
	
	
	self.parteDelTubo = 			{["width"] = 52, ["height"] = 105, ["image"] = love.graphics.newImage("Sprites/parteDelTubo.png")}
	
	self.tuboInAlto = {["width"] = 52, ["height"] = 105, ["image"] = love.graphics.newImage("Sprites/tubo_inAlto.png")}
	
	self.tuboInBasso = 	{["width"] = 52, ["height"] = 105, ["image"] = love.graphics.newImage("Sprites/tubo_inBasso.png")}
	
end

function LivelloGenerale:controlloCollisione(x_tubo, y_tuboSup, y_tuboInf)
	
	if ((math.floor(bird.y) <= y_tuboSup or math.floor(bird.y)+bird.height >= y_tuboInf) and (math.floor(bird.x)+bird.width >= x_tubo and math.floor(bird.x)+bird.width <= x_tubo+5)) 
	
	or ((math.floor(bird.y) <= y_tuboSup and math.floor(bird.y) >= y_tuboSup-5) and (math.floor(bird.x)+bird.width >= x_tubo and math.floor(bird.x)+bird.width <= x_tubo+self.parteDelTubo["width"])) 
	
	or ((math.floor(bird.y)+bird.height >= y_tuboInf and math.floor(bird.y)+bird.height <= y_tuboInf+5) and (math.floor(bird.x)+bird.width >= x_tubo and math.floor(bird.x)+bird.width <= x_tubo+self.parteDelTubo["width"])) 
	
	or ((math.floor(bird.y)+bird.height <= y_tuboSup and math.floor(bird.y)+bird.height >= y_tuboSup-5) and (math.floor(bird.x) >= x_tubo and math.floor(bird.x) <= x_tubo+self.parteDelTubo["width"])) 
	
	or ((math.floor(bird.y)+bird.height >= y_tuboInf and math.floor(bird.y)+bird.height <= y_tuboInf+5) and (math.floor(bird.x) >= x_tubo and math.floor(bird.x) <= x_tubo+self.parteDelTubo["width"]))
	
	or (math.floor(bird.y)+bird.height >= VIRTUAL_HEIGHT-mappa.base["height"]+15 and math.floor(bird.y)+bird.height <= VIRTUAL_HEIGHT-mappa.base["height"]+15+5) then
		
		if statoGioco ~= "perso" then
			statoGioco = "perso"
			suoni["game_over"]:play()
		end
	end
	
end
