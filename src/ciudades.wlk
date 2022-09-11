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
	var necesidadEnergetica
	
	//Setter
	method necesidadEnergetica(necesidad){
		necesidadEnergetica = necesidad
	}
	
	method produccionEnergeticaParticular(unaCentral){
		return unaCentral.produccionEnergetica(riquezaDelSuelo, velocidadDelViento)
	}
	
	method centralesContaminantes(){
		return centrales.filter({unaCentral => unaCentral.contamina()})
	} 
	
	method cubrioNecesidad(){
		return centrales.map({unaCentral => self.produccionEnergeticaParticular(unaCentral)}).sum() >= necesidadEnergetica
	}
	
	method centralQueMasProduce(){
		return centrales.max({unaCentral => self.produccionEnergeticaParticular(unaCentral)})	
	}
	
	method suministro(listaDeCentrales){
		return listaDeCentrales.map({unaCentral => self.produccionEnergeticaParticular(unaCentral)}).sum()
	}
	
	method suministroContaminante(){
		return self.suministro(self.centralesContaminantes())
	}
	
	method estaAlHorno(){
		return (self.centralesContaminantes().size() == centrales.size()) || (self.suministroContaminante() > (necesidadEnergetica*0.5))
	}
		
}

object albuquerque {
	
	const caudalDeRio = 150
	const centrales = [hidroelectrica]
	
	method centralQueMasProduce() = hidroelectrica
	
}
