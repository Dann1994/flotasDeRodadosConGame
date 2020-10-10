import rodados.*

class Pedido {
	const coloresIncompatibles = #{}
	var property  distancia
	var property  tiempoMax
	var property  cantPasajeros
	
	method velRequerida() = distancia / tiempoMax
	
	// metodos para ayudar a aclarar a "puedeSatisfacer()"
	//****
	method llegaATiempo(unAuto) = unAuto.velMax() - self.velRequerida() > 10
	method suficienteCapacidad(unAuto) = unAuto.capacidad() >=  cantPasajeros
	method colorCompatible(unAuto) = not coloresIncompatibles.any({ color => color == unAuto.color() })
	//****
	method puedeSatisfacer(unAuto) = self.llegaATiempo(unAuto) && self.suficienteCapacidad(unAuto) && self.colorCompatible(unAuto)
	method acelerar() { tiempoMax -= 1 }
	method relajar()  { tiempoMax += 1 }
	method coloresIncompatibles() = coloresIncompatibles
}
