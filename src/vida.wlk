import bomberman.*
import wollok.game.*

class Vida {								//clase para la vida del personaje
	var property position
	var property image = "vida.png"
	var property destruible = false
	
	method colision(personaje){}
	method atravesable() = true
	
	method fueHit(){	
		bomberman.agregarVida()
		game.removeVisual(self)
	}
}