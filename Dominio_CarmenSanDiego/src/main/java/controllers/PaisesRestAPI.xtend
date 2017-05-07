package controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import dummies.BaseCentralRepositorio

@Controller
class PaisesRestAPI{
    extension JSONUtils = new JSONUtils

    //Devuelve todos los paises registrados.
    @Get("/paises")
    def getPaises() {
        response.contentType = ContentType.APPLICATION_JSON
        ok(BaseCentralRepositorio.mapamundi.toJson)
    }
}