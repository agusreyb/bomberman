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
		self.pinches().forEach({par => self.iniciarPinches(par)})
		
		//self.enemigosQueCorren().forEach({par => self.iniciarEnemigo(par)})
		
		//self.enemigosQueCaminan().forEach({par => self.iniciarCaminante(par)})
	}
	
	method paredes()
	method pinches()
	//method enemigosQueCorren()
	//method enemigosQueCaminan()	
	method iniciarPuerta(x, y) {
		const puerta = new Puerta(image= "doorOpen.png",position = game.at(x, y))
		game.addVisual(puerta)
	}
	method iniciarPared(par) {
		game.addVisual(new Pared(position = game.at(par.get(0), par.get(1))))
	}
	method iniciarPinches(par) {
		game.addVisual(new Pinches(position = game.at(par.get(0), par.get(1))))
	}
	
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
	
	override method paredes(){//estas son paredes
		return  [[3,2],[4,3],[4,2],[12,3],[6,3],[8,3],[10,3],[12,2],[14,3]]
	}
	
	override method pinches(){//habria q ver si usamos pinches u algo asi
		return [[5,2],[6,2],[7,2]]
	}
	
	//override method enemigosQueCorren() {
		//return [[21,4,left],[3,9,right]]
	//}
	
	//override method enemigosQueCaminan() {
	//	return [[20,2,left,"enemigoCaminaLeft.png"]]
	//}

	override method iniciarNivel(){		
		self.iniciarPuerta(0, 9)
		super() 
	}
	

}
