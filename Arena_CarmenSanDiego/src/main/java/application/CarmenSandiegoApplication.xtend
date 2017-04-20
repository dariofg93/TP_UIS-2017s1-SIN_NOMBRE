package application

import org.uqbar.arena.Application
import applicationModels.ExpedientesAppModel
import dummies.VillanosRepositorio
import views.ExpedientesWindow
import caso.CasoWindows
import menuDeAcciones.MenuDeAccionesWindow

class CarmenSandiegoApplication extends Application{

    //Pongo como MainWindow expedientes para probar, pero deberia ir la vista de inicio por defecto
    override protected createMainWindow() {
        val model = new ExpedientesAppModel => [
            villanos = VillanosRepositorio.getVillanos()
        ]

        new ExpedientesWindow(this, model)
    }

    def static void main(String[] args) {
        new CarmenSandiegoApplication().start
    }
}