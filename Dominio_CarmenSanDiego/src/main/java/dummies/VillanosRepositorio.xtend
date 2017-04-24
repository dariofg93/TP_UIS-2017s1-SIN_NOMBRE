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
        seniasParticulares = new ArrayList<String>(Arrays.asList("Pelo Rubio","Sobretodo rojo","Usa guantes")),
        hobbies = new ArrayList<String>(Arrays.asList("Andar en moto","Joyas")))
        add(carmenSanDiego)

        var ihorIhorovich = new Villano("Ihor Ihorovich", SexosPosibles.Masculino,
        seniasParticulares = new ArrayList<String>(Arrays.asList("Pelo Rubio","Maneja limosina","Tatuaje en su brazo", "Habla ucraniano")),
        hobbies = new ArrayList<String>(Arrays.asList("Croquet","Cocina")))
        add(ihorIhorovich)

        var alCapone = new Villano("Al Capone",  SexosPosibles.Masculino,
        seniasParticulares = new ArrayList<String>(Arrays.asList("Pelo Castanio","Viste de traje", "Habla italiano")),
        hobbies = new ArrayList<String>(Arrays.asList("La mafia con los muchachos","Robar bancos")))
        add(alCapone)
    ]

    def static List<Villano> getVillanos() {
        return villanos
    }
}