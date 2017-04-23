package orden

class OrdenNula extends Orden{

    override fueEmitida() {
        0
    }

    override esElVillano(String sospechoso) {
        false
    }

    override nombre() {
        "Nadie"
    }
}