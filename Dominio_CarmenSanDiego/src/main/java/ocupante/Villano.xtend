package ocupante

import applicationModels.SexosPosibles
import excepciones.VillanoEscapaException
import java.util.ArrayList
import java.util.Arrays
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Villano extends Ocupante{

    var String nombre
    var int id
    var SexosPosibles sexo
    var List<String> seniasParticulares
    var List<String> hobbies

    new(String unNombre, int unId, SexosPosibles genero, List<String> unasSenias, List<String> unosHobbies){
        nombre = unNombre
        id = unId
        sexo = genero
        seniasParticulares = unasSenias
        hobbies = unosHobbies
    }

    new() {
        seniasParticulares = new ArrayList<String>()
        hobbies = new ArrayList<String>()
    }

    override actuar() {
        throw new VillanoEscapaException()
    }

    def sexos() {
        var SexosPosibles[] sexosP = SexosPosibles.values;
        return Arrays.asList(sexosP);
    }

    def clonar(){
        var unasSenias = new ArrayList<String>() => [ addAll(seniasParticulares) ]
        var unosHobbies = new ArrayList<String>() => [ addAll(hobbies) ]

        return new Villano (nombre,id,sexo,unasSenias,unosHobbies)
    }

    def agregarSenia(String senia) {
        seniasParticulares.add(senia)
    }

    def eliminarSenia(String senia) {
        seniasParticulares.remove(senia)
    }

    def eliminarHobbie(String hobbie) {
        hobbies.remove(hobbie)
    }

    def agregarHobbie (String hobbie){
        hobbies.add(hobbie)
    }
}