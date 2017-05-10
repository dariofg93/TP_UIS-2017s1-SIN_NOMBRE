package caso

import java.util.List
import ocupante.Villano
import org.eclipse.xtend.lib.annotations.Accessors
import pais.Pais
import lugar.Lugar
import java.util.Set
import java.util.HashSet
import detective.Detective

@Accessors
class Caso {

    var String objeto
    var Villano responsable
    var String reporte
    var List<Pais> planDeEscape
    var Pais paisDelRobo
    var Detective detective

    new(Villano unResponsable, String unReporte, String unObjeto, List<Pais> unPlan, Pais unPais, Detective unDetective){
        responsable = unResponsable
        reporte = unReporte
        objeto = unObjeto
        planDeEscape = unPlan
        paisDelRobo = unPais
        detective = unDetective
    }

    new(){}

    def Lugar BuscarLugar(String nombreLugar){
        this.todosLosLugares.findFirst[ it.nombre == nombreLugar ]
    }

    def Set<Lugar> todosLosLugares(){
        var todosLosLugaresEncontrados = new HashSet<Lugar>()
        todosLosLugaresEncontrados.addAll(paisDelRobo.todosLosLugares)

        for(Pais p: planDeEscape)
            todosLosLugaresEncontrados.addAll(p.todosLosLugares)

        todosLosLugaresEncontrados
    }

    def detectiveEmiteOrdenContra(Villano unVillano){
        detective.setOrden(unVillano)
    }
}