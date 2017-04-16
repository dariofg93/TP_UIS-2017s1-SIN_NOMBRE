package baseCentralAcme

import ocupante.Villano
import java.util.List
import java.util.ArrayList
import pais.Pais
import creadores.CreadorJuego
import java.util.Collections
import java.util.HashMap
import caso.Caso
import detective.Detective
import orden.OrdenEmitida
import org.eclipse.xtend.lib.annotations.Accessors
import orden.OrdenNula
import orden.Orden
import java.util.Random

@Accessors
class BaseCentralAcme {

    var List<Villano> villanos
    var List<Pais> mapamundi
    var CreadorJuego creador

    new() {
        villanos = new ArrayList<Villano>()
        mapamundi = new ArrayList<Pais>()
        creador = new CreadorJuego()
    }

    def registrarVillano(Villano nuevoVillano){
        villanos.add(nuevoVillano)
    }

    def registrarPais(Pais nuevoPais){
        mapamundi.add(nuevoPais)
    }

    def Orden validarOrden(String... pistas){
        var Orden ordenEmitida =  new OrdenNula()

        for(v: villanos) {
            if(v.mismasCaracteristicas(pistas))
                ordenEmitida = new OrdenEmitida(v.nombre)
        }
        return ordenEmitida
    }

    def HashMap<Detective,Caso> crearCaso(String reporte, String obj){
        var rutaDeEscape = randomSubList(mapamundi,8)
        var lugarDelHecho = getLugarDelHecho(rutaDeEscape.get(0),rutaDeEscape.get(1))
        var detective = new Detective(this,lugarDelHecho)

        var caso = creador.crearJuego(
                randomSubList(villanos,1).get(0),
                rutaDeEscape,
                reporte,
                obj,
                lugarDelHecho
        )
        var casoCreado = new HashMap<Detective,Caso>()
        casoCreado.put(detective,caso)

        return  casoCreado
    }

    private def Pais getLugarDelHecho(Pais primerDestino, Pais segundoDestino){
        var lugarDelHecho = primerDestino

        do { lugarDelHecho = primerDestino.conexiones.get(new Random().nextInt(2)) }
        while(lugarDelHecho.equals(segundoDestino))

        lugarDelHecho
    }

    private def <T> List<T> randomSubList(List<T> list, int newSize) {
        var newList = new ArrayList<T>(list)
        Collections.shuffle(newList)
        return newList.subList(0, newSize)
    }
}