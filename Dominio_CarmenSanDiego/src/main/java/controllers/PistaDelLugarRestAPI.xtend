package controllers

import model.caso.Caso
import dummies.CasosRespositorio
import model.lugar.Lugar
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import model.pais.Pais
import org.uqbar.commons.model.UserException
import model.registroLugar.RegistroLugar

@Controller
class PistaDelLugarRestAPI {
	extension JSONUtils = new JSONUtils
	
	@Get("/paisActual/:idCaso")
	def getPaisActual(){
		response.contentType = ContentType.APPLICATION_JSON
		
		try{
			val Caso caso = CasosRespositorio.buscarCaso(Integer.valueOf(idCaso))
			
			val de = caso.detective
			val la = de.lugarActual
			
			ok(la.toJson)
		}
		catch(UserException e){
			println(e)
			badRequest("El caso no existe")
		}
	}
	
	@Get("/pistaDelLugar/:idCaso/:nombreLugar")
	def getPistaDelLugar(){
		response.contentType = ContentType.APPLICATION_JSON
		
		try {
			val Caso caso = CasosRespositorio.buscarCaso(Integer.valueOf(idCaso))
			val RegistroLugar registroLugar = caso.BuscarRegistroLugar(nombreLugar)

			ok(registroLugar.ocupante.toJson)
		}
		catch(Exception e){
			badRequest("El nombre del lugar no es valido o el id del caso es incorrecto")
		}
		
	}
}