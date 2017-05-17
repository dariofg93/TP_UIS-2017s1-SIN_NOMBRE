package model.lugar

import java.util.ArrayList
import model.ocupante.SeniasYHobbies
import java.util.List

class Banco extends Lugar{

    new(String unNombre){
        super(unNombre)
    }

    //Al pedir pista, borrarla de la lista, para no dar 2 veces la misma pista
    override pedirPistas(SeniasYHobbies responsable, List<String> paisActual) {
        var pistas = new ArrayList<String>()

        var String senia = responsable.senias.get(rnd.nextInt(responsable.senias.size()))
        var String pPais = paisActual.get(rnd.nextInt(paisActual.size()))

        pistas.add(senia)
        pistas.add(pPais)

        responsable.senias.remove(senia)
        paisActual.remove(pPais)

        pistas
    }
}