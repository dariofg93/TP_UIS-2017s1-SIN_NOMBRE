package creadores

import caso.Caso
import java.util.ArrayList
import java.util.List
import ocupante.Villano
import pais.Pais
import detective.Detective

class CreadorJuego {

    def Caso crearJuego(int id, Villano responsable, List<Pais> mapamundi, String reporte, String obj, Pais lugarDelHecho, Detective detective){

        var rutaEscape = crearRutaEscape(mapamundi,lugarDelHecho)

        var newCase = new Caso(id)
        newCase.setResponsable(responsable)
        newCase.setReporte(reporte)
        newCase.setObjeto(obj)
        newCase.setPaisDelRobo(lugarDelHecho)
        newCase.setPlanDeEscape(rutaEscape)
        newCase.setDetective(detective)

        repartirOcupantes(newCase)
        repartirPistas(newCase)

        newCase
    }

    def repartirPistas(Caso newCase){
        var recorrido = new ArrayList<Pais>()
        recorrido.addAll(newCase.planDeEscape)

        newCase.paisDelRobo.asignarPistasALugares(newCase.responsable.clonar,recorrido.get(0).clonar)
        recorrido.remove(0)

        for(pais: newCase.planDeEscape.subList(0,newCase.planDeEscape.size-1)) {
            pais.asignarPistasALugares(newCase.responsable.clonar,recorrido.get(0).clonar)
            recorrido.remove(0)
        }

        newCase.planDeEscape.last.asignarUltimasPistas()
    }

    def repartirOcupantes(Caso newCase){
        var Pais paisAnterior = null

        newCase.paisDelRobo.asignarOcupantesALugares(paisAnterior)
        paisAnterior = newCase.paisDelRobo

        for(pais: newCase.planDeEscape) {
            pais.asignarOcupantesALugares(paisAnterior)
            paisAnterior = pais
        }

        newCase.planDeEscape.last.asignarVillano(newCase.responsable)
    }

    def List<Pais> crearRutaEscape(List<Pais> mapamundi, Pais lugarDelHecho){
        var rutaDeEscape = new ArrayList<Pais>()
            var nuevoDestino = lugarDelHecho.findConexion(mapamundi)
            rutaDeEscape.add(nuevoDestino)
            mapamundi.remove(nuevoDestino)

        var cantPaises = 0

        while(!(mapamundi.isEmpty) && cantPaises < 8 && rutaDeEscape.last.containsAny(mapamundi)) {
            nuevoDestino = rutaDeEscape.last.findConexion(mapamundi)
            rutaDeEscape.add(nuevoDestino)
            mapamundi.remove(nuevoDestino)
            cantPaises++
        }
        rutaDeEscape
    }
}