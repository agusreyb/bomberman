import wollok.game.*
import main.*
import objects.*
import bomberman.*
import pared.*
import puerta.*
import bomba.*
import enemigos.*
import movimientos.*

class Nivel {
	var property cantidadEnemigos = 0
    var property elementos = []
	method iniciarNivel() {					//metodo para iniciar el nivel
		self.cargarMapa()
		self.iniciarPersonaje()
	}
	method iniciarPersonaje() {				//metodo para iniciar el personaje
		game.addVisualCharacter(bomberman)
		(0..2).forEach({elem => bomberman.agregarVida()}) //setea la cantidad de vida, 0;2=3 vidas
	} 
	method cargarMapa(){
		self.borde().forEach({par => self.iniciarPared(par)})		//setea el mapa segun el nivel
		self.paredes().forEach({par => self.iniciarPared(par)})
		self.ladrillos().forEach({lad => self.iniciarLadrillo(lad)})
		self.enemigosNaranjas().forEach({list => self.iniciarNaranjas(list)})
		self.enemigosAzules().forEach({list => self.iniciarAzules(list)})
		self.enemigosVerdes().forEach({list => self.iniciarVerdes(list)})
	}
	method paredes()
	method ladrillos()
	method borde(){
		return [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0],[10,0],[11,0],[12,0],[13,0],[14,0],[15,0],[16,0],[17,0],[18,0],[19,0],[20,0],[21,0],
                 [22,0],[22,1],[22,2],[22,3],[22,4],[22,5],[22,6],[22,7],[22,8],[22,9],[22,10],[22,11],[22,12],[22,13],[22,14],
                 [0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[0,8],[0,9],[0,10],[0,11],[0,12],[0,13],[0,14],
                 [1,14],[2,14],[3,14],[4,14],[5,14],[6,14],[7,14],[8,14],[9,14],[10,14],[11,14],[12,14],[13,14],[14,14],[15,14],[16,14],[17,14],[18,14],[19,14],[20,14],[21,14]]
	}
	method enemigosNaranjas()
	method enemigosAzules()	
	method enemigosVerdes()
	method iniciarPuerta(x, y) {
		game.addVisual(new Puerta(image= "puerta.PNG",position = game.at(x, y)))
	}
	method iniciarPared(par) {
		game.addVisual(new Pared(position = game.at(par.get(0), par.get(1))))
	}
	method iniciarLadrillo(lad) {
	    game.addVisual(new Ladrillo(position = game.at(lad.get(0), lad.get(1))))
	}
	method iniciarNaranjas(list){
		const enemigo1 = new EnemigoNaranja(position=game.at(list.get(0), list.get(1)), image = "enemigo1.png")
		cantidadEnemigos++
		game.addVisual(enemigo1)
		game.whenCollideDo(enemigo1,{objeto => objeto.colision(enemigo1)})
		enemigo1.iniciar()

		}
	method iniciarAzules(list){
		const enemigo2 = new EnemigoAzul(position=game.at(list.get(0), list.get(1)), image = "enemigo1.png")
		cantidadEnemigos++
		game.addVisual(enemigo2)
		game.whenCollideDo(enemigo2,{objeto => objeto.colision(enemigo2)})
		enemigo2.iniciar()
	}
	method iniciarVerdes(list){
		const enemigo3 = new EnemigoVerde(position=game.at(list.get(0), list.get(1)), image = "enemigo3.png")
		cantidadEnemigos++
		game.addVisual(enemigo3)
		game.whenCollideDo(enemigo3,{objeto => objeto.colision(enemigo3)})
		enemigo3.iniciar()
	}
	method enemigoMuere() {
		cantidadEnemigos--
		self.puertaSpawn()
	}
	method puertaSpawn(){}
}

class NivelUno inherits Nivel{
	var property position = new Position(x = 1, y = 3)
	override method paredes(){
		 return  [[2,2],[4,2],[6,2],[8,2],[10,2],[12,2],[14,2],[16,2],[18,2],[20,2],
			     [2,4],[4,4],[6,4],[8,4],[10,4],[12,4],[14,4],[16,4],[18,4],[20,4],
	             [2,6],[4,6],[6,6],[8,6],[10,6],[12,6],[14,6],[16,6],[18,6],[20,6],
	             [2,8],[4,8],[6,8],[8,8],[10,8],[12,8],[14,8],[16,8],[18,8],[20,8],
	             [2,10],[4,10],[6,10],[8,10],[10,10],[12,10],[14,10],[16,10],[18,10],[20,10],
	             [2,12],[4,12],[6,12],[8,12],[10,12],[12,12],[14,12],[16,12],[18,12],[20,12]]
    } 
	override method ladrillos(){
		return  [[1,5],[1,7],[1,9],[1,11],[1,13],[3,3],[3,5],[3,7],[3,13],[5,1],[5,3],[5,5],[5,7],[5,9],
				[5,11],[5,13],[7,1],[7,3],[7,5],[7,7],[7,9],[7,11],[7,13],[9,1],[9,3],[9,5],[9,7],[9,13],
				[11,1],[11,3],[11,5],[11,7],[11,9],[11,11],[11,13],[13,1],[13,3],[13,7],[13,9],[13,11],
				[13,13],[15,1],[15,3],[15,7],[15,9],[15,11],[15,13],[17,1],[17,3],[17,5],[17,7],[17,9],
				[17,11],[17,13],[19,1],[19,3],[19,5],[19,7],[21,1],[21,3],[21,5],[21,7],[21,9],[21,11],[21,13]]}

