import centrales.*

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
}
