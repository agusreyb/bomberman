import wollok.game.*
import niveles.*

object main {
	
method iniciarPantallaCarga() {
		self.configuracionInicial()
		//game.addVisual(fondo)
		self.jugarOSalir()
	}	
method jugarOSalir() {
		keyboard.enter().onPressDo( {
			game.clear()
			self.configuracionInicial()
			//nivelActual = 0
			//niveles = manager.cargarNiveles()
			//self.iniciar()
		}  )
		keyboard.space().onPressDo( {
			game.clear()
			game.stop()
		}  )
	}	
	
	method configuracionInicial() {
		game.title("BomberMan 2023")
		game.height(12)
		game.width(22)
		game.cellSize(50)
		game.boardGround("fondo.jpg")
	}		

	method iniciar() {
		//sonido.reproducirMusica("musicaJuego.mp3", 0.03)
		//manager.configuracionInicial()
		//manager.teclas();
		//game.addVisual(consola)
		//if(!self.validarNivel()) {
		//	self.nivel().iniciarNivel()
		//} else {
		//	self.terminarJuego(finDelJuegoGanador)
		}
	}
		
	
}
