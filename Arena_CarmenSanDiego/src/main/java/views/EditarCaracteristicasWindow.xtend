package views

import applicationModels.EditarPaisAppModel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button

class EditarCaracteristicasWindow extends Dialog<EditarPaisAppModel> {
	
	new(WindowOwner owner, EditarPaisAppModel model) {
		super(owner, model)
	}
	
	override createMainTemplate(Panel mainPanel){
		this.title = "Editar Caracteristicas"
		
		new Label(mainPanel).text = "Caracteristicas"
		new List<String>(mainPanel) => [
			height=80
			width=130
			value <=> "caracteristicasSeleccionadas"
			items <=> "paisSeleccionado.caracteristicas"
			
		]
		
		new Button(mainPanel) => [
			caption = "Eliminar"
			onClick[ | this.modelObject.eliminarCaracteristica("caracteristicaSeleccionada")]
		]
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}