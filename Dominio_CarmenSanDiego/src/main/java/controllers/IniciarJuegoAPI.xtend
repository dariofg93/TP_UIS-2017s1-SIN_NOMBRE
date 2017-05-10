package controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.json.JSONUtils
import dummies.CasosRespositorio
import applicationModels.CreadorDeJuegoAppModel
import org.uqbar.xtrest.http.ContentType
import org.omg.CORBA.UserException

@Controller
class IniciarJuegoAPI {
    extension JSONUtils = new JSONUtils

    @Post("/iniciarJuego")
    def iniciarJuego() {
        //try{
            var CreadorDeJuegoAppModel caso = new CreadorDeJuegoAppModel(CasosRespositorio.casos.get(0))
            ok(caso.toJson)
        //}catch(UserException e){
        //    e.printStackTrace
        //    badRequest("No se inicializo el juego")
        //}
    }

}
