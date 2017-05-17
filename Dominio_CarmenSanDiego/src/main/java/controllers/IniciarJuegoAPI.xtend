package controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils
import dummies.CasosRespositorio
import dtos.CasoDTO

@Controller
class IniciarJuegoAPI {
    extension JSONUtils = new JSONUtils

    @Post("/iniciarJuego")
    def iniciarJuego() {
        var CasoDTO caso = new CasoDTO(CasosRespositorio.casos.get(0))
        ok(caso.toJson)
    }
}
