package dummies

import applicationModels.SexosPosibles
import java.util.ArrayList
import java.util.Arrays
import java.util.List
import model.ocupante.Villano

class VillanosRepositorio {

    var static List<String> seniasParticulares
    var static List<String> hobbies

    var static villanos = new ArrayList() => [

        var carmenSanDiego = new Villano("Carmen SanDiego", 1,SexosPosibles.Femenino,
        seniasParticulares = new ArrayList<String>(Arrays.asList("Tenia pelo Rubio","Usaba un sobretodo rojo","Llevaba unos guantes amarillos puestos","Tenia admiracion por las joyas en el lugar","Se la escuchaba con conocimiento en vinos")),
        hobbies = new ArrayList<String>(Arrays.asList("Le gusta andar en moto","Parecia tener una coleccion de joyas")))
        add(carmenSanDiego)

        var ihorIhorovich = new Villano("Ihor Ihorovich", 2, SexosPosibles.Masculino,
        seniasParticulares = new ArrayList<String>(Arrays.asList("Tenia pelo Rubio","Lo vi manejando una limusina","Tenia un tatuaje en su brazo", "Lo escuche hablar ucraniano","Tenia admiracion por la joyas en el lugar")),
        hobbies = new ArrayList<String>(Arrays.asList("Meciono que le gustaba jugar al croquet","Le gusta cocinar")))
        add(ihorIhorovich)

        var alCapone = new Villano("Al Capone", 3, SexosPosibles.Masculino,
        seniasParticulares = new ArrayList<String>(Arrays.asList("Tenia pelo castanio","Usaba un traje", "Lo escuche hablar italiano","Llevaba unos guantes puestos","Lo vi manejando una limosina")),
        hobbies = new ArrayList<String>(Arrays.asList("Se ocupa en la mafia con los muchachos","Tenia pinta de robar bancos")))
        add(alCapone)
    ]

    def static List<Villano> getVillanos() {
        return villanos
    }
}