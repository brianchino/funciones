import personas.*

class Medico inherits Persona {
	
	const dosis
	method atenderA(unaPersona){
		unaPersona.atenuarEnfermedades(dosis)
	}
	
	override method contraerEnfermedad(unaEnfermedad){
		super(unaEnfermedad)
		self.atenderA(self)
	}
}
