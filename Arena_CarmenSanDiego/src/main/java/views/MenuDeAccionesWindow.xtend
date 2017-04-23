package views

import applicationModels.MenuDeAccionesModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.HorizontalLayout
import views.MapamundiWindow
import views.CasoWindows
import views.ExpedientesWindow

class MenuDeAccionesWindow extends SimpleWindow<MenuDeAccionesModel>{


    override createMainTemplate(Panel menuPanel) {

        this.title = "¿Donde esta Carmen San Diego?"
        new Label(menuPanel).text = "¿Que haremos ahora detective?"
        val Panel botonesPanel = new Panel(menuPanel)
        panelDeBotones(botonesPanel)
    }

    def panelDeBotones(Panel menuPanel){
        menuPanel.layout = new HorizontalLayout

        new Button(menuPanel) => [
            caption = "Resolver Misterio"
            onClick[ | new CasoWindows(this).open]
        ]
        new Button(menuPanel) => [
            caption = "Mapamundi"
            onClick[ | new MapamundiWindow(this).open]
        ]
        new Button(menuPanel) => [
            caption = "Expediente"
            onClick[ | new ExpedientesWindow(this).open]
        ]
    }

    new (WindowOwner parent) {
        super(parent, new MenuDeAccionesModel())
    }

    override protected addActions(Panel arg0) {
        throw new UnsupportedOperationException("TODO: auto-generated method stub")
    }

    override protected createFormPanel(Panel arg0) {
        throw new UnsupportedOperationException("TODO: auto-generated method stub")
    }
}