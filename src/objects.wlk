import wollok.game.*
import niveles.*

class Plataforma {
	var property position
	var property image = "plataforma.png"
	
	method esPeligroso() = false
	
	method atravesable() = false
	

	
}

class Puerta {
	var property position
	var property image = "puerta.png"
	
	method esPeligroso() = false
	
	method atravesable() = true
	

	
}

class Pinches {
	var property position
	var property image = "pinche.png"
	
	method esPeligroso() = true
	
	method atravesable() = true

	method fueGolpeado() {
		game.removeVisual(self)
	}
	
	method fueAgarrado() {}
}

class Enemigo {
	var property position
	var property image = "enemigo.png"
	var property direccion
	
	method esPeligroso() = true
	
	method atravesable() = true
	

}

class EnemigosQueCorren inherits Enemigo {
	
	
}

class EnemigosQueCaminan inherits Enemigo {
	
	
}

