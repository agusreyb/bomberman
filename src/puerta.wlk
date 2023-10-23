import wollok.game.*
import main.*

class Puerta { 
	//var property position
	var property position = new Position(x = 1, y = 1)
	var property image = "puerta.png"
	var property destruible=false
	//method esPeligroso() = false
	method atravesable() = true
	method abrirPuerta() { 						//metodo abrir puerta, sirve para el pasaje de nivel
		self.image("puerta.png")
		keyboard.enter().onPressDo({ main.pasoDeNivel()})
	}	
    method colision(personaje){} //QUEDA VACIO YA QUE PUEDE PASAR POR ENCIMA
}

object door inherits Puerta {
		method ponerPuerta(position){
		const puerta = new Puerta(position = position)
		game.addVisual(puerta) 
	}
}