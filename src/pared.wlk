import bomberman.*
import wollok.game.*
import niveles.*
import bomba.*
class Cemento {
	method colision(personaje){
	   	personaje.seChocaPared()}
	method colisionEnemigo(enemigo){
	   	enemigo.seChocaPared()}
}

class Pared inherits Cemento {
	var property position
	var property image = "pared.png"
	var property destruible=false
	var property atravesable= true
	method esPeligroso() = false
    method hitFuego(){} //NO HACE NADA 
}
      
class Ladrillo inherits Cemento  {
	var property position 
	var property image = "ladrillo.png"
	var property destruible=true
	var property atravesable= true
    method hitFuego(){
    	game.removeVisual(self)
    }  
}