package creadores

import ocupante.Villano
import java.util.List
import pais.Pais
import caso.Caso
import java.util.ArrayList

class CreadorJuego {

    def Caso crearJuego(Villano responsable, List<Pais> mapamundi, String reporte, String obj, Pais lugarDelHecho){

        var rutaEscape = crearRutaEscape(mapamundi,lugarDelHecho)

        var newCase = new Caso()
        newCase.setResponsable(responsable)
        newCase.setReporte(reporte)
        newCase.setObjeto(obj)
        newCase.setPaisDelRobo(lugarDelHecho)
        newCase.setPlanDeEscape(rutaEscape)

        repartirOcupantes(lugarDelHecho,responsable,newCase)
        repartirPistas(lugarDelHecho,responsable,rutaEscape,newCase)

        newCase
    }

    private def repartirPistas(Pais lugarDelHecho, Villano responsable, List<Pais> rutaEscape, Caso newCase){
        var recorrido = new ArrayList<Pais>()
        recorrido.addAll(rutaEscape)

        lugarDelHecho.asignarPistasALugares(responsable.clonar,recorrido.get(0).clonar)
        recorrido.remove(0)

        for(pais: newCase.planDeEscape.subList(0,newCase.planDeEscape.size-1)) {
            pais.asignarPistasALugares(responsable.clonar,recorrido.get(0).clonar)
            recorrido.remove(0)
        }

        newCase.planDeEscape.last.asignarUltimasPistas()
    }

    private def repartirOcupantes(Pais lugarDelHecho, Villano responsable, Caso newCase){
        var Pais paisAnterior = null

        lugarDelHecho.asignarOcupantesALugares(paisAnterior)
        paisAnterior = lugarDelHecho

        for(pais: newCase.planDeEscape) {
            pais.asignarOcupantesALugares(paisAnterior)
            paisAnterior = pais
        }

        newCase.planDeEscape.last.asignarVillano(responsable)
    }

    private def List<Pais> crearRutaEscape(List<Pais> mapamundi, Pais lugarDelHecho){
        var rutaDeEscape = new ArrayList<Pais>() => [
            var nuevoDestino = lugarDelHecho.findConexion(mapamundi)
            add(lugarDelHecho)
            mapamundi.remove(nuevoDestino)
        ]
        var cantPaises = 0

        while(!(mapamundi.isEmpty) && cantPaises < 8 && rutaDeEscape.last.containsAny(mapamundi)){
            var nuevoDestino = rutaDeEscape.last.findConexion(mapamundi)
            mapamundi.remove(nuevoDestino)
            cantPaises++
        }

        rutaDeEscape
    }
}