package dummies

import baseCentralAcme.BaseCentralAcme
import java.util.List
import ocupante.Villano
import pais.Pais
import java.util.HashMap
import detective.Detective
import caso.Caso

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
}