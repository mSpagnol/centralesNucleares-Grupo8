import centrales.*

object region {
	const ciudades = [springfield, albuquerque]
	
	method centralMasProduceEnRegion(){
		return ciudades.map({unaCiudad => unaCiudad.centralQueMasProduce()})
	}
}

object springfield {
	const velocidadDelViento = 10
	const riquezaDelSuelo = 0.9
	var centrales = #{burns, ex_bosque, elSuspiro}
	
	method agregarCentral(unaCentral){
		centrales.add(unaCentral)
	}
	
	method produccionEnergeticaParticular(unaCentral){
		return unaCentral.produccionEnergetica(riquezaDelSuelo, velocidadDelViento)
	}
	
	method centralesContaminantes(){
		return centrales.filter({unaCentral => unaCentral.contamina()})
	} 
	
	method cubrioNecesidad(necesidad){
		return centrales.map({unaCentral => self.produccionEnergeticaParticular(unaCentral)}).sum() >= necesidad
	}
	
	method centralQueMasProduce(){
		return centrales.max({unaCentral => self.produccionEnergeticaParticular(unaCentral)})	
	}
	
		
}

object albuquerque {
	
	const caudalDeRio = 150
	const centrales = [hidroelectrica]
	
	method centralQueMasProduce() = hidroelectrica
	
}
