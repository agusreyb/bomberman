import bomberman.*
import wollok.game.*
import niveles.*
import bomba.*
class Cemento {
	var property position
	method hitFuego(){}
    method atravesable () = false
	method colision(entidad){
	   	
	   	entidad.seChocaPared()}
}

class Pared inherits Cemento {		//estas son paredes que no se pueden destruir
	var property image = "pared.png"
	var property destruible = false
}
      
class Ladrillo inherits Cemento  {	//estos son ladrillos que se pueden destruir
	var property image = "ladrillo.png"
	var property destruible = true
    override method hitFuego(){
          game.removeVisual(self)
    }
}

