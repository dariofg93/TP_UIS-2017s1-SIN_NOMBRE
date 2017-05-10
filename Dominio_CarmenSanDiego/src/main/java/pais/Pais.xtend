package pais

import java.util.ArrayList
import java.util.Arrays
import java.util.List
import lugar.Lugar
import ocupante.Cuidador
import ocupante.Informante
import ocupante.Ocupante
import ocupante.Villano
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import java.util.Random
import java.util.Set
import java.util.HashSet
import org.apache.commons.lang.StringUtils

@Accessors
@Observable
class Pais {

    var int id;
    var String nombre
    var List<String> caracteristicas
    var List<Pais> conexiones
    var List<Lugar> lugaresDeInteres

    new(){
    	caracteristicas = new ArrayList<String>()
    	conexiones = new ArrayList<Pais>()
    	lugaresDeInteres = new ArrayList<Lugar>()
    }



    new(String unNombre){
        nombre = unNombre
        caracteristicas = new ArrayList<String>()
        conexiones = new ArrayList<Pais>()
        lugaresDeInteres = new ArrayList<Lugar>()
    }

    new(String unNombre, List<String> unasCaracteristicas, List<Pais> unasConexiones, List<Lugar> unosLugares){
        nombre = unNombre
        caracteristicas = unasCaracteristicas
        conexiones = unasConexiones
        lugaresDeInteres = unosLugares
    }

    new(int unid, String unNombre, List<String> unasCaracteristicas, List<Pais> unasConexiones, List<Lugar> unosLugares){

        id = unid;
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
                pais.setearOcupantes(new Cuidador())
            }
        }
    }

    def setearOcupantes(Ocupante ocupanteType){
        for(Lugar lugar: lugaresDeInteres) {
            if(lugar.getOcupante == null || lugar.getOcupante.getClass.simpleName.equals("Cuidador")){
                lugar.setOcupante(ocupanteType)
            }
        }
    }

    def asignarUltimasPistas(){
        for(lugar: lugaresDeInteres) {
            lugar.setPistas(Arrays.asList("CUIDADO DETECTIVE!! ha estado a punto de caer en una trampa.."))
        }
    }

    def asignarVillano(Ocupante responsable){
        this.lugaresDeInteres.get(new Random().nextInt(lugaresDeInteres.size)).setOcupante(responsable)
    }

    def clonar(){
        var unasCaracteristicas = new ArrayList<String>() => [ addAll(caracteristicas) ]
        var unasConexiones = new ArrayList<Pais> => [ addAll(conexiones) ]
        var unosLugares = new ArrayList<Lugar>() => [ addAll(lugaresDeInteres) ]

        return new Pais(nombre,unasCaracteristicas,unasConexiones,unosLugares)
    }

    def containsAny(List<Pais> mapamundi){
        var found = false
        for(Pais pais: conexiones) {
            found = found || mapamundi.contains(pais)
        }

        found
    }

    def findConexion(List<Pais> mapamundi){
        var Pais found
        for(Pais pais: conexiones) {
            if(mapamundi.contains(pais)) { found = pais }
        }
        found
    }

    def Set<Lugar> todosLosLugares(){
        var todosLosLugaresEncontrados = new HashSet<Lugar>()
        todosLosLugaresEncontrados.addAll(lugaresDeInteres)

        for(Pais p: conexiones){
            todosLosLugaresEncontrados.addAll(p.lugaresDeInteres)
        }

        todosLosLugaresEncontrados
    }

    //BODY servicios
    def estaCompleto() {
        StringUtils.isNotBlank(nombre)
    }


	//Caracteristicas
    def eliminarCaracteristica(String caracteristica){
        caracteristicas.remove(caracteristica)
    }
    def agregarCaracteristica(String caracteristica){
        caracteristicas.add(caracteristica)
    }
    
    //Conexiones
    def eliminarConexion(Pais conexion){
        conexiones.remove(conexion)
    }
    def agregarConexion(Pais conexion){
        conexiones.add(conexion)
    }
    
    //Lugares
    def eliminarLugar(Lugar lugar){
        lugaresDeInteres.remove(lugar)
    }
    def agregarLugar(Lugar lugar){
        lugaresDeInteres.add(lugar)
    }
}