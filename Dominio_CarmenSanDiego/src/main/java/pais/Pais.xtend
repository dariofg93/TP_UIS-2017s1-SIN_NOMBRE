package pais

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import lugar.Lugar
import ocupante.Villano
import ocupante.Informante
import ocupante.Ocupante
import ocupante.Cuidador
import java.util.Arrays

@Accessors
class Pais {

    var String nombre
    var List<String> caracteristicas
    var List<Pais> conexiones
    var List<Lugar> lugaresDeInteres

    new(){
    }

    new(String unNombre, List<String> unasCaracteristicas, List<Pais> unasConexiones, List<Lugar> unosLugares){
        nombre = unNombre
        caracteristicas = unasCaracteristicas
        conexiones = unasConexiones
        lugaresDeInteres = unosLugares
    }

    def asignarPistasALugares(Villano responsable, Pais paisActual){
        for(lugar: lugaresDeInteres) {
            lugar.pedirPistas(responsable,paisActual)
        }
    }

    def asignarOcupantesALugares(Pais paisAnterior){
        setearOcupantes(new Informante())
        for(pais: conexiones) {
            if(!pais.equals(paisAnterior)) {
                setearOcupantes(new Cuidador())
            }
        }
    }

    def setearOcupantes(Ocupante ocupanteType){
        for(lugar: lugaresDeInteres) {
            lugar.setOcupante(ocupanteType)
        }
    }

    def asignarUltimasPistas(){
        for(lugar: lugaresDeInteres) {
            lugar.setPistas(Arrays.asList("CUIDADO DETECTIVE!! ha estado a punto de caer en una trampa.."))
        }
    }

    def asignarVillano(Villano responsable){
        lugaresDeInteres.get(1).setOcupante(responsable)
    }
}