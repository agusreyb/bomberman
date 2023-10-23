object left {
	
	method rebote() = right
	method mover(position) = position.left(1)
	
}

object right {
	
	method rebote() = left
	method mover(position) = position.right(1)
}	

object up {
	
	method rebote() = down
	method mover(position) = position.up(1)
}	

object down {
	
	method rebote() = up
	method mover(position) = position.down(1)
}	

object movimientos{
	

	 method volver(pj, sentido){
		self.moverse(pj, sentido.rebote())
     }

     method volverEne(enemigo, sentido){
		enemigo.cambiarSentido(sentido.rebote())
        
     }
     
     method moverse(pj, sentido){
		pj.position(sentido.mover(pj.position()))
     }

     


}
	
	