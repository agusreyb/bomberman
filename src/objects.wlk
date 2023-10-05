import wollok.game.*
import niveles.*
import bomberman.*

class Pinches {
	var property position
	var property image = "pinche.png"
	
	method esPeligroso() = true
	method atravesable() = true
	method fueGolpeado() {
		game.removeVisual(self)
	}
}

object fondo {
	const property position = game.at(0,0)
	const property image = "fondocarga.jpg" 
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

