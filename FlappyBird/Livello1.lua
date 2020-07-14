Livello1 = Class{}

function Livello1:init()
	self.spazio_fra_tubi = 250
		
		--devo togliere la camX xke in questo modo i tubi "non si muoveranno" insieme alla telecamera
	self.x_partenza = self.spazio_fra_tubi-mappa.camX
	
	self.x_tubo = self.x_partenza
end

function Livello1:render()
	
		--prima colonna di tubi
	love.graphics.draw(livello.tuboInBasso["image"], self.x_tubo, 0)
	
	love.graphics.draw(livello.tuboInAlto["image"], self.x_tubo, livello.parteDelTubo["height"]*3)
	love.graphics.draw(livello.parteDelTubo["image"], self.x_tubo, livello.parteDelTubo["height"]*4)
	
	livello:controlloCollisione(self.x_tubo, livello.parteDelTubo["height"], livello.parteDelTubo["height"]*3)
	self.x_tubo = self.x_tubo+self.spazio_fra_tubi
	
		--seconda colonna di tubi	
	love.graphics.draw(livello.parteDelTubo["image"], self.x_tubo, 0)
	love.graphics.draw(livello.tuboInBasso["image"], self.x_tubo, livello.parteDelTubo["height"])
	
	love.graphics.draw(livello.tuboInAlto["image"], self.x_tubo, livello.parteDelTubo["height"]*4)
	
	livello:controlloCollisione(self.x_tubo, livello.parteDelTubo["height"]*2, livello.parteDelTubo["height"]*4)
	self.x_tubo = self.x_tubo+self.spazio_fra_tubi
	
		--terza colonna di tubi	
	love.graphics.draw(livello.parteDelTubo["image"], self.x_tubo, 0)
	love.graphics.draw(livello.parteDelTubo["image"], self.x_tubo, livello.parteDelTubo["height"])
	love.graphics.draw(livello.tuboInBasso["image"], self.x_tubo, livello.parteDelTubo["height"]*2)

	love.graphics.draw(livello.tuboInAlto["image"], self.x_tubo, livello.parteDelTubo["height"]*4)
	
	livello:controlloCollisione(self.x_tubo, livello.parteDelTubo["height"]*3, livello.parteDelTubo["height"]*4)
	self.x_tubo = self.x_tubo+self.spazio_fra_tubi
	
		--quarta colonna di tubi	
	love.graphics.draw(livello.parteDelTubo["image"], self.x_tubo, 0)
	love.graphics.draw(livello.tuboInBasso["image"], self.x_tubo, livello.parteDelTubo["height"])
	
	love.graphics.draw(livello.tuboInAlto["image"], self.x_tubo, livello.parteDelTubo["height"]*3)
	love.graphics.draw(livello.parteDelTubo["image"], self.x_tubo, livello.parteDelTubo["height"]*4)
	
	livello:controlloCollisione(self.x_tubo, livello.parteDelTubo["height"]*2, livello.parteDelTubo["height"]*3)
	self.x_tubo = self.x_tubo+self.spazio_fra_tubi
	
		--quinta colonna di tubi	
	love.graphics.draw(livello.parteDelTubo["image"], self.x_tubo, 0)
	love.graphics.draw(livello.parteDelTubo["image"], self.x_tubo, livello.parteDelTubo["height"])
	love.graphics.draw(livello.tuboInBasso["image"], self.x_tubo, livello.parteDelTubo["height"]*2)
	
	love.graphics.draw(livello.tuboInAlto["image"], self.x_tubo, livello.parteDelTubo["height"]*4)
	
	livello:controlloCollisione(self.x_tubo, livello.parteDelTubo["height"]*3, livello.parteDelTubo["height"]*4)
end
