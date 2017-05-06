package dummies

import applicationModels.SexosPosibles
import java.util.ArrayList
import java.util.Arrays
import java.util.List
import ocupante.Villano

class VillanosRepositorio {

    static List<String> seniasParticulares
    static List<String> hobbies

    var static villanos = new ArrayList() => [

        var carmenSanDiego = new Villano("Carmen SanDiego",SexosPosibles.Femenino,
        seniasParticulares = new ArrayList<String>(Arrays.asList("tenia pelo Rubio","usaba un sobretodo rojo","llevaba unos guantes amarillos puestos","tenia admiracion por las joyas en el lugar","se la escuchaba con conocimiento en vinos")),
        hobbies = new ArrayList<String>(Arrays.asList("le gusta andar en moto","parecia tener una coleccion de joyas")))
        add(carmenSanDiego)

        var ihorIhorovich = new Villano("Ihor Ihorovich", SexosPosibles.Masculino,
        seniasParticulares = new ArrayList<String>(Arrays.asList("tenia pelo Rubio","lo vi manejando una limosina","tenia un tatuaje en su brazo", "lo escuche hablar ucraniano","tenia admiracion por la joyas en el lugar")),
        hobbies = new ArrayList<String>(Arrays.asList("meciono que le gustaba jugar al croquet","le gusta cocinar")))
        add(ihorIhorovich)

        var alCapone = new Villano("Al Capone",  SexosPosibles.Masculino,
        seniasParticulares = new ArrayList<String>(Arrays.asList("tenia pelo Castanio","usaba un traje", "lo escuche hablar italiano","llevaba unos guantes puestos","lo vi manejando una limosina")),
        hobbies = new ArrayList<String>(Arrays.asList("se ocupa en la mafia con los muchachos","tenia pinta de robar bancos")))
        add(alCapone)
    ]

    def static List<Villano> getVillanos() {
        return villanos
    }
}