package Expedientes

import applicationModels.ExpedientesAppModel
import org.uqbar.arena.windows.Window
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button

class ExpedientesWindow extends Window<ExpedientesAppModel> {
	
	new(WindowOwner owner, ExpedientesAppModel model) {
		super(owner, model)
		title = "Expedientes"
	}
	
	override createContents(Panel expedientesPanel) {
		new List(expedientesPanel) => [
            //items <=> "villanos.nombre"
            //value <=> "villanoSeleccionado"
            width = 220
            height = 220
		]
      
		new Button(expedientesPanel) => [
	      caption = "Nuevo"
		  setAsDefault
		  //onClick[ | nuevoVillano  ]
		]
		
		new Button(expedientesPanel) => [
		  caption = "Nuevo"
		  setAsDefault
		  //onClick[ | editarVillano  ]
		]
	}
	
	
}