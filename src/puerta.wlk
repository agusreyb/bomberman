import wollok.game.*
import main.*

class Puerta { 
	var property position
	var property image = "puerta.png"
	
	method esPeligroso() = false
	
	method atravesable() = true
	
	method abrirPuerta() {
		self.image("puerta.png")
		keyboard.enter().onPressDo({ main.pasoDeNivel()})
	}	
	

	
}