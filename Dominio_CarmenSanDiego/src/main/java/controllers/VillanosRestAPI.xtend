package controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils
import model.ocupante.Villano
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import applicationModels.ExpedientesAppModel
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.api.annotation.Delete
import dtos.VillanoDTO
import java.util.stream.Collectors
import java.util.List

@Controller
class VillanosRestAPI {
	val expedientesModel = new ExpedientesAppModel()
	extension JSONUtils = new JSONUtils

	@Get("/villanos")
	def getVillanos() {
		response.contentType = ContentType.APPLICATION_JSON

		var List<VillanoDTO> villanosSimple = expedientesModel.villanos.stream.map(v | new VillanoDTO(v)).collect(Collectors.toList)
		ok(villanosSimple.toJson)
	}
	
	@Get("/villanos/:id")
	def getVillano() {
		response.contentType = ContentType.APPLICATION_JSON
		try {
			ok(expedientesModel.villanos.findFirst[ it.id == Integer.valueOf(id) ].toJson)
		}
		catch(Exception e) {
			badRequest("El id debe ser un numero entero")
		}
	}
	
	@Post("/villanos")
	def createVillano(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON	
		try {
			val Villano villano = body.fromJson(Villano)
			try {
				expedientesModel.agregarVillano(villano)
				ok("Se agrego el nuevo villano")
			}
			catch(Exception e) {
				badRequest(e.message)
			}
		}
		catch(Exception e) {
			badRequest("El body debe ser un villano")
		}
	}
	
	@Put("/villanos")
	def upVillano(@Body String body) {
		response.contentType = ContentType.APPLICATION_JSON
		try {
			val Villano villano = body.fromJson(Villano)
			expedientesModel.updateVillano(villano)
			ok("Villano actualizado correctamente")
		}
		catch(Exception e) {
			badRequest("El body debe ser un villano")
		}
	}
	
	@Delete("/villanos/:id")
	def deleteVillano() {
		response.contentType = ContentType.APPLICATION_JSON
		try {
			expedientesModel.deleteVillano(Integer.valueOf(id))
			ok("Villano eliminado")
		}
		catch(Exception e){
			badRequest("El id debe ser un numero")
		}
	}
}