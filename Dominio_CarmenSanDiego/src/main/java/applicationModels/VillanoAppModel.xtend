package applicationModels

import java.util.List
import ocupante.Villano
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import java.util.Arrays

@Observable
@Accessors
class VillanoAppModel {

    var Villano villanoAAgregar

    var String nombre
    var SexosPosibles sexo
    var List<String> seniasParticulares
    var List<String> hobbies

    def actualizaVillano(){

        villanoAAgregar.nombre=nombre
        villanoAAgregar.sexo = sexo
        villanoAAgregar.seniasParticulares =seniasParticulares
        villanoAAgregar.hobbies= hobbies
        return villanoAAgregar
    }


    new(Villano unVillano){
        villanoAAgregar =unVillano
        nombre=unVillano.nombre
        sexo=unVillano.sexo
        seniasParticulares=unVillano.seniasParticulares
        hobbies=unVillano.hobbies
    }


    def sexos() {
        var SexosPosibles[] sexosP = SexosPosibles.values;
        return Arrays.asList(sexosP);
    }

}