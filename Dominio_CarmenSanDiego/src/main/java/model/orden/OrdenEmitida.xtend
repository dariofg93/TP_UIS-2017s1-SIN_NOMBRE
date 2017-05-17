package model.orden

import org.eclipse.xtend.lib.annotations.Accessors
import model.ocupante.Villano

@Accessors
class OrdenEmitida extends Orden{

    var Villano villano

    new(Villano unVillano){
        villano = unVillano
    }

    override fueEmitida() {
        1
    }

    override nombre() { villano.nombre }

    override getVillano(){ villano }
}