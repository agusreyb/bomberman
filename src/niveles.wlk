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
		 return  [[2,2],[4,2],[6,2],[8,2],[10,2],[12,2],[14,2],[16,2],[18,2],
			     [2,4],[4,4],[7,5],[10,5],[13,5],[16,5],[19,5],
	             [2,8],[4,8],[7,8],[10,8],[13,8],[16,8],[19,8],
	             [2,11],[4,11],[7,11],[10,11],[13,11],[16,11],[19,11],
	             [0,0],[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0],[9,0],[10,0],[11,0],[12,0],[13,0],[14,0],[15,0],[16,0],[17,0],[18,0],[19,0],[20,0],
                 [21,0],[21,1],[21,2],[21,3],[21,4],[21,5],[21,6],[21,7],[21,8],[21,9],[21,10],[21,11],[21,12],[21,13],
                 [0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[0,8],[0,9],[0,10],[0,11],[0,12],[0,13],
                 [1,13],[2,13],[3,13],[4,13],[5,13],[6,13],[7,13],[8,13],[9,13],[10,13],[11,13],[12,13],[13,13],[14,13],[15,13],[16,13],[17,13],[18,13],[19,13],[20,13]]
    } 
	
	
	override method ladrillos(){
		return  [[5,5]]
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
	}
	

}
