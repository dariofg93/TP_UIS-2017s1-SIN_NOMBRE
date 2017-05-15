package dummies

import baseCentralAcme.BaseCentralAcme
import caso.Caso
import java.util.List
import ocupante.Villano
import pais.Pais
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class BaseCentralRepositorio {

    var static acme = new BaseCentralAcme(VillanosRepositorio.getVillanos,PaisesRepositorio.getMapamundi)

    def static List<Villano> getVillanos() {
        return acme.getVillanos
    }

    def static List<Pais> getMapamundi() {
        return acme.getMapamundi
    }

    def static Caso crearCaso(int id, String reporte, String obj){
        acme.crearCaso(id, reporte,obj)
    }

    def static buscarVillano(int idVillano){
        acme.getVillanos.findFirst[ it.id == id]
    }

    def static List<String> sexosPosibles(){
        // return
    }
}