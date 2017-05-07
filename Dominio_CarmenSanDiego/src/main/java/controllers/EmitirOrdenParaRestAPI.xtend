package controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import caso.Caso
import lugar.Lugar
import orden.OrdenNula

@Controller
class EmitirOrdenParaRestAPI {
    extension JSONUtils = new JSONUtils

    //getPistas: Dado un lugar y un caso, devuelve la pista del lugar.
    @Get("/libros")//Faltan muchas cosas en este metodo...
    def getPista(Caso unCaso, Lugar unLugar) {
        response.contentType = ContentType.APPLICATION_JSON
        ok(unLugar.mostrarPistas(new OrdenNula()).toJson)
    }
}