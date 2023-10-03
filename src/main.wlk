import wollok.game.*
import niveles.*
import objects.*

object main {
	
	var property nivelActual = 0
	var property niveles = []
	
method iniciarPantallaCarga() {
		self.configuracionInicial()
		//game.addVisual(fondo)
		self.jugarOSalir()
	}	
method jugarOSalir() {
			keyboard.enter().onPressDo( {
			game.clear()
			self.configuracionInicial()
			nivelActual = 0
			niveles = self.cargarNiveles()
			self.iniciar()
		}  )
		keyboard.p().onPressDo( {
			game.clear()
			game.stop()
		}  )
	}
	
	method cargarNiveles() {	
		const nivelUno = new NivelUno()
		const nivelDos = new NivelDos()
		const nivelTres = new NivelTres()
		const nivelCuatro = new NivelCuatro()
		
		return [nivelUno, nivelDos, nivelTres, nivelCuatro]
	}		
	
	method configuracionInicial() {
		game.title("BomberMan 2023")
		game.height(15)
		game.width(20)
		game.cellSize(50)
		game.boardGround("fondo.jpg")
	}		

	method iniciar() {
		//sonido.reproducirMusica("musicaJuego.mp3", 0.03)
		self.configuracionInicial()
		//game.addVisual(consola)
		if(!self.validarNivel()) {
			self.nivel().iniciarNivel()
		} else {
			self.terminarJuego()
		}
	}
	
	method nivel(){
		return niveles.get(nivelActual)
	}
	
	method validarNivel() {
		return nivelActual == niveles.size()
	}	
	
	method terminarJuego(){
		//sonido.stopMusica()
		game.clear()
		self.configuracionInicial()
		self.jugarOSalir()
	}
		
}	

