package applicationModels

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import model.caso.Caso
import model.registroLugar.RegistroLugar
import model.ocupante.Ocupante
import model.orden.Orden

@Observable
@Accessors
class ResultadoJuegoAppModel {

    var String pista
    var String resultadoOrden


    new (Caso caso, RegistroLugar registro){
        pista = caso.detectiveVisitaLugar(registro.lugar)

        esOrdenExitosaOFallida(caso.obtenerOcupante(registro.lugar),
                                caso.objeto, caso.detective.ordenEmitida){
        }
    }

    def esOrdenExitosaOFallida(Ocupante ocupante, String objeto, Orden unaOrden){
        if(unaOrden.fueEmitida == 1 && ocupante.esUnVillano){
            if(ocupante == unaOrden.getVillano) {
                resultadoOrden = "En Hora Buena!!! "+ "Ha detenido a " + unaOrden.getVillano.nombre + " y recuperado " + objeto + ". Felicitaciones!!!"
            }else{
                resultadoOrden = "Mala Noticia. " + "Deberia tener Orden de Arresto Contra " +  unaOrden.getVillano.nombre +  ". Lamentablemente el crimen quedara impune."
            }
        }
    }


}


