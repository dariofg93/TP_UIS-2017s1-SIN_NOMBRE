package model.pais

import java.util.ArrayList
import java.util.List
import model.lugar.Lugar
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import org.apache.commons.lang.StringUtils
import java.util.stream.Collectors
import java.util.Comparator

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

    new(int unid,String unNombre){
        id = unid
        nombre = unNombre
        caracteristicas = new ArrayList<String>()
        conexiones = new ArrayList<Pais>()
        lugaresDeInteres = new ArrayList<Lugar>()
    }

    new(int unid, String unNombre, List<String> unasCaracteristicas, List<Pais> unasConexiones, List<Lugar> unosLugares){
        id = unid
        nombre = unNombre
        caracteristicas = unasCaracteristicas
        conexiones = unasConexiones
        lugaresDeInteres = unosLugares
    }

    def containsAny(List<Pais> mapamundi){
        var found = false
        for(Pais pais: conexiones) {
            found = found || mapamundi.contains(pais)
        }

        found
    }

    def cantDeConexiones(){
        conexiones.size
    }

    def findConexion(List<Pais> mapamundi){
        var Pais found

        conexiones.stream.filter(p | mapamundi.contains(p))
        .max(Comparator.comparingDouble(Pais::cantDeConexiones));
                         //.sorted(Pais p1 p2 | p1.cantDeConexiones > p2.cantDeConexiones)
                         //.reversed())
                         //.collect(Collectors.toList)

        for(Pais pais: conexiones) {
            if(mapamundi.contains(pais))
                { found = pais }
        }
        found
    }

    def pistas(){
        var List<String> cloneCaracterist = new ArrayList<String>

        for(c: caracteristicas)
            cloneCaracterist.add(String.copyValueOf(c.toCharArray))

        cloneCaracterist
    }

    def Pais buscarConexion(int idPais) {
        conexiones.findFirst[ it.id == idPais]
    }

    def Lugar buscarLugar(String nombreLugar){
        lugaresDeInteres.findFirst [ it.nombre == nombreLugar]
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

    //BODY servicios
    def estaCompleto() {
        StringUtils.isNotBlank(nombre)
    }
}