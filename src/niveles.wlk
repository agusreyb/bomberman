import wollok.game.*
import main.*


class Nivel {
	
	var property cantidadEnemigos = 0
	
	method iniciarNivel() {
		self.cargarMapa()
	}
	
	method cargarMapa(){
		self.plataformas().forEach({par => self.iniciarPlataforma(par)})
	
		self.pinches().forEach({par => self.iniciarPinches(par)})
		
		self.enemigosQueCorre().forEach({par => self.iniciarEnemigo(par)})
		
		self.enemigosQueCaminan().forEach({par => self.iniciarCaminante(par)})
	}
	
	method plataformas()
	method pinches()
	method enemigosQueCorre()
	method enemigosQueCaminan()	
	
	method iniciarPuerta(x, y) {
		const puerta = new Puerta(image= "puertaCerrada.png",position = game.at(x, y))
		game.addVisual(puerta)
	}
	
	method iniciarPlataforma(par) {
		game.addVisual(new Platforma(position = game.at(par.get(0), par.get(1))))
	}
	
	method iniciarPinches(par) {
		game.addVisual(new Pinches(position = game.at(par.get(0), par.get(1))))
	}
	
	method iniciarEnemigo(list){
		const enemigo = new EnemigoQueCorre(position=game.at(list.get(0), list.get(1)), direccion = list.get(2))
		cantidadEnemigos++
		game.addVisual(enemigo)
		enemigo.iniciar()
		}
	
	method iniciarCaminante(list){
		const enemigoQueCamina = new EnemigoQueCamina(image=list.get(3) ,position=game.at(list.get(0), list.get(1)), direccion = list.get(2))
		cantidadEnemigos++
		game.addVisual(enemigoQueCamina)
		enemigoQueCamina.iniciar()
	}
		
}

class NivelUno inherits Nivel{
	
	override method plataformas(){
		return  [[3,2],[4,3],[4,2],[12,3],[6,3],[8,3],[10,3],[12,2],[14,3],[16,3],
		[18,3],[21,3],[20,3],[19,5],[18,5],[17,6],[16,6],[15,7],[14,7],[13,8],[12,8],[11,9],[10,9],
		[9,8],[8,8],[7,8],[6,8],[5,8],[4,8],[3,8],[2,8],[1,8],[0,8]]
	}
	
	override method pinches(){
		return [[5,2],[6,2],[7,2],[8,2],[9,2],[10,2],[11,2]]
	}
	
	override method enemigosQueDisparan() {
		return [[21,4,left],[3,9,right]]
	}
	
	override method enemigosQueCaminan() {
		return [[20,2,left,"enemigoCaminaLeft.png"]]
	}

	override method iniciarNivel(){		
		self.iniciarPuerta(0, 9)
		super() 
	}
	

}
