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
        //var numberCase = new Random().nextInt(cantidadDeCasos-1)
        //if(numberCase.equals(-1)){ numberCase = 0 }

        objetoRobado = getCasos.get(0).objeto
        reporte = getCasos.get(0).reporte
        detective = getDetectives.get(0)
    }
}