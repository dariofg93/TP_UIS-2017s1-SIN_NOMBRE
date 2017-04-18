package application

import org.uqbar.arena.Application
import applicationModels.ExpedientesAppModel
import views.ExpedientesWindow

class CarmenSandiegoApplication extends Application{
	
	//Pongo como MainWindow expedientes para probar, pero deberia ir la vista de inicio por defecto
	override protected createMainWindow() {
		val model = new ExpedientesAppModel => [
			//villanos = DummyData.crearListaVillanos()
		]
		
		new ExpedientesWindow(this, model)		
	}
	
	def static void main(String[] args) {
		new CarmenSandiegoApplication().start
	}
}