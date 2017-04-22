package application

import org.uqbar.arena.Application
import applicationModels.ExpedientesAppModel
import dummies.VillanosRepositorio
import views.ExpedientesWindow
import caso.CasoWindows
import pais.Pais
import java.util.Arrays
import lugar.Club
import lugar.Banco
import views.EditarPaisWindow

class CarmenSandiegoApplication extends Application{

    //Pongo como MainWindow expedientes para probar, pero deberia ir la vista de inicio por defecto
    override protected createMainWindow() {
        val model = new ExpedientesAppModel => [
            villanos = VillanosRepositorio.getVillanos()
        ]
         var bbva = new Banco("BBVA Frances"); var carp = new Club("River Plate")
		 var argentina = new Pais("Argentina",
        Arrays.asList("Hablan español", "Badera celeste y blanca","Toman mate"),
        Arrays.asList(),
        Arrays.asList(bbva,carp))

        
        new ExpedientesWindow(this, model)
    }

    def static void main(String[] args) {
        new CarmenSandiegoApplication().start
    }
}