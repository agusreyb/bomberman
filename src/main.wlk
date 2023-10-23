import wollok.game.*
import niveles.*
import objects.*
import bomberman.*
import puerta.*
import vida.*
import puerta.*
import movimientos.*
import bomba.*

object alternarPantallaDeInicio{
	var property imagenAlternada= true 
	method iniciarAnimacion(){
		game.onTick(250,"animacionMenu",{self.cambiar()})
	}
	method cambiar(){
		if(imagenAlternada){
			self.fondofalse()
			fondo.image("fondocarga.png")
		}else{
			self.fondotrue()
			fondo.image("fondocarga2.png")
		}
	}
	method fondotrue(){ imagenAlternada=true}
	method fondofalse(){imagenAlternada=false}
	method terminarAnimacion(){
		game.removeTickEvent("animacionMenu")
	}
}

object main {
	var property nivelActual = 0
	var property niveles = []
	var property position = new Position(x = 1, y = 3) //HARDCORE PARA TESTEAR LA PUERTA
	method iniciarPantallaCarga() {			//metodo para iniciar la pantalla de carga
		self.configuracionInicial()
		game.addVisual(fondo)
		alternarPantallaDeInicio.iniciarAnimacion()
		self.jugarOSalir()
	}	
	method jugarOSalir() {					//metodo jugar o salir
		keyboard.enter().onPressDo( {
		alternarPantallaDeInicio.terminarAnimacion()
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
	method configuracionInicial() {  //metodo para setear la configuracion inicial de la pantalla
			game.title("BomberMan 2023")
			game.height(15)
			game.width(23)
			game.cellSize(50)
			game.boardGround("ground.png")//aca un fondo inicial deberia ir 
			}	
	method configurarTeclas(){
			//CONFIGURACION KEYS//
		    keyboard.left().onPressDo{(bomberman.imageLeft()) 
		    	                       bomberman.direccion(izquierda)}
	        keyboard.right().onPressDo{(bomberman.imageRight())
	        	                        bomberman.direccion(derecha)}
	        keyboard.up().onPressDo{(bomberman.imageUp())
	                                 bomberman.direccion(arriba)}
	        keyboard.down().onPressDo{(bomberman.imageDown())
	        	                       bomberman.direccion(abajo)}
	        keyboard.space().onPressDo({bomba.ponerBomba()})
	       	keyboard.v().onPressDo({ door.ponerPuerta(position)})  //HARDCORE PARA TESTEAR LA PUERTA
			keyboard.q().onPressDo({ door.abrirPuerta()})  //HARDCORE PARA TESTEAR LA PUERTA
		//	keyboard.l().onPressDo({ bomberman.fueHit()})
	}

	method cargarNiveles() {				//metodo para cargar los niveles
		const nivelUno = new NivelUno()
		const nivelDos = new NivelDos()
		const nivelTres = new NivelTres()
		return [nivelUno, nivelDos, nivelTres]
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