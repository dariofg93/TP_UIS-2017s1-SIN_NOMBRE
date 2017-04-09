package orden

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class OrdenEmitida extends Orden{

    var String nombre

    new(String nombreDelVillano){
        nombre = nombreDelVillano
    }

    override esElVillano(String sospechoso){
        nombre == sospechoso
    }

    override fueEmitida() {
        1
    }

    override nombre() { nombre }
}