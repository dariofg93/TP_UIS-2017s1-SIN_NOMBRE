package applicationModels

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ocupante.Villano
import java.util.List

@Accessors
@Observable
class ExpedientesAppModel {
	
	List<Villano> villanos
	Villano villanoSeleccionado
}