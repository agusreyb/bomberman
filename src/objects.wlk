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

object fondo {												//objeto para el fondo de carga
	const property position = game.at(0,0)
	const property image = "fondocarga.png" 
}

object consola {
	const property position = game.at(15,-1)
}

object sonido{
	var audio
    var musica
    
    method reproducirSonido(sonido, volumen) {				//funcion para reproducir un sonido por parametro
        audio = game.sound(sonido)
		self.reproducir(volumen, audio)
    }	
    method reproducir(volumen, type){
    	type.volume(volumen)
        type.play()
    }   
     
    method reproducirMusica(sonido, volumen) {			//funcion para reproducir musica por parametro
        musica = game.sound(sonido)
		self.reproducir(volumen, musica)
    }
    
    method stopMusica(){								//metodo para stopear la musica
    	musica.stop()
    }
        
}

object menosVida {									//objeto para mostrar la img de menos vida
	var property image = "menosVida.png"

}

object finDelJuego {								//objeto para setear el endgame
	const property position = game.at(0,0)
	const property image = "finDelJuego.jpg" 
	
	method mostrarCartel(){							//muestra el cartel de endgame
		sonido.reproducirSonido("gameOver.mp3", 0.03)
		game.addVisual(self)
	}
	
	
}

object finDelJuegoGanador {
	const property position = game.at(0,0)
	const property image = "ganador.jpg" 
	
	method mostrarCartel(){
		sonido.reproducirSonido("ganaste.mp3", 0.03)
		game.addVisual(self)
	}


