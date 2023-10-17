import wollok.game.*
import main.*
import objects.*
import bomberman.*
import pared.*
import puerta.*
import bomba.*
import enemigos.*

class Nivel {
	var property cantidadEnemigos = 1

	
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
		self.enemigo().forEach({ene => self.iniciarEnemigo(ene)})
		
		//self.pinches().forEach({par => self.iniciarPinches(par)})
		
		//self.enemigosQueCorren().forEach({par => self.iniciarEnemigo(par)})
		
		//self.enemigosQueCaminan().forEach({par => self.iniciarCaminante(par)})
	}
	
	method paredes()
	method ladrillos()

	method enemigo()
	method borde(){
		return [[0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0],[10,0],[11,0],[12,0],[13,0],[14,0],[15,0],[16,0],[17,0],[18,0],[19,0],[20,0],[21,0],
                 [22,0],[22,1],[22,2],[22,3],[22,4],[22,5],[22,6],[22,7],[22,8],[22,9],[22,10],[22,11],[22,12],[22,13],[22,14],
                 [0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[0,8],[0,9],[0,10],[0,11],[0,12],[0,13],[0,14],
                 [1,14],[2,14],[3,14],[4,14],[5,14],[6,14],[7,14],[8,14],[9,14],[10,14],[11,14],[12,14],[13,14],[14,14],[15,14],[16,14],[17,14],[18,14],[19,14],[20,14],[21,14]]
	}
	//method pinches()
	//method enemigosQueCorren()
	//method enemigosQueCaminan()	
	
	method iniciarPuerta(x, y) {
		game.addVisual(new Puerta(image= "puerta.PNG",position = game.at(x, y)))
	}
	method iniciarPared(par) {
		game.addVisual(new Pared(position = game.at(par.get(0), par.get(1))))
	}
	method iniciarLadrillo(lad) {
		game.addVisual(new Ladrillo(position = game.at(lad.get(0), lad.get(1))))
	}
	
	method iniciarEnemigo(ene) {
		game.addVisual(new Enemigo(position = game.at(ene.get(0), ene.get(1))))
	}
	//method iniciarPinches(par) {
	//	game.addVisual(new Pinches(position = game.at(par.get(0), par.get(1))))
	//}
	
//	method iniciarEnemigo(list){
	//	const enemigo = new EnemigosQueCorren(position=game.at(list.get(0), list.get(1)), direccion = list.get(2))
	//	cantidadEnemigos++
	//	game.addVisual(enemigo)
	//	enemigo.iniciar()
	//	}
	
//	method iniciarCaminante(list){
//		const enemigoQueCamina = new EnemigosQueCaminan(image=list.get(3) ,position=game.at(list.get(0), list.get(1)), direccion = list.get(2))
//		cantidadEnemigos++
//		game.addVisual(enemigoQueCamina)
//		enemigoQueCamina.iniciar()
//	}

	method enemigoMuere() {
		cantidadEnemigos--
		self.puertaSpam()
	}
	
	method puertaSpam(){
		
	}
		
}

class NivelUno inherits Nivel{
	
	
	override method paredes(){
		 return  [[2,2],[4,2],[6,2],[8,2],[10,2],[12,2],[14,2],[16,2],[18,2],[20,2],
			     [2,4],[4,4],[6,4],[8,4],[10,4],[12,4],[14,4],[16,4],[18,4],[20,4],
	             [2,6],[4,6],[6,6],[8,6],[10,6],[12,6],[14,6],[16,6],[18,6],[20,6],
	             [2,8],[4,8],[6,8],[8,8],[10,8],[12,8],[14,8],[16,8],[18,8],[20,8],
	             [2,10],[4,10],[6,10],[8,10],[10,10],[12,10],[14,10],[16,10],[18,10],[20,10],
	             [2,12],[4,12],[6,12],[8,12],[10,12],[12,12],[14,12],[16,12],[18,12],[20,12]]
    } 
	
	
	override method ladrillos(){
		return  [[6,5]]
	}
	
	override method enemigo(){
		return [[7,7]]
	}
	
	//override method pinches(){
	//	return [[5,2],[6,2],[7,2]]
	//}
	
