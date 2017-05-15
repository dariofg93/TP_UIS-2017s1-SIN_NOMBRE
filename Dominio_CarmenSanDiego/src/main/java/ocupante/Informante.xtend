package ocupante

import org.eclipse.xtend.lib.annotations.Accessors
import java.util.List
import orden.Orden

@Accessors
class Informante extends Ocupante{

    var List<String> pistas

    new(List<String> pistas){
        this.pistas = pistas
    }

    override estuvoVillano() {
        true
    }

    override actuar(Orden orden) {
        return String.join(", ", pistas)
    }
}