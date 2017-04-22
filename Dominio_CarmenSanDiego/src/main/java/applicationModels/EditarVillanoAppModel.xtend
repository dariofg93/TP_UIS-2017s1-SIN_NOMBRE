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
	
	new(Villano villano) {
		villanoSeleccionado = villano
	}
	
	def eliminarSenia() {
		villanoSeleccionado.eliminarSenia(seniaSeleccionada)
	}
	
}