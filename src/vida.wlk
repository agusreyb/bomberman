import bomberman.*
import wollok.game.*

class Vida {								//clase para la vida del personaje
	var property position
	var property image = "vida.png"
	
	method esPeligroso() = false
	method atravesable() = true
	
	method fueHit(){	
		bomberman.agregarVida()
		game.removeVisual(self)
	}
}