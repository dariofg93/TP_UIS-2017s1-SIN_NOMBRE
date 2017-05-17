package model.orden

import model.ocupante.Villano

abstract class Orden {
    def Integer fueEmitida()

    def String nombre()

    def Villano getVillano()
}