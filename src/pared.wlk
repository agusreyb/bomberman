import bomberman.*

class Pared {
	var property position
	var property image = "pared.png"
	
	method esPeligroso() = false
	
	method colision(personaje){
	    personaje.seChocaPared()}
}

class Ladrillo {
	var property position
	var property image = "ladrillo.png"
	
	method esPeligroso() = false
	
	method colision(personaje){
	    personaje.seChocaPared()}
}