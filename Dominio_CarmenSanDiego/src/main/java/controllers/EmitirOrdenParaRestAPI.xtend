package controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.commons.model.UserException
import caso.Caso
import ocupante.Villano

@Controller
class EmitirOrdenParaRestAPI {
    extension JSONUtils = new JSONUtils

    //emitirOrden: Espera un villano y un caso y devuelve ok o nok
    @Post("/emitirOrden")
    def emitirOrden(@Body String unVillano, @Body String unCaso) {

        response.contentType = ContentType.APPLICATION_JSON
        var Villano villano = unVillano.fromJson(Villano)
        var Caso caso = unCaso.fromJson(Caso)

        try {
            caso.detectiveEmiteOrdenContra(villano)
            ok()
        }
        catch (UserException exception) {
            badRequest(exception.message)
        }
    }
}