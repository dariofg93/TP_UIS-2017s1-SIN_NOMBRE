package applicationModels

import model.ocupante.Villano
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import model.caso.Caso
import model.registroLugar.RegistroLugar
import model.ocupante.Ocupante

@Observable
@Accessors
class ResultadoJuegoAppModel {

    var String pista
    var String resultadoOrden


    new (Caso caso, RegistroLugar registro){
        pista = caso.detectiveVisitaLugar(registro.lugar)

        esOrdenExitosaOFallida(caso.obtenerOcupante(registro.lugar), caso.detective.ordenEmitida.getVillano, caso.objeto){
        }
    }

    def esOrdenExitosaOFallida(Ocupante ocupante, Villano villano, String objeto){
        if(ocupante ==  villano){
            resultadoOrden = "En Hora Buena!!!\n"+ "Ha detenido a" + villano.nombre + "y recuperado" + objeto + "\n Felicitaciones"
        }else{
            resultadoOrden = "Mala Noticia\n"+ "Deberia tener Orden de Arresto Contra" +  villano.nombre +  "\n Lamentablemente el crimen quedara impune"
        }
    }


}


