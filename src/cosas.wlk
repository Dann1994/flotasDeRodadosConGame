import wollok.game.*

object auto {
	
	var property position = new Position(x = 3, y = 7) //Posicion del objeto en el tablero
	// Otras opciones son: game.origin(), game.center(), game.at(3,7)
	var property image = "rojo.png"//Imagen del objeto
	
	const property autosColocados = []
	
	
	method moverDerecha() { self.position(self.position().right(1)) } // Aumenta una vez la posicion actual a la derecha
	
	method ponerAuto(unAuto) { autosColocados.add(unAuto)} // Agrega un auto a la lista "autosColocados"
	
	method destruir(unAuto) { game.removeVisual(unAuto) } // Quita un auto
}

class AutosRivales {
	var property position = null
	var property image = "azul.png"
}