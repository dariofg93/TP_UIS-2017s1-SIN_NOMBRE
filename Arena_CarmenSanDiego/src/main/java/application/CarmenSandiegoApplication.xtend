package application

import org.uqbar.arena.Application
import applicationModels.ExpedientesAppModel
import dummies.VillanosRepositorio
import views.CasoWindows
import views.MenuDeAccionesWindow
import views.ExpedientesWindow
import dummies.PaisesRepositorio
import views.EditarPaisWindow

class CarmenSandiegoApplication extends Application{

    //Pongo como MainWindow expedientes para probar, pero deberia ir la vista de inicio por defecto
    override protected createMainWindow() {
        val model = new ExpedientesAppModel => [
            villanos = VillanosRepositorio.getVillanos()
        ]
		
		new ExpedientesWindow(this, model)
        new EditarPaisWindow(this, PaisesRepositorio.getMapamundi().get(0))
    }


    def static void main(String[] args) {
        new CarmenSandiegoApplication().start
    }
}