import wollok.game.*
import movimientos.*
import bomberman.*
import objects.*
import niveles.*
import main.*

class Enemigo {
	var property position
	var property image 
	var property destruible=true
	var property atravesable = true
	var property direccion
	method velocidad ()= 400
	method iniciar(){
    game.onTick(self.velocidad(),"moverEnemigo",{self.siguientePosicion()})
    }
	method siguientePosicion(){
		self.mover(direccion.mover(position))
		}
	method mover(_position) {
		const proximaPosition= _position
		if(self.validarPosition(proximaPosition)) {
			position = proximaPosition
			direccion.mover(position)
		} else {
			self.cambiarDireccion()
		}
	}
	//Valida posicion 
	method validarPosition(_position) {
		return self.validarPaso(_position) and bordes.validarPosition(_position)
	}
	method validarPaso(_position) {
		return self.puedePasar(_position)
	}
	method puedePasar(_position) {
		return 	game.getObjectsIn(_position).
				all({visual => visual.atravesable()} )	
	}
	method encontrarBomber(){
	movimientos.volver(self, direccion)
	}
	method cambiarDireccion(){
		if(direccion.equals(izquierda)){
			direccion = derecha
		} else {
			direccion = izquierda
		}
	}
	method colision(entidad){
	    entidad.fueHit()
	    bomberman.posicionInicial()
	}	
  	method hitFuego(){ 
		game.removeVisual(self)
		main.nivel().enemigoMuere()
  	}
}

class EnemigoNaranja inherits Enemigo {
	override method image()= "enemigo1.png"
}

class EnemigoAzul inherits Enemigo {
	override method image()= "enemigo2.png"

		override method cambiarDireccion(){
		if(direccion.equals(arriba)){
			direccion = abajo
		} else {
			direccion = arriba}
	}
}
	
class EnemigoVerde inherits Enemigo {
	override method image()= "enemigo3.png"
	override method velocidad ()= 100
}