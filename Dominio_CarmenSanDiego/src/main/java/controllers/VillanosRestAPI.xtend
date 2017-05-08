package controllers

import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.json.JSONUtils
import java.util.List
import java.util.ArrayList
import ocupante.Villano
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.api.annotation.Body
import applicationModels.ExpedientesAppModel
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.api.annotation.Delete

@Controller
class VillanosRestAPI {
	val List<Villano> villanosRepo = ExpedientesAppModel.getVillanos()
		extension JSONUtils = new JSONUtils
	
	@Get("/villanos")
	def getVillanos() {
		response.contentType = ContentType.APPLICATION_JSON
		val List<String> villanosNombre = new ArrayList<String>()
		
		for(Villano villano : villanosRepo) {
			villanosNombre.add(villano.nombre)
		}
		ok(villanosNombre.toJson)
	}
	
	@Get("/villanos/:id")
	def getVillano() {
		response.contentType = ContentType.APPLICATION_JSON
		try {
			ok(villanosRepo.findFirst[ it.id == Integer.valueOf(id) ].toJson)
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
				ExpedientesAppModel.agregarVillano(villano)
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
			ExpedientesAppModel.updateVillano(villano)
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
			ExpedientesAppModel.deleteVillano(Integer.valueOf(id))
			ok("Villano eliminado")
		}
		catch(Exception e){
			badRequest("El id debe ser un numero")
		}
	}	
	
}