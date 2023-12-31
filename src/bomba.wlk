import wollok.game.*
import bomberman.*
import objects.*
import wollok.game.*
import pared.*

class Bomba {
	var property position = 0
	var property duration = 2000 //EN MILISEGUNDOS, SERIAN 2s
	var property image = "bomb.png" //CAMBIAR IMAGEN
	var property atravesable=false
	var property destruible=false
	method colision(personaje){} //QUEDA VACIO YA QUE PUEDE PASAR POR ENCIMA
    method hitFuego(){} //NO HACE NADA
}

class Fuego {
	var property position=0
	var property duration = 400 //EN MILISEGUNDOS, SERIAN 0.4s
	var property image = "fire.png"
	var property potencia = 0
	var property atravesable = true
	var property destruible = false
	
	//Chequea si el fuego puede aparecer en un lugar. Las condiciones para aparecer es que no haya nada o que si hay algo, si es destruible
	//method esColision()=(game.getObjectsIn(position).isEmpty()) or (game.getObjectsIn(position).get(0).destruible())	
	method esColision(){
		if(game.getObjectsIn(position).isEmpty()){
			return true		
		}else{
			return game.getObjectsIn(position).get(0).destruible()	
		}
	}
	
	method colision(personaje){} //QUEDA VACIO YA QUE PERSONAJE PUEDE PASAR POR ENCIMA
}

object bomba inherits Bomba {
	var property durationBomba = 2000
	var property bombapowup = 1
	var property cantBombas=1
	
	
	method ponerBomba(){
		if(cantBombas>0){
			cantBombas--
			self.crearBombas()
		}
   }
   
   	method crearBombas(){
   		const bomba = new Bomba(position = bomberman.position())
		fuego.ponerFuego()
		game.schedule(durationBomba, {=> self.cicloBomba(bomba,fuego.fuegos())})
		game.addVisual(bomba)
		sonido.reproducirSonido("mecha.wav", 0.25)
   	}
	method cicloBomba(bomba,fuegos){
		game.removeVisual(bomba)
		fuegos.forEach{ fueguito => game.addVisual(fueguito)}
		sonido.reproducirSonido("explosion.wav", 0.15)
		fuego.colisionFuego() //COLISION CON OBJETOS
		cantBombas++
		game.schedule(fuego.durationFuego(), {=> fuegos.forEach{ fueguito => game.removeVisual(fueguito)}}) 
	}
	method queNivel(cadafuego) = cadafuego.potencia() < bombapowup
}

object fuego inherits Fuego {
 	var property fuegosTotales = []
	var property fuegos =[]
    var property durationFuego = 400
	method ponerFuego(){
		const fuegoCentro = new Fuego(position = bomberman.position() , potencia=1)
		const fuegoUp = new Fuego(position = bomberman.position().up(1) , potencia=1)
		const fuegoDown = new Fuego(position = bomberman.position().down(1) , potencia=1)
		const fuegoLeft = new Fuego(position = bomberman.position().left(1), potencia=1)
		const fuegoRight = new Fuego(position = bomberman.position().right(1), potencia=1)
		fuegosTotales = [fuegoUp, fuegoDown, fuegoLeft, fuegoRight]
		fuegos = fuegosTotales.filter({cadafuego => self.filtrarFuego(cadafuego)})
		fuegos.add(fuegoCentro)	
    }
	method filtrarFuego(cadafuego) = (cadafuego.potencia() <= bomba.bombapowup()) and (cadafuego.esColision())
	method colisionFuego(){
	  fuegos.forEach{fuego => game.whenCollideDo(fuego,{objeto => objeto.hitFuego()})}}
}