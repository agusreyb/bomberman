import wollok.game.*
import niveles.*
import objects.*
import bomberman.*
import puerta.*
import vida.*

object main {
	var property nivelActual = 0
	var property niveles = []
	
	method iniciarPantallaCarga() {			//metodo para iniciar la pantalla de carga
		self.configuracionInicial()
		game.addVisual(fondo)
		self.jugarOSalir()
	}	
	method jugarOSalir() {					//metodo jugar o salir
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
	
	method configuracionInicial() {			//metodo para setear la configuracion inicial de la pantalla
		game.title("BomberMan 2023")
		game.height(15)
		game.width(23)
		game.cellSize(50)
		game.boardGround("ground.png")	
	}	
	method configurarTeclas(){				//seteo de teclas del juego aca
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
	
	method cargarNiveles() {				//metodo para cargar los niveles
		const nivelUno = new NivelUno()
		const nivelDos = new NivelDos()
		const nivelTres = new NivelTres()
		const nivelCuatro = new NivelCuatro()
		return [nivelUno, nivelDos, nivelTres, nivelCuatro]
	}		
			
	method nivel(){							//metodo para devolver el nivel
		return niveles.get(nivelActual)
	}
	
	method validarNivel() {					//metodo para validar el nivel
		return nivelActual == niveles.size()
	}	
	
	method pasoDeNivel() {					//metodo para el pasaje de nivel
		sonido.stopMusica()
		game.clear()
		nivelActual++
		self.iniciar()
	}	
	
	method iniciar() {						//metodo para iniciar el juego segun level
		sonido.reproducirMusica("musicaJuego.mp3", 0.03)
		self.configuracionInicial()
		self.configurarTeclas();
		game.addVisual(consola)
		if(!self.validarNivel()) {
			self.nivel().iniciarNivel()
		} else {
			self.terminarJuego(finDelJuegoGanador)
		}
	}
	
	method terminarJuego(estado){			//metodo para terminar el juego
		sonido.stopMusica()
		game.clear()
		self.configuracionInicial()
		estado.mostrarCartel()
		self.jugarOSalir()
	}	
	

}	

