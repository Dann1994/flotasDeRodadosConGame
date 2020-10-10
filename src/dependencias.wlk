import rodados.*
import pedidos.*

class Dependencia {
	const empleados 
	const flotaRodados = []
	const pedidos = []
	 
	 method agregarPedido(pedido) { pedidos.add(pedido) }
	 method quitarPedido(pedido) { pedidos.remove(pedido) }
	 method agregarAFlota(rodado) { flotaRodados.add(rodado) }
	 method quitarDeFlota(rodado) { flotaRodados.remove(rodado) }
	 method agregarListaAFlota(unaLista) { flotaRodados.addAll(unaLista) }
	 method pesoTotalFlota() = flotaRodados.sum({ rodado => rodado.peso() })
	 method estaBienEquipada() = flotaRodados.size() >= 3 && flotaRodados.all({ rodado => rodado.velMax() >= 100 })
	 
	 method rodadosDeColor(color) = flotaRodados.filter({ rodado => rodado.color() == color })
	 method capacidadTotalEnColor(color) = self.rodadosDeColor(color).sum({ rodado => rodado.capacidad() })
	 
	 method colorDelRodadoMasRapido() = flotaRodados.max({ rodado => rodado.velMax() }).color()
	 method capasidadTotal() = flotaRodados.sum({ rodado => rodado.capacidad() })
	 method capacidadFaltante() = empleados - self.capasidadTotal()
	 method esGrande() = empleados >= 40 && flotaRodados.size() >= 5
	 method totalPasajeros() = pedidos.sum({ pedido => pedido.cantPasajeros() })
	 
	 method sePuedeSatisfacer(pedido) = flotaRodados.any({ rodado => pedido.puedeSatisfacer(rodado) })
	 method pedidosQueNoSeSatisfacen() = pedidos.filter({ pedido => not self.sePuedeSatisfacer(pedido)})
	 
	 method noSonCompatiblesCon(unColor) = pedidos.all({ pedido => pedido.coloresIncompatibles().contains(unColor) })
	 method relajarPedidos() { pedidos.forEach({ pedido => pedido.relajar() }) } 
}
