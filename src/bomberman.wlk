import wollok.game.*

object bomberman {
	var property position = new Position(x = 3, y = 3)
	var property image = "bomber_frente.png"
	var property puntos = 0
	var property vida = 3
	
	method howAreYou() = "Lets start!"
	
	method teComioBomber(){
		//perder 
		}
	
	method imageLeft() { 
		image = "bomberLeft.png" } //bomber_left.png
	
	method imageRight() {
		image = "bomberRight.png" }	 //bomber_right.png
		
	method imageUp() {
		image = "bomberUp.png" }  //bomber_up.png
		
	method imageDown() {
		image = "bomberDown.png" } //bomber_down.png
	
	
	} //FIN BOMBER
	
class Poder{
	var image
	const position
	const pos = self.posicionAleatoria()
	
	
	method posicionAleatoria() = game.at(
		0.randomUpTo(game.width()), 
		0.randomUpTo(game.height()),
	)
	
	method generarPoderes(){
		game.schedule(30000, "Poweeer", {new poder().generarPoder()})
	}
	

	
	method generarPoder(){
		const pos=self.posicionAleatoria()
		const poder = new Poder(position=pos, image = value)
		game.addVisual(poder)

	}
	
	method image () = image
	method position()=position
	
}	