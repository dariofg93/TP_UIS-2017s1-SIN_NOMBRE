package applicationModels

import pais.Pais

class EditarPaisAppModel {
	
	Pais paisSeleccionado
	String caracteristicaSeleccionada
	String caracteristicaParaAgregar

	new(Pais pais){
		paisSeleccionado = pais
	}
	
	def eliminarCaracteristica(String caracteristica) {
		paisSeleccionado.eliminarCaracteristica(caracteristica)
	}
	
	def agregarCaracteristica(String caracteristica){
		paisSeleccionado.agregarCaracteristica(caracteristica)
	}
	
		
}