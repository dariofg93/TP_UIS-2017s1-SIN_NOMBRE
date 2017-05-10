package controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils
import java.util.List
import pais.Pais
import dummies.BaseCentralRepositorio
import applicationModels.MapamundiAppModel
import org.uqbar.xtrest.http.ContentType
import applicationModels.IniciarJuegoAppModel
import dummies.CasosRespositorio
import dummies.CrearJuegoRepositorio
import org.uqbar.xtrest.api.annotation.Get

@Controller
class IniciarJuego {

    val  caso = CrearJuegoRepositorio.getJuego
    val iniciarJuegoAppModel = new IniciarJuegoAppModel(caso)
    extension JSONUtils = new JSONUtils

    @Get("/iniciarJuego")
    def iniciarUnJuego() {
        response.contentType = ContentType.APPLICATION_JSON
        ok(iniciarJuegoAppModel.toJson)
    }
}
