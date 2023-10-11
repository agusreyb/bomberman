import wollok.game.*
import objects.*
import bomba.*

object bomberman {
	var property position = new Position(x = 3, y = 3)
	var property image = "bomberDown.png"
	var property puntos = 0
	var property vida = 3
	var property durationBomba = 2000
	var property durationFuego = 400

	method howAreYou() = "Lets start!"
	method imageLeft() { 
		image = "bomberLeft.png" }
	method imageRight() {
		image = "bomberRight.png" }
	method imageUp() {
		image = "bomberUp.png" }
	method imageDown() {
		image = "bomberDown.png" }
	
	method ponerBomba(){
		const bomba = new Bomba(position = position)
		const fuegoCentro = new Fuego(position = position)
		const fuegoUp = new Fuego(position = position.up(1))
		const fuegoDown = new Fuego(position = position.down(1))
		const fuegoLeft = new Fuego(position = position.left(1))
		const fuegoRight = new Fuego(position = position.right(1))
		var property fuegos=[fuegoCentro, fuegoUp, fuegoDown, fuegoLeft, fuegoRight]
		sonido.reproducirMusica("mecha.wav", 0.25)
		game.addVisual(bomba)
		game.schedule(durationBomba, {=> self.cicloBomba(bomba,fuegos)}) 
	} // FUNCIONA !! :O //
	
	method cicloBomba(bomba,fuegos){
		game.removeVisual(bomba)
		fuegos.forEach{ fueguito => game.addVisual(fueguito) }
		//game.addVisual(fuegoCentro)
		//game.addVisual(fuegoUp)
		//game.addVisual(fuegoDown)
		//game.addVisual(fuegoLeft)
		//game.addVisual(fuegoRight)
		sonido.reproducirMusica("explosion.wav", 0.15)
		game.schedule(durationFuego, {=> fuegos.forEach{ fueguito => game.removeVisual(fueguito)}}) 
	}
	
	method removerFuego(fuegoCentro, fuegoUp, fuegoDown, fuegoLeft, fuegoRight){
		game.removeVisual(fuegoCentro)
		game.removeVisual(fuegoUp)
		game.removeVisual(fuegoDown)
		game.removeVisual(fuegoLeft)
		game.removeVisual(fuegoRight)
	}
	
	method moverse(distancia){
		position = distancia
	}
	
	
	} //FIN BOMBER
	
class Poder{
	var image
	const position
	var property pos = self.posicionAleatoria()
	
	
	method posicionAleatoria() = game.at(
		0.randomUpTo(game.width()), 
		0.randomUpTo(game.height()),
	)
	
	method generarPoder(){
		pos = self.posicionAleatoria()
		const poder = new Poder(position=pos, image = value)
		game.addVisual(poder)

	}
	
	method image () = image
	method position()= position
	
}	