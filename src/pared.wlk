class Pared {
	var property position
	var property image = "bloque.png"
	
	method esPeligroso() = false
	
	method atravesable() = false
}

class Ladrillo {
	var property position
	var property image = "ladrillo.png"
	
	method esPeligroso() = false
	
	method atravesable() = false
}