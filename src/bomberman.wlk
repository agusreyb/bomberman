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
		image = "pepita-izq.png" } //bomber_left.png
	
	method imageRight() {
		image = "player.png" }	 //bomber_right.png
		
	method imageUp() {
		image = "silvestre.png" }  //bomber_up.png
		
	method imageDown() {
		image = "bomber_frente.png" } //bomber_down.png
	
	
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

object bomba {
	
	var property duration = 2000 //EN MILISEGUNDOS, SERIAN 2s
	var property image = "bomber_frente.png" //CAMBIAR IMAGEN
	
	method position()= game.at(self.posicionBomber(),self.posicionBomber())
	
	method posicionBomber() = bomberman.position().x()
	
	method ponerBomba(){
		game.addVisualIn(self, self.position())
		game.onTick(duration,"tiempoBomba",{game.removeVisual(self)})
		
	}
	
}