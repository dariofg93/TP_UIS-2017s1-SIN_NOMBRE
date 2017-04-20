package views

import org.uqbar.arena.windows.WindowOwner
import ocupante.Villano

class NuevoVillanoWindow extends EditarVillanoWindow {
	
	new(WindowOwner owner, Villano model) {
		super(owner, model)
		title = "Expedientes - Nuevo Villano"
	}

	
}