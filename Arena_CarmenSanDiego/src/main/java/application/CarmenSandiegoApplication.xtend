package application

import org.uqbar.arena.Application
import applicationModels.ExpedientesAppModel
import dummies.VillanosRepositorio
import views.CasoWindows
import menuDeAcciones.MenuDeAccionesWindow

class CarmenSandiegoApplication extends Application{

    //Pongo como MainWindow expedientes para probar, pero deberia ir la vista de inicio por defecto
    override protected createMainWindow() {
        val model = new ExpedientesAppModel => [
            villanos = VillanosRepositorio.getVillanos()
        ]

        new MenuDeAccionesWindow(this)
    }

    def static void main(String[] args) {
        new CarmenSandiegoApplication().start
    }
}