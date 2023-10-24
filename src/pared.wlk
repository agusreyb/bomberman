import bomberman.*
import wollok.game.*
import niveles.*
import bomba.*
class Cemento {
	method colision(entidad){
	   	entidad.seChocaPared()}
}

class Pared inherits Cemento {		//estas son paredes que no se pueden destruir
	var property position
	var property image = "pared.png"
	var property destruible = false
    method hitFuego(){} //NO HACE NADA 
    method atravesable () = false
}
      
class Ladrillo inherits Cemento  {	//estos son ladrillos que se pueden destruir
	var property position 
	var property image = "ladrillo.png"
	var property destruible = true
    method hitFuego(){
          game.removeVisual(self)
    }  
    
    method atravesable () = false
}