	override method enemigosNaranjas() {
		return [[3,9],[15,5]]
	}
	override method enemigosAzules() {
		return [[9,11]]
	}
	override method enemigosVerdes(){
			return [[19,9]]
	}
	override method iniciarNivel(){		
		//self.iniciarPuerta(3, 10)
		super() 
		//COLISIONES//
        game.whenCollideDo(bomberman,{objeto => objeto.colision(bomberman)})
	    }
	override method puertaSpawn(){
		if(cantidadEnemigos == 0) {
			keyboard.v().onPressDo({door.ponerPuerta(position)})
			keyboard.q().onPressDo({door.abrirPuerta()})}
	}	
}

class NivelDos inherits Nivel{
	var property position = new Position(x = 19, y = 12)
	override method paredes(){
		 return  [[10,1],[16,1],[1,2],[2,2],[3,2],[6,2],[7,2],[9,2],[14,2],[19,2],
		 		 [4,3],[5,3],[6,3],[11,3],[13,3],[16,3],[17,3],[21,3],[7,4],[9,4],[19,4],
		 		 [6,5],[8,5],[10,5],[12,5],[14,5],[16,5],[17,5],[19,5],[21,5],
		 		 [1,6],[2,6],[4,6],[19,6],[5,7],[6,7],[8,7],[10,7],[12,7],[14,7],[16,7],
		 		 [2,8],[18,8],[20,8],[4,9],[6,9],[8,9],[10,9],[12,9],[14,9],[16,9],
		 		 [2,10],[18,10],[20,10],[2,11],[3,11],[4,11],[5,11],[6,11],[8,11],[10,11],[12,11],[14,11],[16,11],
		 		 [18,12],[20,12],[1,13],[2,13],[6,13],[8,13],[10,13],[12,13],[14,13],[16,13],[19,13]]
	}
	override method ladrillos(){
		return  [[1,11],[2,9],[3,6],[6,1],[6,6],[6,12],[8,3],[9,10],[11,6],[11,8],
				[12,3],[13,12],[16,2],[16,4],[16,6],[16,8],[16,10],[16,12],[18,5],
				[19,7],[19,11],[20,5],[10,3],[7,11]]
	}
	override method enemigosNaranjas() {
		return [[19,3],[11,12]]
	}
	override method enemigosAzules() {
		return [[3,7],[4,12],[12,1]]
	}
	override method enemigosVerdes(){
			return [[2,1],[8,1]]
	}
	override method iniciarNivel(){		
		self.iniciarPuerta(19, 12)
		super() 
		//COLISIONES//
	    game.whenCollideDo(bomberman,{objeto => objeto.colision(bomberman)})
	}
	override method puertaSpawn(){
		if(cantidadEnemigos == 0) {
			keyboard.v().onPressDo({door.ponerPuerta(position)})
			keyboard.q().onPressDo({door.abrirPuerta()})
		}
	}	
}

class NivelTres inherits Nivel{
	var property position = new Position(x = 2, y = 5)
	override method paredes(){
		 return  [[1,9],[2,9],[3,1],[3,3],[3,5],[3,9],[3,13],[4,7],[4,9],[4,11],
		 		 [5,4],[5,6],[5,7],[6,3],[6,7],[6,11],[7,11],[8,3],[9,3],[9,7],[9,9],[9,11],
		 		 [13,10],[14,1],[14,3],[14,5],[14,7],[14,9],[14,11],[14,13],[15,10],
		 		 [16,2],[16,3],[17,1],[17,4],[17,6],[17,10],[18,7],[19,4],[19,6],[19,10],
		 		 [21,4],[21,10]]
	} 

	override method ladrillos(){
		return  [[1,8],[2,8],[3,2],[3,4],[3,8],[3,12],[4,6],[4,8],[4,10],[5,3],[5,5],[5,8],[5,11],
				[6,6],[7,3],[7,8],[8,8],[8,11],[9,8],[9,10],[10,1],[10,2],[10,3],[10,4],[10,5],[10,6],
				[10,7],[10,8],[10,9],[10,10],[10,11],[10,12],[10,13],[11,1],[11,2],[11,3],[11,4],[11,5],
				[11,6],[11,7],[11,8],[11,9],[11,10],[11,11],[11,12],[11,13],[12,8],[13,8],[14,2],[14,4],
				[14,6],[14,8],[14,10],[14,12],[15,6],[15,8],[16,6],[16,8],[16,10],[17,2],[17,3],[17,8],
				[17,12],[18,4],[18,8],[18,10],[18,11],[18,13],[19,8],[20,4],[20,8],[20,10],[21,8]]
	}
	override method enemigosNaranjas() {
		return [[3,10],[7,12],[15,2],[19,9]]
	}
	override method enemigosAzules() {
		return [[6,9],[12,4],[12,12]]
	}
	override method enemigosVerdes(){
			return [[2,3],[7,5],[20,3]]
	}
	override method iniciarNivel(){		
		self.iniciarPuerta(2, 5)
		super() 
		//COLISIONES//
	    game.whenCollideDo(bomberman,{objeto => objeto.colision(bomberman)})
	}
	override method puertaSpawn(){
		if(cantidadEnemigos == 0) {
			keyboard.v().onPressDo({door.ponerPuerta(position)})
			keyboard.q().onPressDo({door.abrirPuerta()})
		}
	}	
}