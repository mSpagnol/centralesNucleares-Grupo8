import ciudades.*

object burns {
	var varillasDeUranio
	
	//Setter
	method varilasDeUranio(cantidadDeVarillas){
		varillasDeUranio = cantidadDeVarillas
	}
	
	method produccionEnergetica(riquezaDelSuelo, VelocidadDelViento){
		return 100000 * varillasDeUranio
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
		return 500000 + capacidadDeCarbon * riquezaDelSuelo
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
	var produccionEolica = 200000
	
	method produccionEolica () = 200000
}
