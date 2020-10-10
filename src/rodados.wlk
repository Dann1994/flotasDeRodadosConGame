import wollok.game.*

class Corsa {
	var color = null
	var property position = new Position(x = 4, y = 7) 
	var property posiciones = #{}
	var posicionAnterior = null
	
	method image() = color.imagen()
    
	method capacidad() = 4
	method velMax() = 150
	method peso() = 1300
	
	method color() = color
	method setColor(unColor) { color = unColor}
	
	method moverDerecha()   { posicionAnterior = position;
		self.position(self.position().right(1)); posiciones.add(position)
	}
	method moverIzquierda() { posicionAnterior = position;
		self.position(self.position().left(1) ); posiciones.add(position)
	}
	method MoverPosicionAnterior() { self.position(posicionAnterior); posiciones.add(position) } 
	
	method pasoPor(posicion) = posiciones.contains(posicion)
	method pasoPorFila(numero) = posiciones.any({ pos => pos.x() == numero })
	method recorrioFilas(lista) = lista.all({ numero => self.pasoPorFila(numero)})
	
	method cambiarAColor(unColor) { color = unColor }
	
	method moverHacia(unaDireccion) { self.position(self.position().right(1)) }
}

object rojo {
	method imagen() = "rojo.png" 
}
object verde {
	method imagen() = "verde.png" 
}
object azul {
	method imagen() = "azul.png" 
}

class Kwid {
	var tanqueAdicional = false
	
	method ponerTanque() { tanqueAdicional = true }
	method sacarTanque() { tanqueAdicional = false }
	method capacidad() = if (tanqueAdicional) 3 else 4
	method velMax() = if (tanqueAdicional) 120 else 110
	method peso() = if (tanqueAdicional) 1350 else 1200
	method color() = "azul"
	
}

object trafic {
	var motor 
	var interior 
	
	method capacidad() = interior.capacidad()
	method color()= "blanco"
	method velMax() = motor.velMax()
	method peso() = motor.peso() + interior.peso() + 4000
	method setInterior(unInterior) { interior = unInterior}
	method setMotor(unMotor) { motor = unMotor }
}

object inetriorComodo {
	method capacidad() = 5
	method peso() = 700
}

object interiorPopular {
	method capacidad() = 12
	method peso() = 1000
}

object motorPulenta {	
	method velMax() = 130
	method peso() = 800
}

object motorBataton {
 	method velMax() = 80
 	method peso() = 500
}

class AutoESpecial {
	var property color 
	var property capacidad
	var property velMax
	var property peso
}



