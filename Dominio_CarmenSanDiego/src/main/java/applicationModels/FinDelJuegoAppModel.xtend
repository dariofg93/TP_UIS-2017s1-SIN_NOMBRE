package applicationModels

import ocupante.Villano

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