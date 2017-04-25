package views

import org.uqbar.arena.windows.SimpleWindow
import applicationModels.ResolverMisterioAppModel
import applicationModels.ResolverMisterioAppModel.*
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.VerticalLayout
import lugar.Lugar
import org.uqbar.arena.widgets.List
import applicationModels.ViajarAppModel
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import applicationModels.VisitarAppModel
import applicationModels.ExpedientesAppModel

class ResolverMisterioWindows extends SimpleWindow<ResolverMisterioAppModel>{

    new (WindowOwner parent, ResolverMisterioAppModel model) {
        super(parent, model)
    }

    override addActions(Panel actionsPanel) { /* No es necesario */ }

    override createFormPanel(Panel mainPanel) {
        this.title = "Resolviendo: " + this.modelObject.getNombreCaso

        val Panel detectivePanel = new Panel(mainPanel)
        detectivePanel.layout= new ColumnLayout(2)

        this.funcionesDetective(detectivePanel)
        this.vistasLugares(detectivePanel)
        this.rastreoCriminal(mainPanel)
    }

    def funcionesDetective(Panel detectivePanel){

        val Panel acciones = new Panel(detectivePanel)
        acciones.layout= new VerticalLayout

        val Panel lugar = new Panel(acciones)
        lugar.layout= new HorizontalLayout

        new Label(lugar) => [
            text = "Estás en: "
            fontSize = 12
        ]
        new Label(lugar)=>[
            value <=> "detective.lugarActual.nombre"
            fontSize = 12
        ]

        new Label(acciones).text = ""

        new Button(acciones) => [
            caption = "Orden de arresto"
            val model = new ExpedientesAppModel()
            onClick[ | new OrdenArrestoWindow(this,model).open  ]
        ]

        val Panel orden = new Panel(acciones)
        orden.layout= new HorizontalLayout

        new Label(orden)=>[
            text = "Orden ya emitida: "+this.modelObject.nombreOrdenEmitida
            fontSize = 6
        ]

        new Button(acciones) => [
            caption = "Viajar"
            val model = new ViajarAppModel(this.modelObject.getDetective,this.modelObject.getNombreCaso)
            onClick[ | this.close new ViajarWindows(this,model).open ]
        ]

        new Label(acciones).text = ""

        new Button(acciones) => [
            caption = "Expedientes"
            onClick[ | new ExpedientesWindow2(this).open  ]
        ]

        new Label(acciones).text = ""
    }

    def vistasLugares(Panel owner){

        val Panel lugares = new Panel(owner)
        lugares.layout= new VerticalLayout

        new Label(lugares) => [
            text = "Lugares"
            fontSize = 12
        ]

        new Label(lugares).text = ""

        for(Lugar lugar: this.modelObject.getDetective.lugarActual.lugaresDeInteres) {
            new Button(lugares) => [
                caption = lugar.nombre
                onClick[
                    val model = new VisitarAppModel(this.modelObject.getDetective.visitar(lugar),lugar,this.modelObject.getNombreCaso,this.modelObject.getDetective)
                    this.close new VisitarWindows(this,model).open
                ]
            ]
            new Label(lugares).text = ""
        }
    }

    def rastreoCriminal(Panel mainPanel){

        val Panel rastreoPanel = new Panel(mainPanel)
        rastreoPanel.layout= new ColumnLayout(2)
        val Panel panel1 = new Panel(rastreoPanel)

        new Label(panel1).text = "Recorrido criminal:"

        new Label(panel1) => [
            text = this.modelObject.getDetective.recorridoCriminal.join("->")
        ]

        new Label(panel1).text = "Destino fallidos:"

        new List<String>(panel1) => [
            items <=> "detective.destinosFallidos"
            height = 80
            width = 10
        ]
    }
}