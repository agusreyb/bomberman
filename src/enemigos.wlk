import wollok.game.*
import movimientos.*
import bomberman.*

class Enemigo {
	const velocidad = 400
	var property position
	var property image 
	var property direccion = left
	var property destruible=true
	var property nuevoSentido = left
	
	method iniciar(){
		game.onTick(velocidad,"moverEnemigo",{self.mover()})}
	method mover(){
		position = position.direccion(1)
	}

	method seChocaPared(){
    movimientos.volverEne(self, direccion)
	}	

	method cambiarSentido(cambioDeDireccion){
		direccion = cambioDeDireccion
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
}
	
class EnemigosQueCaminan inherits Enemigo {/*azul */
	override method image()= "enemigo2.png"
	//var property direccion =  up
	override method mover(){
		position = position.direccion(1)}
}

class EnemigosVerdes inherits Enemigo {
	//override method direccion() =  right
	override method image()= "enemigo3.png"
	override method mover(){
		position = position.direccion(1)
	}
}


