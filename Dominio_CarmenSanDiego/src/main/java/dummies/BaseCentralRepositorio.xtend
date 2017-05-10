package dummies

import baseCentralAcme.BaseCentralAcme
import caso.Caso
import java.util.List
import ocupante.Villano
import pais.Pais

class BaseCentralRepositorio {

    var static acme = new BaseCentralAcme() => [
        setVillanos(VillanosRepositorio.getVillanos)
        setMapamundi(PaisesRepositorio.getMapamundi)
    ]

    def static List<Villano> getVillanos() {
        return acme.villanos
    }

    def static List<Pais> getMapamundi() {
        return acme.mapamundi
    }

    def static Caso crearCaso(int id, String reporte, String obj){
        acme.crearCaso(id, reporte,obj)
    }

    def static List<String> sexosPosibles(){
        // return
    }
}