import bomberman.*
import wollok.game.*
import niveles.*
import bomba.*


class Pared {
	var property position
	var property image = "pared.png"
	
	method esPeligroso() = false
	
	method colision(personaje){
	    personaje.seChocaPared()}
	  
    method hitFuego(){} //NO HACE NADA 
}

class Ladrillo {
	var property position
	var property image = "ladrillo.png"
	var property vida = 1
	
	method esPeligroso() = false
	
	method colision(personaje){
	    personaje.seChocaPared()}
	    
	method hitFuego(){
	 game.removeVisual(self)
		
	}    
}