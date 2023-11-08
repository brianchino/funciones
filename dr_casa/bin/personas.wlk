import enfermedadAutoinmune.* 
import enfermedadInfecciosa.*
import factoresSanguineos.*

class Persona {
	const property enfermedades = #{}
	var cantidadCelulas 
	var property temperatura
	const property factorSanguineo
	
	method cantidadCelulas(){
		return cantidadCelulas
	}
	// punto 1 contraer enfermedad
	method contraerEnfermedad (unaEnfermedad){
		enfermedades.add(unaEnfermedad)
	}
	
	method tiene(unaEnfermedad){
		return enfermedades.contains(unaEnfermedad)
	}
	
	// punto 2 vivir un dia
	method vivirUnDia(){
		enfermedades.forEach{enfermedad => enfermedad.efecto(self)}
	}
	method aumentoTemperatura(temperaturaAumentar){
		temperatura = 45.min(temperatura + temperaturaAumentar)
		
	}
	method destruirCelulas(cantidad){
		cantidadCelulas = 0.max(cantidadCelulas - cantidad)
	}
	
	// punto 3a
	method cantidadCelulasAmenazadasPorEnfermedadesAgresivas(){
		return self.enfermedadesAgresivas().sum{enfermedad => enfermedad.celulasAmenazadas()}
	}
	method enfermedadesAgresivas(){
		return enfermedades.filter{enfermedad => enfermedad.esAgresivaPara(self)}
	}
	
	// punto 3b
	method enfermedadMasAmenazante(){
		return enfermedades.max{enfermedad => enfermedad.celulasAmenazadas()}
	}
	
	// punto 3c
	method enComa(){
		return temperatura == 45 || self.cantidadCelulas() < 100000 
	}
	// punto 4
	method vivirDias(cantidad){
		cantidad.times{dia => self.vivirUnDia()}
	}
	// TEMPORADA 2
	//punto 2
	
	method atenuarEnfermedades(cantidadDosis){
		enfermedades.forEach{enfermedad => enfermedad.atenuatePara(self,cantidadDosis)}
	} 
	
	method curarseDe(unaEnfermedad){
		enfermedades.remove(unaEnfermedad)
	}
	// punto 5
	method morir(){
		temperatura = 0
	}
	// temporada 3
	method intentarDonar(unaPersona,unaCantidadCelulas){
		self.validarDonacion(unaPersona,unaCantidadCelulas)
		self.destruirCelulas(unaCantidadCelulas)
		unaPersona.recibirCelulas(unaCantidadCelulas)
	}
	method recibirCelulas(unaCantidad){
		cantidadCelulas += unaCantidad
	}
	method validarDonacion(unaPersona,unaCantidadCelulas){
		self.validarFactorSanguineoCompatible(unaPersona)
		self.validarCantidadDeCelulasSuficientes(unaCantidadCelulas)
	}
	method validarFactorSanguineoCompatible(unaPersona){
		if(!self.esCompatibleCon(unaPersona.factorSanguineo())){
			self.error ("incompatibilidad")
		}
	}
	method esCompatibleCon(unFactorSanguineo){
		return  factorSanguineo.puedeDonar(unFactorSanguineo)
	}
	method validarCantidadDeCelulasSuficientes(unaCantidadCelulas){
		if(!self.tieneCelulasSuficientes(unaCantidadCelulas)){
			self.error("celulasInsuficientes")
		}
	}
	method tieneCelulasSuficientes(unaCantidadCelulas){
		return unaCantidadCelulas > 500 and unaCantidadCelulas <= cantidadCelulas / 4 
	}
}



