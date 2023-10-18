import wollok.game.*
import main.*

class Puerta { 
	//var property position
	var property position = new Position(x = 1, y = 3)
	var property image = "puerta.png"
	
	method esPeligroso() = false
	
	method atravesable() = true
	
	method abrirPuerta() { 						//metodo abrir puerta, sirve para el pasaje de nivel
		self.image("puerta.png")
		keyboard.enter().onPressDo({ main.pasoDeNivel()})
	}	
    
    method colision(personaje){} //QUEDA VACIO YA QUE PUEDE PASAR POR ENCIMA


}

object door inherits Puerta {
		method ponerPuerta(){
		const puerta = new Puerta(position = position)
		game.addVisual(puerta) 
	}
	
	
}

//const pepe = new Puerta (position = [1,2])//hardcode para testear el pasaje



