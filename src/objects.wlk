import wollok.game.*
import niveles.*
import bomberman.*

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

object fondo {
	const property position = game.at(0,0)
	const property image = "fondo2.jpg" 
}

class Bomba {
	const property position
	var property duration = 2000 //EN MILISEGUNDOS, SERIAN 2s
	var property image = "bomb.png" //CAMBIAR IMAGEN

//method position()= game.at(bomberman.position().x(),bomberman.position().y())

//	method posicionBomber() = bomberman.position().x().y()

//	method ponerBomba(){
//		game.addVisualIn(self, self.position())
//		game.schedule(duration, {game.removeVisual(self)}) 
//}

	method explotar(){}

}




object consola {
	const property position = game.at(15,-1)
}

object sonido{
	var audio
    var musica
    
    method reproducirSonido(sonido, volumen) {
        audio = game.sound(sonido)
		self.reproducir(volumen, audio)
    }	
    method reproducir(volumen, type){
    	type.volume(volumen)
        type.play()
    }   
     
    method reproducirMusica(sonido, volumen) {
        musica = game.sound(sonido)
		self.reproducir(volumen, musica)
    }
        
}

