package lugar

import ocupante.Ocupante
import ocupante.Villano
import pais.Pais

class Club extends Lugar{

    new(String unNombre,Ocupante alguien){
        super(unNombre,alguien)
    }

    new(String unNombre){
        super(unNombre)
    }

    //Al pedir pista, borrarla de la lista, para no dar 2 veces la misma pista
    override pedirPistas(Villano responsable, Pais paisActual) {
        var String senia1 = responsable.seniasParticulares.get(rnd.nextInt(responsable.seniasParticulares.size()))
        pistas.add(senia1); responsable.seniasParticulares.remove(senia1)

        var String senia2 = responsable.seniasParticulares.get(rnd.nextInt(responsable.seniasParticulares.size()))
        pistas.add(senia2); responsable.seniasParticulares.remove(senia2)

        if(rnd.nextInt(100) <= 70){
            var String hobbie = responsable.hobbies.get(rnd.nextInt(responsable.hobbies.size()))
            pistas.add(hobbie)
            responsable.hobbies.remove(hobbie)
        }
    }
}