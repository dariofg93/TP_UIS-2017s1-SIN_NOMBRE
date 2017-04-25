package views

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import applicationModels.VisitarAppModel
import applicationModels.VisitarAppModel.*
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import applicationModels.ResolverMisterioAppModel

class VisitarWindows extends Dialog<VisitarAppModel>{

    new (WindowOwner owner, VisitarAppModel model) {
        super(owner, model)
    }

    override createFormPanel(Panel panel) {
        this.title = "Resolviendo: " + this.modelObject.getNombreCaso

        new Label(panel).text = "Estas vistando: " + this.modelObject.nombreDelLugar

        new Label(panel).text = ""

        new Label(panel)=>[
            value <=> "info"
        ]

        new Label(panel).text = ""

        new Button(panel) => [
            caption = "Continuar"
            onClick[ this.close abrirVentanaCorrespondiente() ]
        ]
    }

    def abrirVentanaCorrespondiente(){
        if(this.modelObject.estaElVillano){
            new FinDelJuegoWindow(this).open
        }else{
            val model = new ResolverMisterioAppModel(this.modelObject.getDetective,this.modelObject.getNombreCaso)
            new ResolverMisterioWindows(this,model).open
        }
    }
}