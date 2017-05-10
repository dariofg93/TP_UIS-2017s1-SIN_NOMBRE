package lugar

import excepciones.NoEstaElVillanoException
import excepciones.VillanoEscapaException
import java.util.ArrayList
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
    protected var List<String> pistas
    @JsonIgnore
    protected var Ocupante ocupante
    protected var Boolean villanoEstuvo
    @JsonIgnore
    protected var Random rnd

    new(String unNombre, Ocupante alguien){
        nombre = unNombre
        ocupante = alguien
        pistas = new ArrayList<String>()
        rnd = new Random()
        villanoEstuvo = true
    }

    new(String unNombre){
        nombre = unNombre
        pistas = new ArrayList<String>()
        rnd = new Random()
        villanoEstuvo = true
        ocupante = null
    }

    def String mostrarPistas(Orden orden){
        try{
            ocupante.actuar
        }catch(NoEstaElVillanoException nv) {
            villanoEstuvo = false
            return "Lo siento creo que se ha equivocado de Ciudad, no hay nadie con esas caracteristicas"
        }catch(VillanoEscapaException ve) {
            switch(orden.fueEmitida()){
                case 1: return "ALTO!!! Detengase: " + orden.nombre
                case 0: return "El villano ha escapado"
            }
        }
        return String.join(", ", pistas)
    }

    def Boolean estaElVillano(){
        ocupante.class.simpleName == "Villano"
    }

    def void pedirPistas(Villano responsable, Pais paisActual)
}