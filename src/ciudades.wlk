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
	var centralesContaminantes = #{}
	var centrales = #{}
	
	method agregarCentral(unaCentral){
		centrales.add(unaCentral)
	}
	
	method produccionEnergeticaParticular(unaCentral){
		return unaCentral.produccionEnergetica(riquezaDelSuelo, velocidadDelViento)
	}
	
	method esCentralContaminante(unaCentral){
		if(unaCentral.contamina()){
			centralesContaminantes.add(unaCentral)
		}
	}
	
	method centralesContaminantes(){
		return centralesContaminantes
	} 
	
	method cubrioNecesidad(necesidad){
		return centrales.map({unaCentral => self.produccionEnergeticaParticular(unaCentral)}).sum() >= necesidad
	}
	
	// los siguientes dos metodos son los que tenia dudas
	
	method centralMasProduce(){
		return centrales.filter({unaCentral => self.esLaQueMasProduce(unaCentral)}).first()
		
	}
	
	method esLaQueMasProduce(unaCentral){
		return unaCentral.produccionEnergetica(self) >= centrales.map({otraCentral => otraCentral.produccionEnergetica(self)}).max()
	}
		
}

object albuquerque {
	
	const caudalDeRio = 150
	const centrales = [hidroelectrica]
	
	method centralQueMasProduce() = hidroelectrica
	
}
