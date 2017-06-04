package model.lugar

import java.util.ArrayList
import java.util.List
import model.ocupante.SeniasYHobbies

class Embajada extends Lugar{

    new(String unNombre){
        super(unNombre)
    }

    //Al pedir pista, borrarla de la lista, para no dar 2 veces la misma pista
    override pedirPistas(SeniasYHobbies responsable, List<String> paisActual) {
        var pistas = new ArrayList<String>()

        var String pPais1 = paisActual.get(rnd.nextInt(paisActual.size()))
        pistas.add("Pista de pais: " + pPais1)
        paisActual.remove(pPais1)

        var String pPais2 = paisActual.get(rnd.nextInt(paisActual.size()))
        pistas.add("Pista de pais: " + pPais2)
        paisActual.remove(pPais2)

        pistas
    }
}