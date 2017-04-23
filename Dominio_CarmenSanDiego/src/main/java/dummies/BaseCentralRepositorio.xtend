package dummies

import baseCentralAcme.BaseCentralAcme
import caso.Caso
import detective.Detective
import java.util.HashMap
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

    def static HashMap<Detective,Caso> crearCaso(String reporte, String obj){
        acme.crearCaso(reporte,obj)
    }

    def static List<String> sexosPosibles(){
        // return
    }
}