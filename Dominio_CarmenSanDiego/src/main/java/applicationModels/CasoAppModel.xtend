package applicationModels

import detective.Detective
import java.util.Random
import static dummies.CasosRespositorio.*;
import org.uqbar.commons.utils.Observable

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