import wollok.game.*
import objects.*
import bomba.*
import main.*
import vida.*
import movimientos.*

object bomberman {
	var property position = new Position(x = 1, y = 1)
	var property image = "bomberDown.png"
	var property vidas
	var property listaVidas = []  
    var property direccion
    var property atravesable = true
	method imageLeft() { 
		image = "bomberLeft.png" }
	method imageRight() {
		image = "bomberRight.png" }
	method imageUp() {
		image = "bomberUp.png" }
	method imageDown() {
		image = "bomberDown.png" }
	method colision(entidad){}

method fueHit() {
    if (!game.hasVisual(menosVida)) {
        game.addVisualIn(menosVida, game.at(position.x(), position.y() + 1))
        game.schedule(1000, { game.removeVisual(menosVida) })
        sonido.reproducirSonido("impacto.mp3", 0.1)
        vidas = listaVidas.size() - 1
        if (vidas == 0) {
            game.schedule(100, {
                game.removeVisual(self)
                main.terminarJuego(finDelJuego)
            })
        } else {
            self.removerVida()
        }
    }
}
	
	method removerMenosVida(){
		game.removeVisual(menosVida)
	}
	
	method removerVida(){								//metodo para remover la vida
		game.removeVisual(listaVidas.get(vidas)) 
		listaVidas.remove(listaVidas.get(vidas))
	}	
	method agregarVida(){								//metodo para agregar la vida
		const newVida = new Vida(position = game.at(listaVidas.size() + 20, 14)) //coordenadas para la vida
		listaVidas.add(newVida)
		game.addVisual(newVida)
	}	
	method seChocaPared(){
		movimientos.volver(self, direccion)
	}
    method hitFuego(){ //TIENE QUE RESTAR VIDA, CODEAR:
	 self.fueHit()
   }
   method posicionInicial(){
   	//game.removeVisual(self)
   }

} //FIN BOMBER

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