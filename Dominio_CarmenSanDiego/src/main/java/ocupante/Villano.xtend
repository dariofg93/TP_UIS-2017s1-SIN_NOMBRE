package ocupante

import excepciones.VillanoEscapaException
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class Villano extends Ocupante{

    var String nombre
    var String sexo
    var List<String> seniasParticulares
    var List<String> hobbies

    new(String unNombre, String genero, List<String> unasSenias, List<String> unosHobbies){
        nombre = unNombre
        sexo = genero
        seniasParticulares = unasSenias
        hobbies = unosHobbies
    }

    override actuar() {
        throw new VillanoEscapaException()
    }

    def mismasCaracteristicas(String... pistas){
        var cumpleCaracteristicas = true
        for(p: pistas) {
            cumpleCaracteristicas = cumpleCaracteristicas && tieneCaracteristica(p)
        }

        cumpleCaracteristicas
    }

    private def tieneCaracteristica(String pista){
        sexo == pista || seniasParticulares.contains(pista) || hobbies.contains(pista)
    }
}