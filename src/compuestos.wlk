class Compuesto {

	var componentes

	method esElegante() {
		return componentes.all({ componente => componente.esElegante() })
	}

	method componentes(unosComponentes) {
		componentes = unosComponentes
	}

	method enlazarCon(otraSustancia) {
		var componentePropio = self.convertirAComponente(1)
		var componenteDeOtraSustancia = self.convertirAComponente(1)
		return componentePropio.unirCon([ componenteDeOtraSustancia ])
	}

	method convertirAComponente(cantidad) {
		var componentePropio = new Componente()
		componentePropio.sustancia(self)
		componentePropio.cantidad(cantidad)
		return componentePropio
	}

	method formula() {
		return "(" + componentes.fold("", { formula , componente => formula + componente.representacionQuimica() }) + ")"
	}

}

class Componente {

	var cantidad
	var sustancia

	method cantidad(unaCantidad) {
		cantidad = unaCantidad
	}

	method sustancia(unaSustancia) {
		sustancia = unaSustancia
	}

	method esElegante() = sustancia.esElegante()

	method unirCon(otrosComponentes) {
		var compuesto = new Compuesto()
		compuesto.componentes(otrosComponentes + [ self ])
		return compuesto
	}

	method representacionQuimica() {
		if (cantidad > 1) {
			return sustancia.formula() + cantidad.toString()
		} else {
			return sustancia.formula()
		}
	}

}

