package ocupante

import excepciones.NoEstaElVillanoException

class Cuidador extends Ocupante{

    override actuar() {
        throw new NoEstaElVillanoException()
    }
}