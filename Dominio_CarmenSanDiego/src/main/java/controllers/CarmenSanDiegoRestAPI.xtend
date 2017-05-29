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
import dtos.CasoDTO
import java.util.List
import model.pais.Pais
import org.uqbar.xtrest.api.annotation.Get
import applicationModels.MapamundiAppModel
import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Put
import org.uqbar.xtrest.api.annotation.Body
import dtos.PaisSimpleDTO
import java.util.stream.Collectors
import model.registroLugar.RegistroLugar
import dtos.VillanoDTO
import applicationModels.ExpedientesAppModel
import dtos.ViajarDTO

@Controller

class CarmenSanDiegoRestAPI {

    extension JSONUtils = new JSONUtils

    val List<Pais> paises = BaseCentralRepositorio.getMapamundi()

    val MapamundiAppModel mapamundi = new MapamundiAppModel(paises)

    val expedientesModel = new ExpedientesAppModel()

    //VILLANOS
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



    //VIAJAR
    @Post("/viajar")
    def viajar(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        val req = body.fromJson(ViajarDTO)
        System.out.print("Destino id: " + req.destinoId + " Caso id: " + req.casoId)

        try {
            val Caso caso = CasosRespositorio.buscarCaso(Integer.valueOf(req.casoId))
            val Pais paisAViajar = caso.buscarConexion(Integer.valueOf(req.destinoId))

            caso.detective.viajar(paisAViajar)
            ok(caso.toJson)
        }
        catch(Exception e) {
            badRequest("El body debe ser un caso")
        }
    }

    //PISTAS DE LUGAR
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
        catch(Exception e) {
            badRequest("El nombre del lugar no es valido o el id del caso es incorrecto")
        }
    }

    //PAISES
    @Get("/paises")
    def getPaises() {
        response.contentType = ContentType.APPLICATION_JSON
        var List<PaisSimpleDTO> paisesSimples = mapamundi.paises.stream.map(p | new PaisSimpleDTO(p)).collect(Collectors.toList)
        ok(paisesSimples.toJson)
    }

    @Get("/pais/:id")
    def getPaisById() {
        response.contentType = ContentType.APPLICATION_JSON
        try {
            var pais = this.mapamundi.getPais(Integer.valueOf(id))
            if(pais == null) {
                notFound(getErrorJson("No existe pais con ese id"))
            }
        }
        catch(NumberFormatException ex) {
            badRequest(getErrorJson("El id debe ser un numero entero"))
        }
    }

    @Post("/pais")
    def createPais(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
            val Pais pais = body.fromJson(Pais)
            try {
                this.mapamundi.setPais(pais)
                ok()
            }
            catch (UserException exception) {
                badRequest(getErrorJson(exception.message))
            }
        }
        catch (UnrecognizedPropertyException exception) {
            badRequest(getErrorJson("El body debe ser un Pais"))
        }
    }

    @Put("/pais")
    def upPais(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        try {
            val Pais pais = body.fromJson(Pais)
            mapamundi.updatePais(pais)
            ok("Pais actualizado correctamente")
        }
        catch(Exception e) {
            badRequest("El body debe ser un pais")
        }
    }

    @Delete("/pais/:id")
    def deletePais() {
        response.contentType = ContentType.APPLICATION_JSON
        try {
            this.mapamundi.eliminarPais(Integer.valueOf(id))
            ok()
        }
        catch (NumberFormatException ex) {
            badRequest(getErrorJson("El id debe ser un numero entero"))
        }
    }

    private def getErrorJson(String message) {
        '{ "error": "' + message + '" }'
    }




    //INICIAR JUEGO
    @Post("/iniciarJuego")
    def iniciarJuego() {
    	response.contentType = ContentType.APPLICATION_JSON
        var CasoDTO caso = new CasoDTO(CasosRespositorio.casos.get(0))
        ok(caso.toJson)
    }

    //EMITIR ORDEN
    //emitirOrden: Espera un villano y un caso y devuelve ok o nok
    @Post("/emitirOrden")
    def emitirOrden(@Body String body) {
        response.contentType = ContentType.APPLICATION_JSON
        
        val req = body.fromJson(OrdenEmitidaDTO)

        try {
            val Caso caso = CasosRespositorio.buscarCaso(Integer.valueOf(req.casoId))
            val Villano villano = BaseCentralRepositorio.buscarVillano(Integer.valueOf(req.villanoId))

            caso.detectiveEmiteOrdenContra(villano)
            ok("Orden emitida correctamente".toJson)
        }
        catch (UserException exception) {
            badRequest("Se deben pasar por parametros un villano y un caso")
        }
        catch(NumberFormatException ex) {
            badRequest("Los IDs deben ser numeros enteros")
        }
    }
}
