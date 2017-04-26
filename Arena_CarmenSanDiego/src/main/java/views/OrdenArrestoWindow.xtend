package views

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import applicationModels.ResolverMisterioAppModel
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.PropertyAdapter
import ocupante.Villano
import org.uqbar.arena.widgets.Button
import applicationModels.OrdenDeArrestoAppModel
import applicationModels.OrdenDeArrestoAppModel.*
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class OrdenArrestoWindow extends SimpleWindow<OrdenDeArrestoAppModel> {

    new(WindowOwner parent, OrdenDeArrestoAppModel model) {
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
            val model = new ResolverMisterioAppModel(this.modelObject.getDetective,this.modelObject.getNombreCaso)
			onClick[| 
				modelObject.setOrden()
                this.close new ResolverMisterioWindows(this,model).open
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