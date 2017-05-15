package lugar

import ocupante.Villano
import pais.Pais
import java.util.ArrayList

class Club extends Lugar{

    new(String unNombre){
        super(unNombre)
    }

    //Al pedir pista, borrarla de la lista, para no dar 2 veces la misma pista
    override pedirPistas(Villano responsable, Pais paisActual) {
        var pistas = new ArrayList<String>()

        var String senia1 = responsable.seniasParticulares.get(rnd.nextInt(responsable.seniasParticulares.size()))
        pistas.add(senia1)

        var String senia2 = responsable.seniasParticulares.get(rnd.nextInt(responsable.seniasParticulares.size()))
        pistas.add(senia2)

        if(rnd.nextInt(100) <= 70) {
            var String hobbie = responsable.hobbies.get(rnd.nextInt(responsable.hobbies.size()))
            pistas.add(hobbie)
        }

        pistas
    }
}