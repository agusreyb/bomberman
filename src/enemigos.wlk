import wollok.game.*
import movimientos.*
import bomberman.*
import objects.*
import niveles.*

class Enemigo {
	const velocidad = 400
	var property position
	var property image 
	var property destruible=true
	var property atravesable = false
	var property direccion
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
	method colision(entidad){
		game.say(entidad, "Cuidado!")
	    entidad.fueHit()
	    bomberman.posicionInicial()}
	method encontrarBomber(){
		//sacar vida al bomber
	}
   method hitFuego(){ 
	game.removeVisual(self)
	//cantidadEnemigos--
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
