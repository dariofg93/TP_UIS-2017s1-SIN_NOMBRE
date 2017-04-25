package applicationModels

import ocupante.Villano
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class FinDelJuegoAppModel {

    var Villano ocupanteDelLugar
    var Villano villanoDeLaOrdenEmitida

    new(Villano unOcupante, Villano villanoDeOrden){
        ocupanteDelLugar = unOcupante
        villanoDeLaOrdenEmitida = villanoDeOrden
    }

    def esElVIllano(){
        ocupanteDelLugar.equals(villanoDeLaOrdenEmitida)
    }
}