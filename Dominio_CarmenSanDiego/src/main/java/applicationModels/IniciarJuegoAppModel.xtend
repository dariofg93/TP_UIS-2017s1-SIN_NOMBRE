package applicationModels

import caso.Caso
import dummies.CasosRespositorio

class IniciarJuegoAppModel {

    CreadorDeJuegoAppModel unCaso

    new (CreadorDeJuegoAppModel unJuego){
        unCaso = unJuego
    }
}