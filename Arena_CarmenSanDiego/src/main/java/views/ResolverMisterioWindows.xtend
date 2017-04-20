package views

import org.uqbar.arena.windows.SimpleWindow
import applicationModels.ResolverMisterioAppModel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.bindings.PropertyAdapter

class ResolverMisterioWindows extends SimpleWindow<ResolverMisterioAppModel>{

    new (WindowOwner parent, ResolverMisterioAppModel model) {
        super(parent, model)
    }

    override addActions(Panel actionsPanel) {
        this.title = "Resolviendo: Robo del Faraon"
    }

    override createFormPanel(Panel mainPanel) {

        val Panel detectivePanel = new Panel(mainPanel)
        detectivePanel.layout= new ColumnLayout(2)
        this.funcionesDetective(detectivePanel)
        //this.vistasLugares(detectivePanel)
    }

    def funcionesDetective(Panel detectivePanel){

        val Panel lugar = new Panel(detectivePanel)
        lugar.layout= new HorizontalLayout

        new Label(lugar).text = "Estás en: "
        new Label(lugar)=>[
            value <=> "detective.lugarActual.nombre"
            fontSize = 12
        ]

        new Button(detectivePanel) => [
            caption = "Orden de arresto"
            //onClick[ | paisSeleccionado  ]
        ]

        val Panel orden = new Panel(detectivePanel)
        orden.layout= new HorizontalLayout

        new Label(orden).text = "Orden ya emitida: "
        new Label(orden)=>[
            value <=> "detective.ordenEmitida.nombre"
            fontSize = 8
        ]

        new Button(detectivePanel) => [
            caption = "Viajar"
            // onClick[ | paisSeleccionado  ]
        ]

        new Button(detectivePanel) => [
            caption = "Expedientes"
            //onClick[ | paisSeleccionado  ]
        ]

    }


}