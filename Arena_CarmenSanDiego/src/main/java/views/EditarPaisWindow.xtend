package views

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import pais.Pais
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button

class EditarPaisWindow extends Dialog<Pais>{
	
	new(WindowOwner parent, Pais model) {
		super(parent, model)
	}
	
	override createMainTemplate(Panel mainPanel){
		
		this.title = "Mapamundi - Editar Pais"
		
		
		val Panel nombrePais = new Panel(mainPanel)
		nombrePais.layout = new ColumnLayout(2)
		new Label (nombrePais).text = "Nombre:"
		new TextBox(nombrePais).value <=>"nombre"
		
		val Panel caractPanel = new Panel(mainPanel)
		caractPanel.layout = new ColumnLayout(2)
		new Label(caractPanel).text = "Caracteristicas"
		new Button(caractPanel) =>[ caption = "Editar Caracteristicas" 
			// onClick[| ]
		]
		new Label (mainPanel).text = "Caracteristicas"
		new List<Pais>(mainPanel) => [
			 items <=> "caracteristicas"
		]
		
		val Panel conexionesPanel = new Panel(mainPanel)
		conexionesPanel.layout = new ColumnLayout(2)
		new Label (conexionesPanel).text = "Conexiones"
		new Button(conexionesPanel) => [ caption = "Editar Conexiones"
			//onClick[| ]
			
		]
		new Label(mainPanel).text = "Conexiones" 
		new List<Pais>(mainPanel) => [
			items <=> "conexiones"
		]
		
		val Panel lugaresPanel = new Panel(mainPanel)
		lugaresPanel.layout = new ColumnLayout(2)
		new Label(lugaresPanel).text = "Lugares de Interes"
		new Button (lugaresPanel)=> [ caption = "Editar Lugares de Interes"
			//onClick[| ]
		]
		
		new Label(mainPanel).text = "Lugares de Interes"
		new List<Pais>(mainPanel) => [
			items <=> "lugaresDeInteres"
		]
		
		new Button (mainPanel) => [ caption = "Aceptar"
			onClick[| this.close]
		]
	}
	
	
	override protected addActions(Panel actionsPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
		
}