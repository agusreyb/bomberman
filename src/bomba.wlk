import wollok.game.*
import bomberman.*
import objects.*
import wollok.game.*
import pared.*

class Bomba {
	var property position = 0
	var property duration = 2000 //EN MILISEGUNDOS, SERIAN 2s
	var property image = "bomb.png" //CAMBIAR IMAGEN
	
	method colision(personaje){} //QUEDA VACIO YA QUE PUEDE PASAR POR ENCIMA

	//method explotar(){}

}

class Fuego {
	var property position = 0
	var property duration = 400 //EN MILISEGUNDOS, SERIAN 0.4s
	var property image = "fire.png"
	var property potencia = 0
	
	method esColision(){
		return (game.getObjectsIn(position).isEmpty())
	}

	method colision(personaje){} //QUEDA VACIO YA QUE PERSONAJE PUEDE PASAR POR ENCIMA

}

object bomba inherits Bomba {
	
	var property durationBomba = 2000
	var property bombapowup = 1
    
	method ponerBomba(){
		const bomba = new Bomba(position = bomberman.position())
		fuego.ponerFuego()
		game.schedule(durationBomba, {=> self.cicloBomba(bomba,fuego.fuegos())})
		game.addVisual(bomba)
		sonido.reproducirMusica("mecha.wav", 0.25)
	    
   } // FUNCIONA !! :O //
	
	
	method cicloBomba(bomba,fuegos){
		game.removeVisual(bomba)
		fuegos.forEach{ fueguito => game.addVisual(fueguito)}
		sonido.reproducirMusica("explosion.wav", 0.15)
		fuego.colisionFuego() //COLISION CON OBJETOS
		game.schedule(fuego.durationFuego(), {=> fuegos.forEach{ fueguito => game.removeVisual(fueguito)}}) 
	   
	   }
	
	 method queNivel(cadafuego)=cadafuego.potencia() < bombapowup
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
		const fuegoUp2 = new Fuego(position = bomberman.position().up(2) , potencia=2)
		const fuegoDown2 = new Fuego(position = bomberman.position().down(2) , potencia=2)
		const fuegoLeft2 = new Fuego(position = bomberman.position().left(2), potencia=2)
		const fuegoRight2 = new Fuego(position = bomberman.position().right(2), potencia=2)
		
		fuegosTotales = [fuegoUp, fuegoDown, fuegoLeft, fuegoRight, fuegoUp2, fuegoDown2, fuegoLeft2, fuegoRight2]
		fuegos = fuegosTotales.filter({cadafuego => self.filtrarFuego(cadafuego)})
		fuegos.add(fuegoCentro)	
       
        
    }
	
	method filtrarFuego(cadafuego){
	  
	  return (cadafuego.potencia() <= bomba.bombapowup()) and (cadafuego.esColision())}
	
	method colisionFuego(){
	 
       fuegos.forEach{fuego => game.whenCollideDo(fuego,{objeto => objeto.hitFuego()})}
	
	 	
	 	
	 }
	  
	  
	  
	 
	
	    //COLISION//
   
	
	
	
}