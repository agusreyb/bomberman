import wollok.game.*

class Enemigo {
	var property position
	var property image = "enemigo3.png"
	var property direccion = 0
	
	method esPeligroso() = true
	method colision(personaje){} //QUEDA VACIO YA QUE PUEDE PASAR POR ENCIMA
}

class EnemigosQueCorren inherits Enemigo {
}

class EnemigosQueCaminan inherits Enemigo {
}


