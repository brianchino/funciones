object factorA {
	
	method puedeDonar(unFactorSanguineo){
		return unFactorSanguineo === self || unFactorSanguineo ===factorR
	}
}
object factorO{
	method puedeDonar(unFactorSanguineo){
		return true
	}
}
object factorR{
	method puedeDonar(unFactorSanguineo){
		return unFactorSanguineo === self 
	}
}
