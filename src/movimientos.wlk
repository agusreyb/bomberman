object izquierda {
	
	method rebote() = derecha
	method mover(position) = position.left(1)
	
}

object derecha {
	
	method rebote() = izquierda
	method mover(position) = position.right(1)
}	

object arriba {
	
	method rebote() = abajo
	method mover(position) = position.up(1)
}	

object abajo {
	
	method rebote() = arriba
	method mover(position) = position.down(1)
}	

object movimientos{
	
	 method volver(personaje, sentido){
		self.moverse(personaje, sentido.rebote())
	}

     method moverse(personaje, sentido){
		personaje.position(sentido.mover(personaje.position()))
	}

}
	
	