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
import viewModels.VillanoViewModel

@Controller
class VillanosRestAPI {
	val expedientesModel = new ExpedientesAppModel()
	extension JSONUtils = new JSONUtils
	
	 /* @Get("/villanos")
	def getVillanos() {
		response.contentType = ContentType.APPLICATION_JSON
		val List<VillanoViewModel> villanosViewModel = new ArrayList<VillanoViewModel>()
		
		for(Villano villano : villanosRepo) {
			//Por cada villano lleno el nuevo model reducido y lo agrego a la lista
			val villanoViewModel = new VillanoViewModel(villano.nombre, villano.id)
			villanosViewModel.add(villanoViewModel)
		}
		ok(villanosViewModel.toJson)
	} */
	
	@Get("/villanos")
	def getVillanos() {
		response.contentType = ContentType.APPLICATION_JSON
		
		ok(expedientesModel.villanos.toJson)
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