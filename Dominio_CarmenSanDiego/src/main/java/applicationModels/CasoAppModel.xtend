package applicationModels

import detective.Detective
import java.util.Random
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

import static dummies.CasosRespositorio.*

@Accessors
@Observable
class CasoApplicationModel {

    var String objetoRobado
    var String reporte
    var Detective detective

    new(){ setearVariables }

    def setearVariables(){
        var numberCase = new Random().nextInt(cantidadDeCasos)

        objetoRobado = getCasos.get(numberCase).objeto
        reporte = getCasos.get(numberCase).reporte
        detective = getDetectives.get(numberCase)
    }
}