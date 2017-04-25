package orden

import ocupante.Villano

abstract class Orden {
    def Integer fueEmitida()

    def Boolean esElVillano(String sospechoso)

    def String nombre()

    def Villano getVillano()
}