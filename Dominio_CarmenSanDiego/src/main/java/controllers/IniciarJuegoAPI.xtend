package controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils
import dummies.CasosRespositorio
import applicationModels.CreadorDeJuegoAppModel

@Controller
class IniciarJuegoAPI {
    extension JSONUtils = new JSONUtils

    @Post("/iniciarJuego")
    def iniciarJuego() {
        var CreadorDeJuegoAppModel caso = new CreadorDeJuegoAppModel(CasosRespositorio.casos.get(0))
        ok(caso.toJson)
    }
}
