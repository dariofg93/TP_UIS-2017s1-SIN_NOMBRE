package dummies

import java.util.ArrayList
import java.util.Arrays
import ocupante.Villano
import java.util.List

class VillanosRepositorio {

    var static villanos = new ArrayList() => [
        var carmenSanDiego = new Villano("Carmen San Diego", "Femenino",
        Arrays.asList("Pelo Rubio","Sobretodo rojo","Usa guantes"),
        Arrays.asList("Andar en moto","Joyas"))
        add(carmenSanDiego)
    ]

    def static List<Villano> getVillanos() {
        return villanos
    }
}