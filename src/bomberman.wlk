import wollok.game.*
import objects.*
import bomba.*
import main.*
import vida.*


object bomberman {
	var property position = new Position(x = 3, y = 3)
	var property image = "bomberDown.png"
	var property puntos = 0
	var property vidas
	var property listaVidas = []
	var property durationBomba = 2000
	var property durationFuego = 400
    var property bombapowup=2
    var property direccion 
	
	
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
		const fuegoCentro = new Fuego(position = position , potencia=1)
		const fuegoUp = new Fuego(position = position.up(1) , potencia=1)
		const fuegoDown = new Fuego(position = position.down(1) , potencia=1)
		const fuegoLeft = new Fuego(position = position.left(1), potencia=1)
		const fuegoRight = new Fuego(position = position.right(1), potencia=1)
		const fuegoUp2 = new Fuego(position = position.up(2) , potencia=2)
		const fuegoDown2 = new Fuego(position = position.down(2) , potencia=2)
		const fuegoLeft2 = new Fuego(position = position.left(2), potencia=2)
		const fuegoRight2 = new Fuego(position = position.right(2), potencia=2)
		var property fuegosTotales=[fuegoUp, fuegoDown, fuegoLeft, fuegoRight, fuegoUp2, fuegoDown2, fuegoLeft2, fuegoRight2]
		var property fuegos=[]
		fuegos=fuegosTotales.filter({cadafuego => self.filtrarFuego(cadafuego)})
		//fuegos=self.bloqueoFuegoPorPared(fuegos)
		fuegos.add(fuegoCentro)
		game.addVisual(bomba)
		sonido.reproducirMusica("mecha.wav", 0.25)
		game.schedule(durationBomba, {=> self.cicloBomba(bomba,fuegos)}) 
	
	    
	
	} // FUNCIONA !! :O //
	
	method cicloBomba(bomba,fuegos){
		game.removeVisual(bomba)
		fuegos.forEach{ fueguito => game.addVisual(fueguito) }
		sonido.reproducirMusica("explosion.wav", 0.15)
		game.schedule(durationFuego, {=> fuegos.forEach{ fueguito => game.removeVisual(fueguito)}}) 
	    //game.whenCollideDo(Fuego,{objeto => objeto.hitFuego(Fuego})
	}
	
	method filtrarFuego(cadafuego)=(cadafuego.potencia() <= bombapowup) and (cadafuego.esColision())

    //Aca intente hacer que el fuego no traspase la pared si es que esta en powerup nivel dos (No anda?)
	//method bloqueoFuegoPorPared(fuegos){
		//if(not fuegos.contains("fuegoUp")){fuegos.remove("fuegoUp2")}
		//return fuegos
	//}
	

	
	method queNivel(cadafuego)=cadafuego.potencia() < bombapowup

	method fueHit() { // metodo para ver si el personaje fue atacado o no
	game.addVisualIn(menosVida, game.at(position.x(), position.y() + 1))
	game.schedule(100,{ game.removeVisual(menosVida) })
	sonido.reproducirSonido("impacto.mp3", 0.1)
	vidas = listaVidas.size() - 1
	if(vidas == 0) {
		game.schedule(100, {
			game.removeVisual(self)
			main.terminarJuego(finDelJuego)
		})
	} else {
		self.removerVida()}
	
}

	method removerVida(){								//metodo para remover la vida
		game.removeVisual(listaVidas.get(vidas)) 
		listaVidas.remove(listaVidas.get(vidas))
	}	
	
	method agregarVida(){								//metood para agregar la vida
		const newVida = new Vida(position = game.at(listaVidas.size() + 2, 1)) //coordenadas para la vida
		listaVidas.add(newVida)
		game.addVisual(newVida)
	}	
	
	method seChocaPared(){
		movimientos.volver(self, direccion)
	}
	
} //FIN BOMBER

object movimientos{
	
	 method volver(personaje, sentido){
		self.moverse(personaje, sentido.rebote())
	}

     method moverse(personaje, sentido){
		personaje.position(sentido.mover(personaje.position()))
	}

}



class Poder{
	var image
	const position
	var property pos = self.posicionAleatoria()
	
	
	method posicionAleatoria() = game.at(
		0.randomUpTo(game.width()), 
		0.randomUpTo(game.height())
	)
	
	method generarPoder(){
		pos = self.posicionAleatoria()
		const poder = new Poder(position=pos, image = value)
		game.addVisual(poder)

	}
	
	method image () = image
	method position()= position
	
}	