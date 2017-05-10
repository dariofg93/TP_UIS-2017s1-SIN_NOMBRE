package dummies

import applicationModels.CreadorDeJuegoAppModel

class CrearJuegoRepositorio {

    var static unJuego = new CreadorDeJuegoAppModel(1, PaisesRepositorio.getMapamundi)

    def static CreadorDeJuegoAppModel getJuego() {
        return unJuego
    }
}