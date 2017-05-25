package controllers.app

import org.uqbar.xtrest.api.XTRest
import controllers.PaisesRestAPI
import controllers.VillanosRestAPI
import controllers.ViajarRestAPI
import controllers.IniciarJuegoAPI
import controllers.EmitirOrdenParaRestAPI
import controllers.PistaDelLugarRestAPI
import controllers.CarmenSanDiegoRestAPI

class CarmenSanDiegoApp{

    def static void main(String[] args) {
<<<<<<< HEAD
    	XTRest.startInstance(new IniciarJuegoAPI(), 9000)
=======
        XTRest.startInstance(new CarmenSanDiegoRestAPI(), 9000)
>>>>>>> e671d3d933f7b9f334572a8454ed8fc397d2f83c
    }
}