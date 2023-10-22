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
	  
    //method hitFuego(posicionFuego){} //NO HACE NADA 
}

class Ladrillo {
	var property position = 0
	var property image = "ladrillo.png"
	var property vida = 1
	
	method generar(){game.addVisual(self)}
	
	
	method colision(personaje){
	    personaje.seChocaPared()}
	       
    method hitFuego(){
    	game.removeVisual(self)
    	
    }

}

object ladrilloRompible inherits Ladrillo  {
	
	   var property elementos = []
	
	method construir(lad) { 
		elementos.add(new Ladrillodemapa (position = game.at(lad.get(0), lad.get(1))))
	    } 
	
	method crearele(){
		elementos.forEach{elemento => elemento.generar()}}
	
	//game.at(lad.get(0), lad.get(1)) 
	
	// var property nivel = 0
	// var property positions = nivelUno.ladrillos()
	
	 
//	method ladrilloAeliminar(posicionFuego){
//		
//		if (positions.contains(posicionFuego)){
			//Ladrillo.position() = posicionFuego
			
	//	}
				
}


class Ladrillodemapa inherits Ladrillo {
	
	
}
	
	
	
	
