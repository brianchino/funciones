import enfermedades.*

class Infecciosa inherits Enfermedad{
	

	
	method reproducir(){
		celulasAmenazadas *= 2
	}
	method efecto(persona){
		persona.aumentoTemperatura(self.celulasAmenazadas()/1000)
	
	}
	method esAgresivaPara(unaPersona){
		return self.celulasAmenazadas() > unaPersona.cantidadCelulas() * 0.1
	}

}
