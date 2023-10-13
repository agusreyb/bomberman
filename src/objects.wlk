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
	const property image = "fondocarga.png" 
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
    
    method stopMusica(){
    	musica.stop()
    }
        
}

object menosVida {
	var property image = "menosVida.png"

}

object finDelJuego {
	const property position = game.at(0,0)
	const property image = "finDelJuego.jpg" 
	
	method mostrarCartel(){
		sonido.reproducirSonido("gameOver.mp3", 0.03)
		game.addVisual(self)
	}
}


