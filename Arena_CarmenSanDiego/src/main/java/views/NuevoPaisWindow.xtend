package views

import org.uqbar.arena.windows.WindowOwner
import pais.Pais

class NuevoPaisWindow extends EditarPaisWindow{
	
	new(WindowOwner parent, Pais model) {
		super(parent, model)
	}
	
	override String title() {
		return "Mapamundi - Nuevo Pais" 
	}
	
}