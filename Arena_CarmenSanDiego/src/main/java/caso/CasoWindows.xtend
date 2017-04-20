package caso

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import applicationModels.CasoApplicationModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import applicationModels.ResolverMisterioAppModel
import views.ResolverMisterioWindows
import org.uqbar.arena.layout.HorizontalLayout

class CasoWindows extends SimpleWindow<CasoApplicationModel>{

    new(WindowOwner parent) {
        super(parent,new CasoApplicationModel())
    }

    override protected addActions(Panel actionsPanel) {
        //no queremos usar este template default
    }

    override protected createFormPanel(Panel mainPanel) {
        //no queremos usar este template default
    }

    override createMainTemplate(Panel mainPanel) {
        this.title = this.modelObject.getObjetoRobado

        new Label(mainPanel) => [
            value <=> "reporte"
        ]

        new Button(mainPanel) => [
            caption = "Aceptar el caso"
            val model = new ResolverMisterioAppModel(this.modelObject.getDetective,this.modelObject.getObjetoRobado)
            onClick[ | this.close new ResolverMisterioWindows(this,model).open ]
        ]
    }
}