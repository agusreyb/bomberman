import bomberman.*
import wollok.game.*
import niveles.*
import bomba.*


class Pared {
	var property position
	var property image = "pared.png"
	var property destruible=false
	
	method esPeligroso() = false
	
	method colision(personaje){
	    personaje.seChocaPared()}
	    
	method colisionEnemigo(enemigo){
	   	enemigo.seChocaPared()}
	    
    method hitFuego(){} //NO HACE NADA 
}

class Ladrillo {
	var property position 
	var property image = "ladrillo.png"
	var property destruible=true
	//var property vida = 1
	
	//method esPeligroso() = false
	
	method colision(personaje){
	    personaje.seChocaPared()}
	       
    method hitFuego(){
    	game.removeVisual(self)
    }
    

}

	
	
	
	
	
