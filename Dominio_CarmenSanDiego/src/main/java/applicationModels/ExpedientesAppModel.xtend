package applicationModels

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ocupante.Villano
import java.util.List
import java.util.ArrayList

@Accessors
@Observable
class ExpedientesAppModel {

    var List<Villano> villanos = new ArrayList<Villano>()
    var Villano villanoSeleccionado



    def nuevoVillano(){
        val Villano nuevo = new Villano()
        agregarVillano(nuevo)
        return nuevo
    }

    def agregarVillano(Villano unVillano){
        villanos.add(unVillano)
    }
}