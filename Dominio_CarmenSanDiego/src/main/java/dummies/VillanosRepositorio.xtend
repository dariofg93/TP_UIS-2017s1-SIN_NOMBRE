package dummies

import java.util.ArrayList
import java.util.Arrays
import ocupante.Villano
import java.util.List

class VillanosRepositorio {

    var static villanos = new ArrayList() => [
        var carmenSanDiego = new Villano("Carmen SanDiego", "Femenino",
        Arrays.asList("Pelo Rubio","Sobretodo rojo","Usa guantes"),
        Arrays.asList("Andar en moto","Joyas"))
        add(carmenSanDiego)
        
        var ihorIhorovich = new Villano("Ihor Ihorovich", "Masculino",
        Arrays.asList("Pelo Rubio","Maneja limosina","Tatuaje en su brazo", "Habla ucraniano"),
        Arrays.asList("Croquet","Cocina"))
        add(ihorIhorovich)
        
        var alCapone = new Villano("Al Capone", "Masculino",
        Arrays.asList("Pelo Castanio","Viste de traje", "Habla italiano"),
        Arrays.asList("La mafia con los muchachos","Robar bancos"))
        add(alCapone)
    ]

    def static List<Villano> getVillanos() {
        return villanos
    }
}