	//override method enemigosQueCorren() {
		//return [[21,4,left],[3,9,right]]
	//}
	
	//override method enemigosQueCaminan() {
	//	return [[20,2,left,"enemigoCaminaLeft.png"]]
	//}

	override method iniciarNivel(){		
		self.iniciarPuerta(3, 10)
		super() 
		//COLISIONES//
	   	game.whenCollideDo(bomberman,{objeto => objeto.colision(bomberman)})
	}
	
	override method puertaSpam(){
		if(cantidadEnemigos == 0) {
			const door = new Puerta (position = [1,1])
			keyboard.q().onPressDo({ door.abrirPuerta()})
			//puerta.image("puerta.png")
		}
	}	
	

}

class NivelDos inherits Nivel{
	
	override method paredes(){
		 return  [[1,2],[4,2],[7,2],[10,2],[13,2],[16,2],[19,2],[21,2],
			      [1,8],[4,8],[7,8],[10,8],[13,8],[16,8],[19,8],[21,8],
	              [1,11],[4,11],[7,11],[10,11],[13,11],[16,11],[19,11],[21,11]]}
                	
	
	override method ladrillos(){//estos son ladrillos
		return  [[0,0]]
	}
	
	override method enemigo(){
		return [[8,7]]
	}
	
	//override method pinches(){//habria q ver si usamos pinches u algo asi
	//	return [[5,2],[6,2],[7,2]]
	//}
	
	//override method enemigosQueCorren() {
		//return [[21,4,left],[3,9,right]]
	//}
	
	//override method enemigosQueCaminan() {
	//	return [[20,2,left,"enemigoCaminaLeft.png"]]
	//}

	override method iniciarNivel(){		
		self.iniciarPuerta(0, 10)
		super() 
		//COLISIONES//
	    game.whenCollideDo(bomberman,{objeto => objeto.colision(bomberman)})
	}
	
}

class NivelTres inherits Nivel{
	
	override method paredes(){
		 return  [[1,2],[4,2],[7,2],[10,2],[13,2],[16,2],[19,2],[21,2],
	             [1,11],[4,11],[7,11],[10,11],[13,11],[16,11],[19,11],[21,11],
                 [21,0],[21,1],[21,9],[21,3],[21,4],[21,10],[21,6],[21,7]]} 
	
	
	override method ladrillos(){//estos son ladrillos
		return  [[0,0]]
	}
	
	override method enemigo(){
		return [[7,6]]
	}
	//override method pinches(){//habria q ver si usamos pinches u algo asi
	//	return [[5,2],[6,2],[7,2]]
	//}
	
	//override method enemigosQueCorren() {
		//return [[21,4,left],[3,9,right]]
	//}
	
	//override method enemigosQueCaminan() {
	//	return [[20,2,left,"enemigoCaminaLeft.png"]]
	//}

	override method iniciarNivel(){		
		self.iniciarPuerta(0, 10)
		super() 
		//COLISIONES//
	    game.whenCollideDo(bomberman,{objeto => objeto.colision(bomberman)})
	}
	

}

class NivelCuatro inherits Nivel{
	
	override method paredes(){
		 return  [[1,2],[4,2],[7,2],[10,2],[13,2],[16,2],[19,2],[21,2],
                 [21,0],[21,1],[21,9],[21,3],[21,4],[21,10],[21,6],[21,7]]} 
	
	
	override method ladrillos(){//estos son ladrillos
		return  [[0,0]]
	}
	
	override method enemigo(){
		return [[7,7]]
	}
	//override method pinches(){//habria q ver si usamos pinches u algo asi
	//	return [[5,2],[6,2],[7,2]]
	//}
	
	//override method enemigosQueCorren() {
		//return [[21,4,left],[3,9,right]]
	//}
	
	//override method enemigosQueCaminan() {
	//	return [[20,2,left,"enemigoCaminaLeft.png"]]
	//}

	override method iniciarNivel(){		
		self.iniciarPuerta(0, 10)
		super() 
		//COLISIONES//
	    game.whenCollideDo(bomberman,{objeto => objeto.colision(bomberman)})
	}
	

}