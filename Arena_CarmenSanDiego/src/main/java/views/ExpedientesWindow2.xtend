package views

import org.uqbar.arena.windows.WindowOwner
import applicationModels.ExpedientesAppModel
import org.uqbar.arena.widgets.Panel

class ExpedientesWindow2 extends ExpedientesWindow{

	new(WindowOwner parent) {
        super(parent, new ExpedientesAppModel())
    }
	
	new(WindowOwner parent, ExpedientesAppModel model) {
		super(parent, model)
	}
	
	override botonesEditarNuevo(Panel panel) {
		//Sobreescribo el metodo para quitar los botones de editar y nuevo
	}
	
}