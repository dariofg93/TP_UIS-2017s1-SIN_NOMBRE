package lugar

import ocupante.Ocupante
import ocupante.Villano
import pais.Pais

class Embajada extends Lugar{

    new(String unNombre, Ocupante alguien){
        super(unNombre,alguien)
    }

    new(String unNombre){
        super(unNombre)
    }

    //Al pedir pista, borrarla de la lista, para no dar 2 veces la misma pista
    override pedirPistas(Villano responsable, Pais paisActual) {
        var String pPais1 = paisActual.caracteristicas.get(rnd.nextInt(paisActual.caracteristicas.size()))
        pistas.add(pPais1); paisActual.caracteristicas.remove(pPais1)

        var String pPais2 = paisActual.caracteristicas.get(rnd.nextInt(paisActual.caracteristicas.size()))
        pistas.add(pPais2); paisActual.caracteristicas.remove(pPais2)
    }
}