package controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.commons.model.UserException
import model.caso.Caso
import model.ocupante.Villano
import dummies.CasosRespositorio
import dummies.BaseCentralRepositorio
import dtos.OrdenEmitidaDTO

@Controller
class EmitirOrdenParaRestAPI {
    extension JSONUtils = new JSONUtils

    //emitirOrden: Espera un villano y un caso y devuelve ok o nok
    @Post("/emitirOrden/:idVillano/:idCaso")
    def emitirOrden() {
        response.contentType = ContentType.APPLICATION_JSON

        try {
            val Caso caso = CasosRespositorio.buscarCaso(Integer.valueOf(idCaso))
            val Villano villano = BaseCentralRepositorio.buscarVillano(Integer.valueOf(idVillano))

            caso.detectiveEmiteOrdenContra(villano)
            ok(new OrdenEmitidaDTO(caso.id,villano.id).toJson)
        }
        catch (UserException exception) {
            badRequest("Se deben pasar por parametros un villano y un caso")
        }
        catch(NumberFormatException ex) {
            badRequest("Los IDs deben ser numeros enteros")
        }
    }
}