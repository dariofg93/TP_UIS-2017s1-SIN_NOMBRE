package caso

import java.util.List
import ocupante.Villano
import org.eclipse.xtend.lib.annotations.Accessors
import pais.Pais

@Accessors
class Caso {

    var Villano responsable
    var String reporte
    var String objeto
    var List<Pais> planDeEscape
    var Pais paisDelRobo

    new(Villano unResponsable, String unReporte, String unObjeto, List<Pais> unPlan, Pais unPais){
        responsable = unResponsable
        reporte = unReporte
        objeto = unObjeto
        planDeEscape = unPlan
        paisDelRobo = unPais
    }

    new(){
    }
}