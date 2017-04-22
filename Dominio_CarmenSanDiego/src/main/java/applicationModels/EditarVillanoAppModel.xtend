package applicationModels

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ocupante.Villano

@Accessors
@Observable
class EditarVillanoAppModel {
	
	Villano villanoSeleccionado
	String seniaSeleccionada
	String seniaParaAgregar
	String hobbieSeleccionado
	String hobbieParaAgregar
	
	new(Villano villano) {
		villanoSeleccionado = villano
	}
	
	def agregarSenia(String senia) {
		villanoSeleccionado.agregarSenia(senia)
	}
	
	def eliminarSenia(String senia) {
		villanoSeleccionado.eliminarSenia(senia)
	}
	
	def agregarHobbie(String hobbie) {
		villanoSeleccionado.eliminarHobbie(hobbie)
	}
	
	def eliminarHobbie(String hobbie) {
		villanoSeleccionado.eliminarHobbie(hobbie)
	}
	
}