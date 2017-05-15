package creadores

import caso.Caso
import java.util.ArrayList
import java.util.List
import ocupante.Villano
import pais.Pais
import detective.Detective
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Random
import java.util.Collections

@Accessors
class CreadorJuego {

    var List<Villano> villanos
    var List<Pais> mapamundi

    new(){
        villanos = new ArrayList<Villano>()
        mapamundi = new ArrayList<Pais>()
    }

    new(List<Villano> villanos, List<Pais> mapamundi){
        this.villanos = villanos
        this.mapamundi = mapamundi
    }

    def agregarVillano(Villano nuevoVillano){
        villanos.add(nuevoVillano)
    }

    def agregarPais(Pais nuevoPais){
        mapamundi.add(nuevoPais)
    }

    def Caso crearJuego(int id, String reporte, String obj){

        var paises = new ArrayList<Pais>() => [ addAll(mapamundi) ]
        var lugarDelHecho = getLugarDelHecho(paises)
        var detective = new Detective(lugarDelHecho)
        var rutaEscape = crearRutaEscape(paises,lugarDelHecho)

        var newCase = new Caso(id)
        newCase.setResponsable(randomVillano)
        newCase.setReporte(reporte)
        newCase.setObjeto(obj)
        newCase.setPaisDelRobo(lugarDelHecho)
        newCase.setPlanDeEscape(rutaEscape)
        newCase.setDetective(detective)

        repartirPistasYocupantes(newCase)

        newCase
    }

    def repartirPistasYocupantes(Caso newCase){
        var Pais paisAnterior = null
        var iteracion = 0

        newCase.registrarPais(newCase.paisDelRobo,paisAnterior,newCase.planDeEscape.get(0))
        paisAnterior = newCase.paisDelRobo

        for(pais: newCase.planDeEscape.subList(iteracion,newCase.planDeEscape.size-1)) {
            newCase.registrarPais(pais,paisAnterior,newCase.planDeEscape.get(iteracion))
            paisAnterior = newCase.planDeEscape.get(iteracion)
            iteracion++
        }

        newCase.registrarUltimoPais
    }

    private def List<Pais> crearRutaEscape(List<Pais> mapamundi, Pais lugarDelHecho){
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

    private def Pais getLugarDelHecho(List<Pais> paises){
        var lugarDelHecho = paises.get(new Random().nextInt(paises.size))
        paises.remove(lugarDelHecho)

        lugarDelHecho
    }

    private def Villano randomVillano() {
        var newList = new ArrayList<Villano>() => [ addAll(villanos) ]
        Collections.shuffle(newList)
        return newList.get(0)
    }
}