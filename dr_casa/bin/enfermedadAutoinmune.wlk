import enfermedades.*

class Autoinmune inherits Enfermedad{
	
	
	var cantidadDias = 0
	
	method efecto(persona){
		persona.destruirCelulas(self.celulasAmenazadas())
		cantidadDias ++
	}
	method esAgresivaPara(unaPersona){
		return cantidadDias > 30
	}
	
}
