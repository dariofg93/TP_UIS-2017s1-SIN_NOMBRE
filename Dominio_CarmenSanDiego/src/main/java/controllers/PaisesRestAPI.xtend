package controllers

import com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException
import org.uqbar.commons.model.UserException
import org.uqbar.xtrest.api.annotation.Body
import org.uqbar.xtrest.api.annotation.Controller
import org.uqbar.xtrest.api.annotation.Delete
import org.uqbar.xtrest.api.annotation.Get
import org.uqbar.xtrest.api.annotation.Post
import org.uqbar.xtrest.http.ContentType
import org.uqbar.xtrest.json.JSONUtils
import model.pais.Pais
import java.util.List
import dummies.BaseCentralRepositorio
import applicationModels.MapamundiAppModel
import org.uqbar.xtrest.api.annotation.Put
import dtos.PaisSimpleDTO
import java.util.stream.Collectors

@Controller
class PaisesRestAPI{

    val List<Pais> paises = BaseCentralRepositorio.getMapamundi()

    val MapamundiAppModel mapamundi = new MapamundiAppModel(paises)
    extension JSONUtils = new JSONUtils


    //Devuelve todos los paises registrados.
    @Get("/pais")
    def getPaises() {
        response.contentType = ContentType.APPLICATION_JSON
        var List<PaisSimpleDTO> paisesSimples = mapamundi.paises.stream.map(p | new PaisDTO(p)).collect(Collectors.toList)
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
}