package controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import orden.OrdenNula
import dummies.CasosRespositorio

@Controller
class EmitirOrdenParaRestAPI {
    extension JSONUtils = new JSONUtils

    //getPistas: Dado un lugar y un caso, devuelve la pista del lugar.
    @Get("/casos")
    def getPista(String caso,String lugar) {
        //var unCaso = CasosRespositorio.casos.findFirst[ it.objeto == caso ]
        //var unLugar = unCaso.BuscarLugar(lugar)

        response.contentType = ContentType.APPLICATION_JSON
        ok(CasosRespositorio.casos.get(0).toJson)
        //unLugar.mostrarPistas(new OrdenNula())
    }
}