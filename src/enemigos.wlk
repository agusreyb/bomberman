import wollok.game.*

class Enemigo{
	var position
		method generarEnemigos(){
			game.onTick(45000, "aparece enemigo", {new Enemigo().aparecer()})
		
	}
	
		method aparecer(){
			game.addVisual(self)
			self.moverse()
			
		}
		
		method moverse(){}
	
		method position() = position
		method image () = "enermigo.png"
	
}

