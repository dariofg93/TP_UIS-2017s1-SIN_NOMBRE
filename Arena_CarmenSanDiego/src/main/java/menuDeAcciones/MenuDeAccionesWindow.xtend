package menuDeAcciones

import applicationModels.MenuDeAccionesModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import mapamundi.MapamundiWindow

class MenuDeAccionesWindow extends SimpleWindow<MenuDeAccionesModel>{

    override addActions(Panel actionsPanel) {
        //no queremos usar este template default
    }

    override createFormPanel(Panel menuPanel) {

        this.title = "¿Donde esta Carmen San Diego?"
        new Label(menuPanel).text = "¿Que haremos ahora detective?"
        val Panel botonesPanel = new Panel(menuPanel)
        panelDeBotones(botonesPanel)
    }

    def panelDeBotones(Panel menuPanel){
        menuPanel.layout = new HorizontalLayout

        new Button(menuPanel) => [
            caption = "Resolver Misterio"
            //onClick[ | nuevoVillano  ]
        ]
        new Button(menuPanel) => [
            caption = "Mapamundi"
            onClick[ | new MapamundiWindow(this).open]
        ]
        new Button(menuPanel) => [
            caption = "Expediente"
            //onClick[ | nuevoVillano  ]
        ]
    }

    new (WindowOwner parent) {
        super(parent, new MenuDeAccionesModel())
    }
}