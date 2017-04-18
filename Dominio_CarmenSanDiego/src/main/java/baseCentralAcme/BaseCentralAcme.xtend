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
        var paises = new ArrayList<Pais>() => [ addAll(mapamundi) ]
        var lugarDelHecho = getLugarDelHecho(paises)
        var detective = new Detective(this,lugarDelHecho)

        var caso = creador.crearJuego(
                randomVillano,
                paises,
                reporte,
                obj,
                lugarDelHecho
        )
        var casoCreado = new HashMap<Detective,Caso>()
        casoCreado.put(detective,caso)

        return  casoCreado
    }

    private def Pais getLugarDelHecho(ArrayList<Pais> paises){
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