package lugar

import ocupante.Ocupante
import ocupante.Villano
import pais.Pais

class Biblioteca extends Lugar{

    new(String unNombre,Ocupante alguien){
        super(unNombre,alguien)
    }

    new(String unNombre){
        super(unNombre)
    }

    //Al pedir pista, borrarla de la lista, para no dar 2 veces la misma pista
    override pedirPistas(Villano responsable, Pais paisActual) {
        var String senia = responsable.seniasParticulares.get(rnd.nextInt(responsable.seniasParticulares.size()))
        var String pPais = paisActual.caracteristicas.get(rnd.nextInt(paisActual.caracteristicas.size()))

        pistas.add(senia); pistas.add(pPais)

        responsable.seniasParticulares.remove(senia)
        paisActual.caracteristicas.remove(pPais)

        if(rnd.nextInt(100) <= 50){
            var String hobbie = responsable.hobbies.get(rnd.nextInt(responsable.hobbies.size()))
            pistas.add(hobbie)
            responsable.hobbies.remove(hobbie)
        }
    }
}