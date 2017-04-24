package views

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import applicationModels.VisitarAppModel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout

class VisitarWindows extends Dialog<VisitarAppModel>{

    new (WindowOwner owner, VisitarAppModel model) {
        super(owner, model)
    }

    override createFormPanel(Panel panel) {
        this.title = "Resolviendo: " + this.modelObject.getNombreCaso

        new Label(panel).text = "Estas vistando: " + this.modelObject.getNombreLugar

        new Label(panel).text = ""

        new Label(panel)=>[
            value <=> "info"
        ]

        new Label(panel).text = ""

        val Panel continuarPanel = new Panel(panel)
        continuarPanel.layout= new ColumnLayout(2)

        new Button(continuarPanel) => [
            caption = "Continuar"
            onClick[ | this.close ]
        ]
    }
}