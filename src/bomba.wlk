import wollok.game.*

class Bomba {
	const property position
	var property duration = 2000 //EN MILISEGUNDOS, SERIAN 2s
	var property image = "bomb.png" //CAMBIAR IMAGEN
	
	method colision(personaje){} //QUEDA VACIO YA QUE PUEDE PASAR POR ENCIMA

//method position()= game.at(bomberman.position().x(),bomberman.position().y())

//	method posicionBomber() = bomberman.position().x().y()

//	method ponerBomba(){
//		game.addVisualIn(self, self.position())
//		game.schedule(duration, {game.removeVisual(self)}) 
//}

	method explotar(){}

}

class Fuego {
	const property position
	var property duration = 400 //EN MILISEGUNDOS, SERIAN 0.4s
	var property image = "fire.png"
	var property potencia
	
	method esColision(){
		return (game.getObjectsIn(position).isEmpty())
	}

	method colision(personaje){} //QUEDA VACIO YA QUE PUEDE PASAR POR ENCIMA

	}