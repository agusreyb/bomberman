import wollok.game.*
import movimientos.*
import bomberman.*
import objects.*

class Enemigo {
	const velocidad = 400
	var property position
	var property image 
	var property direccion = izquierda
	var property destruible=true
	
	method iniciar(){
		game.onTick(velocidad,"moverEnemigo",{self.siguientePosicion()})}

	method siguientePosicion(){
		self.mover(direccion.mover(position))
	}
	
	method mover(_position) {
		const proximaPosition= _position
		if(self.validarPosition(proximaPosition)) {
			position = proximaPosition
			direccion.mover(position)
		} else {
			movimientos.volver(self, direccion)
		}
	}
	
	//Valida posicion 
	method validarPosition(_position) {
		return self.validarPaso(_position) && mundo.validarPosition(_position)
	}

	method validarPaso(_position) {
		return self.puedePasar(_position)
	}
	
	method puedePasar(_position) {
		return 	game.getObjectsIn(_position).
				all({visual => visual.atravesable()} )	
	}

	method seChocaPared(){
		movimientos.volver(self, direccion)
	}
	method esPeligroso() = true
	
	method colision(personaje){
		game.say(personaje, "Cuidado!")
	    personaje.fueHit()
	    bomberman.posicionInicial()}
	
	method encontrarBomber(){
		//sacar vida al bomber y que vuelva a iniciar desde position original
	}
	
    //method encontrarEnemigo() {
	//	game.say(enemigo, "Cuidado!")
	//	
	//}

   method hitFuego(){ //TIENE QUE RESTAR VIDA, CODEAR:
	game.removeVisual(self)
  }


}


class EnemigosQueCorren inherits Enemigo {/*naranja */
	override method image()= "enemigo1.png"
	override method direccion() = izquierda
}
	
class EnemigosQueCaminan inherits Enemigo {/*azul */
	override method image()= "enemigo2.png"
	override method direccion() = arriba
	
}

class EnemigosVerdes inherits Enemigo {
	override method direccion() = derecha
	override method image()= "enemigo3.png"

}


