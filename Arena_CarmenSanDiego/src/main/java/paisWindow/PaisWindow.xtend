package paisWindow

import org.uqbar.arena.windows.MainWindow
import controllers.PaisApplicationModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.VerticalLayout
import org.uqbar.arena.windows.ErrorsPanel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button

class PaisWindow extends MainWindow<PaisApplicationModel>{


    new () {
        super(new PaisApplicationModel)
    }


    override createContents(Panel mainPanel) {
        this.title = "Mapamundi"
        // no es necesario, el layout default es el vertical
        mainPanel.layout = new VerticalLayout

        new ErrorsPanel(mainPanel, "Listo para convertir")

        new Button(mainPanel) => [
            caption = "Eliminar"
          //  onClick [ | this.modelObject.convertir ]
        ]

        new Button(mainPanel) => [
            caption = "Editar"
            //  onClick [ | this.modelObject.convertir ]
        ]

        new Button(mainPanel) => [
            caption = "Nuevo"
            //  onClick [ | this.modelObject.convertir ]
        ]

        new Label(mainPanel).text = "te fuiste amargo"

    }

    def static main(String[] args) {
         new PaisWindow().startApplication
    }


}