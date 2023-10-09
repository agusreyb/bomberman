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
		image = "bomberLeft.png" } //bomber_left.png
	method imageRight() {
		image = "bomberRight.png" }	 //bomber_right.png
	method imageUp() {
		image = "bomberUp.png" }  //bomber_up.png
	method imageDown() {
		image = "bomberDown.png" } //bomber_down.png
	method ponerBomba(){
		const bomba = new Bomba(position = position)
		const fuego = new Fuego(position = position)
		game.addVisual(bomba)
		game.schedule(durationBomba, {=> self.cicloBomba(bomba,fuego)}) } // FUNCIONA !! :O //
	method cicloBomba(bomba,fuego){
		game.removeVisual(bomba)
		game.addVisual(fuego)
		game.schedule(durationFuego, {=> game.removeVisual(fuego)}) }
		
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