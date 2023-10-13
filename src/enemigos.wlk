import wollok.game.*

class Enemigo {
	var property position
	var property image = "enemigo3.png"
	var property direccion
	
	method esPeligroso() = true
	method atravesable() = true
}

class EnemigosQueCorren inherits Enemigo {
}

class EnemigosQueCaminan inherits Enemigo {
}


