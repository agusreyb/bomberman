import wollok.game.*
import niveles.*
import objects.*
import bomberman.*

object main {
	var property nivelActual = 0
	var property niveles = []
	
		method iniciarPantallaCarga() {
			self.configuracionInicial()
			game.addVisual(fondo)
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
	
		method configuracionInicial() {
			game.title("BomberMan 2023")
			game.height(15)
			game.width(20)
			game.cellSize(50)
			game.boardGround("fondo3.jpg")
			//CONFIGURACION KEYS//
			keyboard.left().onPressDo({bomberman.imageLeft()})
	        keyboard.right().onPressDo({bomberman.imageRight()})
	        keyboard.up().onPressDo({bomberman.imageUp()})
	        keyboard.down().onPressDo({bomberman.imageDown()})
	        keyboard.space().onPressDo({bomberman.ponerBomba()})
	}
	
	method cargarNiveles() {	
			const nivelUno = new NivelUno()
			//const nivelDos = new NivelDos()
			//const nivelTres = new NivelTres()
			//const nivelCuatro = new NivelCuatro()
			return [nivelUno]//aca habria q agregar los niveles una vez q esten completos
	}		
			
	method nivel(){
		return niveles.get(nivelActual)
	}
	method validarNivel() {
		return nivelActual == niveles.size()
	}	
	method pasoDeNivel() {
		//sonido.stopMusica()
		game.clear()
		nivelActual++
		self.iniciar()
	}	
	method iniciar() {
		sonido.reproducirMusica("musicaJuego.mp3", 0.03)// NO ANDA CON WAV nose porq
		self.configuracionInicial()
		game.addVisual(consola)
		if(!self.validarNivel()) {
			self.nivel().iniciarNivel()
		} else {
			self.terminarJuego()
		}
	}
	method terminarJuego(){
		//sonido.stopMusica()
		game.clear()
		self.configuracionInicial()
		self.jugarOSalir()
	}	
}	

