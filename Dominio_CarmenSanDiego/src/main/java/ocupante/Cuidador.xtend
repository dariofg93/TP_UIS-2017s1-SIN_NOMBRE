package ocupante

import org.eclipse.xtend.lib.annotations.Accessors
import orden.Orden

@Accessors
class Cuidador extends Ocupante{

    var String pista

    new(){
        pista = "Lo siento creo que se ha equivocado de Ciudad, no hay nadie con esas caracteristicas"
    }

    override estuvoVillano() {
        false
    }

    override actuar(Orden orden) {
        return pista
    }
}