import ciudades.*

object burns {
	var varillasDeUranio
	
	//Setter
	method varillasDeUranio(cantidadDeVarillas){
		varillasDeUranio = cantidadDeVarillas
	}
	
	method produccionEnergetica(riquezaDelSuelo, velocidadDelViento){
		return 0.1 * varillasDeUranio
	}
	
	method contamina(){
		return varillasDeUranio > 20	
	}
}

object ex_bosque{
	var capacidadDeCarbon
	
	//Setter
	method capacidadDeCarbon(capacidadEnToneladasDeCarbon){
		capacidadDeCarbon = capacidadEnToneladasDeCarbon
	}
	
	method produccionEnergetica(riquezaDelSuelo, velocidadDelViento){
		return ((0.5) + (capacidadDeCarbon * riquezaDelSuelo))
	}
	
	method contamina () = true
	
}

object elSuspiro{
	var turbinasEolicas = #{turbina1}
	
	method produccionEnergetica(riquezaDelSuelo, velocidadDelViento){
		return self.produccionesEolicas(velocidadDelViento).sum()	
	}
	
	method produccionesEolicas(velocidadDelViento){
		return turbinasEolicas.map({unaTurbina => unaTurbina.produccionEolica()*velocidadDelViento})
	}
	
	method contamina() = false
}

object turbina1{
	const produccionEolica = 0.2
	
	method produccionEolica () = produccionEolica
}

object hidroelectrica {
	method produccionEnergetica(caudalDeRio){
		return 2000000 * caudalDeRio 		
	}	
}
