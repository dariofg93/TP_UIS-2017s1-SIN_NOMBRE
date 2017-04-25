package applicationModels

import java.util.ArrayList
import java.util.Arrays
import java.util.List
import ocupante.Villano
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import dummies.VillanosRepositorio

@Accessors
@Observable
class ExpedientesAppModel {

    var List<Villano> villanos = VillanosRepositorio.getVillanos()
    var Villano villanoSeleccionado
    var List<String> sexosPosibles = Arrays.asList("sexosPosibles")


    def nuevoVillano(){
        val Villano nuevo = new Villano()
        agregarVillano(nuevo)
        return nuevo
    }

    def agregarVillano(Villano unVillano){
        villanos.add(unVillano)
    }



}