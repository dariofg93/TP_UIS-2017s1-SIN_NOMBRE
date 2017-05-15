package lugar

import ocupante.Villano
import pais.Pais
import java.util.ArrayList

class Embajada extends Lugar{

    new(String unNombre){
        super(unNombre)
    }

    //Al pedir pista, borrarla de la lista, para no dar 2 veces la misma pista
    override pedirPistas(Villano responsable, Pais paisActual) {
        var pistas = new ArrayList<String>()

        var String pPais1 = paisActual.caracteristicas.get(rnd.nextInt(paisActual.caracteristicas.size()))
        pistas.add(pPais1)

        var String pPais2 = paisActual.caracteristicas.get(rnd.nextInt(paisActual.caracteristicas.size()))
        pistas.add(pPais2)

        pistas
    }
}