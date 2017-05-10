package baseCentralAcme

import caso.Caso
import creadores.CreadorJuego
import detective.Detective
import java.util.ArrayList
import java.util.Collections
import java.util.HashMap
import java.util.List
import java.util.Random
import ocupante.Villano
import orden.Orden
import orden.OrdenEmitida
import orden.OrdenNula
import org.eclipse.xtend.lib.annotations.Accessors
import pais.Pais

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
                ordenEmitida = new OrdenEmitida(v)
        }
        return ordenEmitida
    }

    def Caso crearCaso(String reporte, String obj){
        var paises = new ArrayList<Pais>() => [ addAll(mapamundi) ]
        var lugarDelHecho = getLugarDelHecho(paises)
        var detective = new Detective(this,lugarDelHecho)

        return creador.crearJuego(
            randomVillano,
            paises,
            reporte,
            obj,
            lugarDelHecho,
            detective
        )
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