package views

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import applicationModels.ResolverMisterioAppModel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.PropertyAdapter
import ocupante.Villano
import org.uqbar.arena.widgets.Button

class OrdenArrestoWindow extends SimpleWindow<ResolverMisterioAppModel> {

    new(WindowOwner parent, ResolverMisterioAppModel model) {
        super(parent, model)
    }

    override createMainTemplate(Panel mainPanel) {
        this.title = "Resolviendo: " + this.modelObject.getNombreCaso
        
        val Panel selectorPanel = new Panel(mainPanel)
        selectorPanel.layout = new ColumnLayout(2)
        new Label(selectorPanel).text = "Villano"  
        new Selector(selectorPanel) => [
        	value <=> "villanoSeleccionado"
        	(items <=> "villanos").adapter = new PropertyAdapter(Villano, "nombre")
        	
        ]

		new Button(mainPanel) => [
			caption = "Generar Orden De Arresto"
			onClick[| 
				modelObject.setOrden(modelObject.villanoSeleccionado)
				this.close
			]
		]

    }

    override protected addActions(Panel actionsPanel) {
        throw new UnsupportedOperationException("TODO: auto-generated method stub")
    }

    override protected createFormPanel(Panel mainPanel) {
        throw new UnsupportedOperationException("TODO: auto-generated method stub")
    }

}