import wollok.game.*
import main.*
import objects.*
import bomberman.*
import pared.*
import puerta.*
import bomba.*
import enemigos.*

class Nivel {
	var property cantidadEnemigos = 0

	
	method iniciarNivel() {
		self.cargarMapa()
		self.iniciarPersonaje()
	}
	
	method iniciarPersonaje() {
		game.addVisualCharacter(bomberman)
	} 
	
	
	method cargarMapa(){
		self.paredes().forEach({par => self.iniciarPared(par)})
		self.ladrillos().forEach({lad => self.iniciarLadrillo(lad)})
		//self.pinches().forEach({par => self.iniciarPinches(par)})
		
		//self.enemigosQueCorren().forEach({par => self.iniciarEnemigo(par)})
		
		//self.enemigosQueCaminan().forEach({par => self.iniciarCaminante(par)})
	}
	
	method paredes()
	method ladrillos()
	//method pinches()
	//method enemigosQueCorren()
	//method enemigosQueCaminan()	
	method iniciarPuerta(x, y) {
		const puerta = new Puerta(image= "puerta.PNG",position = game.at(x, y))
		game.addVisual(puerta)
	}
	method iniciarPared(par) {
		game.addVisual(new Pared(position = game.at(par.get(0), par.get(1))))
	}
	method iniciarLadrillo(lad) {
		game.addVisual(new Ladrillo(position = game.at(lad.get(0), lad.get(1))))
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
		
}

class NivelUno inherits Nivel{
	
	override method paredes(){
		 return  [[1,2],[4,2],[7,2],[10,2],[13,2],[16,2],[19,2],[21,2],
			     [1,5],[4,5],[7,5],[10,5],[13,5],[16,5],[19,5],[21,5],
	             [1,8],[4,8],[7,8],[10,8],[13,8],[16,8],[19,8],[21,8],
	             [1,11],[4,11],[7,11],[10,11],[13,11],[16,11],[19,11],[21,11],
                 [21,0],[21,1],[21,9],[21,3],[21,4],[21,10],[21,6],[21,7]]} 
	
	
	override method ladrillos(){//estos son ladrillos
		return  [[0,0]]
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
	}
	

}

class NivelDos inherits Nivel{
	
	override method paredes(){
		 return  [[1,2],[4,2],[7,2],[10,2],[13,2],[16,2],[19,2],[21,2],
			     [1,5],[4,5],[7,5],[10,5],[13,5],[16,5],[19,5],[21,5],
	             [1,8],[4,8],[7,8],[10,8],[13,8],[16,8],[19,8],[21,8],
	             [1,11],[4,11],[7,11],[10,11],[13,11],[16,11],[19,11],[21,11],
                 [21,0],[21,1],[21,9],[21,3],[21,4],[21,10],[21,6],[21,7]]} 
	
	
	override method ladrillos(){//estos son ladrillos
		return  [[0,0]]
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
	}
	

}

class NivelTres inherits Nivel{
	
	override method paredes(){
		 return  [[1,2],[4,2],[7,2],[10,2],[13,2],[16,2],[19,2],[21,2],
			     [1,5],[4,5],[7,5],[10,5],[13,5],[16,5],[19,5],[21,5],
	             [1,8],[4,8],[7,8],[10,8],[13,8],[16,8],[19,8],[21,8],
	             [1,11],[4,11],[7,11],[10,11],[13,11],[16,11],[19,11],[21,11],
                 [21,0],[21,1],[21,9],[21,3],[21,4],[21,10],[21,6],[21,7]]} 
	
	
	override method ladrillos(){//estos son ladrillos
		return  [[0,0]]
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
	}
	

}

class NivelCuatro inherits Nivel{
	
	override method paredes(){
		 return  [[1,2],[4,2],[7,2],[10,2],[13,2],[16,2],[19,2],[21,2],
			     [1,5],[4,5],[7,5],[10,5],[13,5],[16,5],[19,5],[21,5],
	             [1,8],[4,8],[7,8],[10,8],[13,8],[16,8],[19,8],[21,8],
	             [1,11],[4,11],[7,11],[10,11],[13,11],[16,11],[19,11],[21,11],
                 [21,0],[21,1],[21,9],[21,3],[21,4],[21,10],[21,6],[21,7]]} 
	
	
	override method ladrillos(){//estos son ladrillos
		return  [[0,0]]
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
	}
	

}