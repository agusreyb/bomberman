import wollok.game.*
import movimientos.*
import bomberman.*

class Enemigo {
	const velocidad = 400
	var property position
	var property image 
	var property direccion = izquierda
	var property destruible=true
	
	method iniciar(){
		game.onTick(velocidad,"moverEnemigo",{self.mover()})
//		movimientos.moverse(direccion,self)
	}
	method mover(){
		position = position.left(1)

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
}
	
class EnemigosQueCaminan inherits Enemigo {/*azul */
	override method direccion() = arriba
	override method image()= "enemigo2.png"
	override method mover(){
		position = position.up(1)}
	
}

class EnemigosVerdes inherits Enemigo {
	override method direccion() = derecha
	override method image()= "enemigo3.png"
	override method mover(){
		position = position.right(1)
	}
}


