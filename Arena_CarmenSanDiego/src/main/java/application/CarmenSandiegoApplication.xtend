package application

import org.uqbar.arena.Application
import views.MenuDeAccionesWindow

class CarmenSandiegoApplication extends Application{

    override protected createMainWindow() {
        new MenuDeAccionesWindow(this)
    }

    def static void main(String[] args) {
        new CarmenSandiegoApplication().start
    }
}