object izquierda {
	
	method rebote() = derecha
	method mover(position) = position.left()
	
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
	
	 method volver(enemigo, sentido){
		self.moverse(enemigo, sentido.rebote())
	}

     method moverse(enemigo, sentido){
		enemigo.position(sentido.mover(enemigo.position()))
	}

}
	
	