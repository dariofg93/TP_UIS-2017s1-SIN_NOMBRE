package controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.json.JSONUtils
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import caso.Caso
import pais.Pais
import dummies.CasosRespositorio
import org.uqbar.xtrest.http.ContentType

@Controller
class ViajarRestAPI {
	extension JSONUtils = new JSONUtils
	
	@Post("/viajar/:idPais/:idCaso")
	def viajar() {
		response.contentType = ContentType.APPLICATION_JSON
		
		try {
			val Caso caso = CasosRespositorio.buscarCaso(Integer.valueOf(idCaso))
			val Pais paisAViajar = caso.buscarConexion(Integer.valueOf(idPais))
			
			caso.detective.viajar(paisAViajar)
			ok(caso.toJson)
		}
		catch(Exception e) {
			badRequest("El body debe ser un caso")
		}
	}
	
}