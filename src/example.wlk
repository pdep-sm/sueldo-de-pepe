/*
Ejercicio 3 - Sueldo de Pepe

Implementar en Wollok los objetos necesarios para calcular el sueldo de Pepe.
El sueldo de pepe se calcula así: 
	sueldo = neto + bono x presentismo + bono x resultados.
El neto es el de la categoría, hay dos categorías: gerentes que ganan $1000 de neto, 
y cadetes que ganan $1500.
Hay dos bonos por presentismo:
	- Es $100 si la persona a quien se aplica no faltó nunca, $50 si faltó un día, 
		$0 en cualquier otro caso;
	- En el otro, nada.
Hay tres posibilidades para el bono por resultados:
	- 10% sobre el neto
	- $80 fijos
	- O nada
Jugar cambiándole a pepe la categoría, la cantidad de días que falta y sus bonos por 
presentismo y por resultados; y preguntarle en cada caso su sueldo.
Nota: acá aparecen varios objetos, piensen bien a qué objeto le piden cada cosa que 
hay que saber para poder llegar al sueldo de pepe. 
*/


object pepe { 
	var puesto = gerente
	var diasAusente = 0
	var bonoPorPresentismo = bonoNulo
	var bonoPorResultado = bonoFijo
	
	method sueldo() {
		return puesto.neto() + 
				bonoPorPresentismo.importe(self) + 
				bonoPorResultado.importe(self)
	}
	
	method puesto() = puesto
	
	method diasAusente() = diasAusente
	
	method neto() = puesto.neto()
	
	method puesto(_puesto) {
		puesto = _puesto
	}
	
	method bonoPorPresentismo(_bono) {
		bonoPorPresentismo = _bono
	}
	
	method bonoPorResultado(_bono) {
		bonoPorResultado = _bono
	}
	
	method diasAusentes(dias) {
		diasAusente = dias
	}
	
}

object gerente {
	
	method neto() {
		return 1000
	}
}

object cadete {
	
	method neto() = 1500
}

object bonoPresentismo {
	
	method importe(empleado) {
		if(empleado.diasAusente() == 0){
			return 100
		} 
		
		if(empleado.diasAusente() == 1){
			return 50
		}
		
		return 0
	}
	
}

object bonoNulo {
	
	 method importe(empleado) = 0
	 
}

object bonoPorcentaje {
	
	method importe(empleado) = empleado.neto() * 0.1
	
}

object bonoFijo {
	
	method importe(empleado) = 80
	
}





