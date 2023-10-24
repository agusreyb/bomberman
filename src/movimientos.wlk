import wollok.game.*

object izquierda {
	method rebote() = derecha
	method mover(position) {
	return game.at(position.x() - 1, position.y())}

}


object derecha {
	method rebote() = izquierda
	method mover(position) {
	return game.at(position.x() + 1, position.y())}

}	

object arriba {
	method rebote() = abajo
	method mover(position) {
	return game.at(position.x() , position.y()+1)}

}	

object abajo {
	method rebote() = arriba
	method mover(position) {
	return game.at(position.x(), position.y()-1)}

}	

object movimientos{
	 method volver(pj, sentido){
		self.moverse(pj, sentido.rebote())
     }

     method moverse(pj, sentido){
		pj.position(sentido.mover(pj.position()))
     }

}
	
	
