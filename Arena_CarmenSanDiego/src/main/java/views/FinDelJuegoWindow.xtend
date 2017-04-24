package views

import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import orden.OrdenEmitida
import java.awt.Color
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button

class FinDelJuegoWindow extends SimpleWindow<OrdenEmitida> {


    override createMainTemplate(Panel finalPanel) {

        this.title = "Robo del Faraón - Resuelto"
        juegoGanado(finalPanel)
        juegoPerdido(finalPanel)
      }

    def juegoGanado(Panel mainPanel){

        new Label(mainPanel).text = "En Hora Buena!!!"
        new Label(mainPanel).text = "He detenido a "+ this.modelObject.getNombre +
                " y recuperado la tumba del Faraon"
        new Label(mainPanel) => [
            text ="Felicitaciones!!!"
            background = Color.GREEN
        ]

        new Button(mainPanel) => [
            caption = "Disfrutar de nuestra victoria"
            onClick[ | this.close ]
        ]
    }

    def juegoPerdido(Panel mainPanel){

        //JUEGO Perdido
        new Label(mainPanel) => [
            text ="Mala Noticia!!!"
            background = Color.RED
        ]
        new Label(mainPanel).text = "He detenido a "+ this.modelObject.getNombre+
                " pero usted tenia una orden de arresto contra Carmen San Diego"

        new Label(mainPanel).text = "Lamentablemente el crimen queda impune"

        new Button(mainPanel) => [
            caption = "Aceptar el error cometido"
            onClick[ | this.close ]
        ]
    }





    override addActions(Panel actionsPanel) {
        throw new UnsupportedOperationException()
    }

    override createFormPanel(Panel mainPanel) {
        throw new UnsupportedOperationException()
    }

    new (WindowOwner parent) {//UNA ORDEN DE ARRESTO DEBERIA TENER
        super(parent,new OrdenEmitida("cc"))
    }


}