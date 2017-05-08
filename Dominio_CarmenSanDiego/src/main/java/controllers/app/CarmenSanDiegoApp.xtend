package controllers.app

import org.uqbar.xtrest.api.XTRest
import controllers.PaisesRestAPI
import controllers.VillanosRestAPI

class CarmenSanDiegoApp{

    def static void main(String[] args) {
        XTRest.startInstance(new VillanosRestAPI(), 9000)
    }
}