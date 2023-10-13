import wollok.game.*
import niveles.*
import objects.*
import bomberman.*
import puerta.*
import vida.*

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
		game.width(23)
		game.cellSize(50)
		game.boardGround("ground.png")	
	}	
	method configurarTeclas(){
		//CONFIGURACION KEYS//
	 	keyboard.left().onPressDo({bomberman.imageLeft()})
	    // keyboard.left().onPressDo({bomberman.moverse(bomberman.position().left(0.1) )})      
	    keyboard.right().onPressDo({bomberman.imageRight()})
	    keyboard.up().onPressDo({bomberman.imageUp()})
	    keyboard.down().onPressDo({bomberman.imageDown()})
	    keyboard.space().onPressDo({bomberman.ponerBomba()})
	    keyboard.q().onPressDo({ pepe.abrirPuerta()})

		keyboard.l().onPressDo({ bomberman.fueHit()})

	}
	
	method cargarNiveles() {	
		const nivelUno = new NivelUno()
		const nivelDos = new NivelDos()
		const nivelTres = new NivelTres()
		const nivelCuatro = new NivelCuatro()
		return [nivelUno, nivelDos, nivelTres, nivelCuatro]
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
		self.configurarTeclas();
		game.addVisual(consola)
		if(!self.validarNivel()) {
			self.nivel().iniciarNivel()
		} else {
			self.terminarJuego()
		}
	}
	
	method terminarJuego(estado){
		sonido.stopMusica()
		game.clear()
		self.configuracionInicial()
		estado.mostrarCartel()
		self.jugarOSalir()
	}	
	

}	

