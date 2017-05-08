package controllers.app

import org.uqbar.xtrest.api.XTRest
import controllers.PaisesRestAPI
import controllers.EmitirOrdenParaRestAPI

class CarmenSanDiegoApp{

    def static void main(String[] args) {
        XTRest.startInstance(new PaisesRestAPI(), 9000)
    }
}