package model.orden

import model.excepciones.NoEstaElVillanoException

class OrdenNula extends Orden{

    override fueEmitida() {
        0
    }

    override nombre() {
        "Nadie"
    }

    override getVillano() {
        throw new NoEstaElVillanoException()
    }
}