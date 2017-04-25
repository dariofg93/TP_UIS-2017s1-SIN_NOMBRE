package orden

import org.eclipse.xtend.lib.annotations.Accessors
import ocupante.Villano

@Accessors
class OrdenEmitida extends Orden{

    var Villano villano

    new(Villano unVillano){
        villano = unVillano
    }

    override esElVillano(String sospechoso){
        villano.nombre == sospechoso
    }

    override fueEmitida() {
        1
    }

    override nombre() { villano.nombre }

    override getVillano(){ villano }
}