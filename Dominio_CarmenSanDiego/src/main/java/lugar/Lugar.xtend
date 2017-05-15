package lugar

import java.util.List
import java.util.Random
import ocupante.Ocupante
import ocupante.Villano
import orden.Orden
import org.eclipse.xtend.lib.annotations.Accessors
import pais.Pais
import org.uqbar.commons.utils.Observable
import com.fasterxml.jackson.annotation.JsonIgnore

@Observable
@Accessors
abstract class Lugar{

    protected var String nombre
    @JsonIgnore
    protected var Random rnd

    new(String unNombre){
        nombre = unNombre
        rnd = new Random()
    }

    def String mostrarPistas(Orden orden, Ocupante ocupante){
        return ocupante.actuar(orden)
    }

    def Boolean estaElVillano(){
        true//MAAAAAAAAAAALocupante.class.simpleName == "Villano"
    }

    def List<String> pedirPistas(Villano responsable, Pais paisActual)
}