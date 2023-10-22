import wollok.game.*

class Enemigo {
	var property position
	var property image = "enemigo2.png"
	var property direccion = 0
	
	method esPeligroso() = true
	method colision(personaje){} //QUEDA VACIO YA QUE PUEDE PASAR POR ENCIMA
	
	method moverse(personaje, sentido){
		personaje.position(sentido.mover(personaje.position()))
	}
	
	method encontrarEnemigo() {
		game.say(enemigo, "Cuidado!")
		self.removerVida()
	}

   method hitFuego(){ //TIENE QUE RESTAR VIDA, CODEAR:
	game.say(self, " El fuego me pega " )
  }
}
class EnemigosQueCorren inherits Enemigo {
}

class EnemigosQueCaminan inherits Enemigo {
}


