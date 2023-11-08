class Enfermedad {
	
	var celulasAmenazadas
	
	method celulasAmenazadas(){
		return celulasAmenazadas
	}
	method atenuar(unaCantidad){
		celulasAmenazadas = 0.max(celulasAmenazadas - unaCantidad) 
	}
	method atenuatePara(unaPersona,cantidadDosis){
		self.atenuar(cantidadDosis *15)
		self.validarCuracion(unaPersona)
	}
	method validarCuracion(unaPersona){
		if(self.celulasAmenazadas() == 0){
			unaPersona.curarseDe(self)
		}
	}
}
object muerte{
	method celulasAmenazadas(){
		return 0
	}
	method efecto(persona){
		persona.morir()
	}
	method esAgresivoPara(_persona){
		return true
	}
	method atenuatePara(_unaPersona,_cantidadDosis){
		
	}
	
}
