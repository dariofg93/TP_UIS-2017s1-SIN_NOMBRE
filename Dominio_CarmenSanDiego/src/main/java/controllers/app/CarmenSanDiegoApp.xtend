package controllers.app

import org.uqbar.xtrest.api.XTRest
import controllers.PaisesRestAPI
import controllers.VillanosRestAPI
import controllers.ViajarRestAPI
import controllers.IniciarJuegoAPI
import controllers.EmitirOrdenParaRestAPI
import controllers.PistaDelLugarRestAPI

class CarmenSanDiegoApp{

    def static void main(String[] args) {
    	XTRest.startInstance(new IniciarJuegoAPI(), 9000)
    }
}