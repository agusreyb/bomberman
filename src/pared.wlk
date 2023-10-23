import bomberman.*
import wollok.game.*
import niveles.*
import bomba.*
class Cemento {
	method colision(entidad){
	   	entidad.seChocaPared()}
}

class Pared inherits Cemento {
	var property position
	var property image = "pared.png"
	var property destruible = false
	method esPeligroso() = false
    method hitFuego(){} //NO HACE NADA 
    method atravesable () = true
}
      
class Ladrillo inherits Cemento  {
	var property position 
	var property image = "ladrillo.png"
	var property destruible = true
    method hitFuego(){
    	game.removeVisual(self)
    }  
    method atravesable () = true
}