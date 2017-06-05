package model.lugar

import java.util.ArrayList
import java.util.List
import model.ocupante.SeniasYHobbies

class Club extends Lugar{

    new(String unNombre){
        super(unNombre)
    }

    //Al pedir pista, borrarla de la lista, para no dar 2 veces la misma pista
    override pedirPistas(SeniasYHobbies responsable, List<String> paisActual) {
        var pistas = new ArrayList<String>()

        var String senia1 = responsable.senias.get(rnd.nextInt(responsable.senias.size()))
        pistas.add("Pista de villano: " + senia1)
        responsable.senias.remove(senia1)

        var String senia2 = responsable.senias.get(rnd.nextInt(responsable.senias.size()))
        pistas.add("Pista de villano: " + senia2)
        responsable.senias.remove(senia2)

        if(rnd.nextInt(100) <= 70) {
            var String hobbie = responsable.hobbies.get(rnd.nextInt(responsable.hobbies.size()))
            pistas.add("Pista de villano: " + hobbie)
            responsable.hobbies.remove(hobbie)
        }

        pistas
    }
}