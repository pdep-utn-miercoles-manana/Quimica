import compuestos.*

class Elemento {

	var nombre
	var simbolo
	var orbitales
	var esGasNoble

	method nombre(unNombre) {
		nombre = unNombre
	}

	method simbolo(unSimbolo) {
		simbolo = unSimbolo
	}

	method orbitales(unosOrbitales) {
		orbitales = unosOrbitales
	}

	method numeroAtomico() {
		return orbitales.sum({ orbital => orbital.electronesOcupados() })
	}

	method orbital(nivel) {
		return orbitales.findOrDefault({ orbital => orbital.nivel() == nivel }, null)
	}

	method estaEstable() {
		return orbitales.all({ orbital => orbital.estaCompleto() })
	}

	method esGasNoble(es) {
		esGasNoble = es
	}

	method esElegante() = self.numeroAtomico() % 7 == 0 || esGasNoble

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
	
	method formula() = simbolo

}

class Orbital {

	var nivel
	var capacidadMaxima
	var electronesOcupados

	method nivel(unNivel) {
		nivel = unNivel
	}

	method capacidadMaxima(unaCapacidad) {
		capacidadMaxima = unaCapacidad
	}

	method electronesOcupados(unosElectrones) {
		electronesOcupados = unosElectrones
	}

	method estaCompleto() = electronesOcupados == capacidadMaxima
	
	method electronesOcupados() = electronesOcupados

}
