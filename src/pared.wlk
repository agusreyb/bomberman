import bomberman.*
import wollok.game.*
import niveles.*
import bomba.*


class Pared {
	var property position
	var property image = "pared.png"
	var property esRompible=false
	
	method esPeligroso() = false
	
	method colision(personaje){
	    personaje.seChocaPared()}
    method hitFuego(){} //NO HACE NADA 
}

class Ladrillo {
	var property position 
	var property image = "ladrillo.png"
	var property esRompible=true
	//var property vida = 1
	
	//method esPeligroso() = false
	
	method colision(personaje){
	    personaje.seChocaPared()}
	       
    method hitFuego(){
    	game.removeVisual(self)
    }
    

}

//object ladrilloRompible inherits Ladrillo {
	
	// var property nivel = 0
	// var property positions = nivelUno.ladrillos()
	
	 
//	method ladrilloAeliminar(posicionFuego){
//		
//		if (positions.contains(posicionFuego)){
			//Ladrillo.position() = posicionFuego
			
	//	}
		
		
		
//	}
	
	
	
	
	
