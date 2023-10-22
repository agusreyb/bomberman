import wollok.game.*
import movimientos.*

class Enemigo {
	var property position
	var property image 
	var property direccion = izquierda
	var property destruible=true
	
	method iniciar(){
//		movimientos.moverse(direccion,self)
	}
	
	method esPeligroso() = true
	method colision(personaje){} //QUEDA VACIO YA QUE PUEDE PASAR POR ENCIMA
	
	method encontrarBomber(){
		//sacar vida al bomber y que vuelva a iniciar desde position original
	}
	
//	method encontrarEnemigo() {
//		game.say(enemigo, "Cuidado!")
//		self.removerVida()
//	}

	method hitFuego(){ //TIENE QUE RESTAR VIDA, CODEAR:
		game.removeVisual(self)
	}
  
}

class EnemigosQueCorren inherits Enemigo {/*naranja */
	override method image()= "enemigo1.png"
}
	
class EnemigosQueCaminan inherits Enemigo {/*azul */
	override method image()= "enemigo2.png"
}

class EnemigosVerdes inherits Enemigo {
	override method image()= "enemigo3.png"
}


