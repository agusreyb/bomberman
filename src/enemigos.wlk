import wollok.game.*

class Enemigo {
	var property position
	var property image = "enemigo3.png"
	var property direccion
	
	method esPeligroso() = true
	method colision(personaje){} //QUEDA VACIO YA QUE PUEDE PASAR POR ENCIMA
	
	method moverse(personaje, sentido){
		personaje.position(sentido.mover(personaje.position()))
	}
	
	method encontrarEnemigo() {
		game.say(enemigo, "Cuidado!")
		self.removerVida()
	
}

class EnemigosQueCorren inherits Enemigo {
}

class EnemigosQueCaminan inherits Enemigo {
}


