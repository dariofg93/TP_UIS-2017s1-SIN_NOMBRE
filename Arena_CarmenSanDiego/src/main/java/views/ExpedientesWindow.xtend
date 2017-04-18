package views

import applicationModels.ExpedientesAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import ocupante.Villano
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class ExpedientesWindow extends SimpleWindow<ExpedientesAppModel> {

	new(WindowOwner parent, ExpedientesAppModel model) {
		super(parent, model)
	}
	
	override protected addActions(Panel arg0) {
		//no queremos usar este template default
	}
	
	override protected createFormPanel(Panel arg0) {
		//no queremos usar este template default
	}

	override createMainTemplate(Panel expedientesPanel) {
		this.title = "Expedientes"

		//Creo lista de villano
		new Label(expedientesPanel).text = "Villano"
		new List<Villano>(expedientesPanel) => [
            value <=> "villanoSeleccionado"
            items <=> "villanos.nombre"
		]
      
		new Button(expedientesPanel) => [
	      caption = "Nuevo"
		  //onClick[ | nuevoVillano  ]
		]
		
		new Button(expedientesPanel) => [
		  caption = "Editar"
		  //onClick[ | editarVillano  ]
		]
	}
	
	def static void main(WindowOwner parent, ExpedientesAppModel model) {
		new ExpedientesWindow(parent, model)
	}
	
}
