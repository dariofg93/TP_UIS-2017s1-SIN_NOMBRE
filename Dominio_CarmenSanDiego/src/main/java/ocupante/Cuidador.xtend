package ocupante

import excepciones.NoEstaElVillanoException
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Cuidador extends Ocupante{

    override actuar() {
        throw new NoEstaElVillanoException()
    }
}