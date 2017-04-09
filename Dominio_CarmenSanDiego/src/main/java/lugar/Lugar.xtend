package lugar

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import ocupante.Ocupante
import java.util.ArrayList
import pais.Pais
import ocupante.Villano
import java.util.Random
import excepciones.NoEstaElVillanoException
import excepciones.VillanoEscapaException
import orden.Orden

@Accessors
abstract class Lugar{

    protected var String nombre
    protected var List<String> pistas
    protected var Ocupante ocupante
    protected var Random rnd

    new(String unNombre, Ocupante alguien){
        nombre = unNombre
        ocupante = alguien
        pistas = new ArrayList<String>()
        rnd = new Random()
    }

    new(String unNombre){
        nombre = unNombre
        pistas = new ArrayList<String>()
        rnd = new Random()
    }

    def String mostrarPistas(Orden orden){
        try{
            ocupante.actuar
        }catch(NoEstaElVillanoException nv) {
            return "Lo siento creo que se ha equivocado de Ciudad, no hay nadie con esas caracteristicas"
        }catch(VillanoEscapaException ve) {
            var sospechoso = (ocupante as Villano).nombre
            switch(orden.fueEmitida()){
                case 1:  if(orden.esElVillano(sospechoso)) {
                    return "ALTO!!! Detengase: " + sospechoso
                }else{
                    return "Ha detenido a " + sospechoso + ", pero usted tenia una orden contra " + orden.nombre + "." +
                            System.getProperty("line.separator") +
                            "Lamentablemente este crimen quedara impune."
                }
                case 0: return "El villano ha escapado"
            }
        }
        return String.join(", ", pistas)
    }

    def void pedirPistas(Villano responsable, Pais paisActual)
}