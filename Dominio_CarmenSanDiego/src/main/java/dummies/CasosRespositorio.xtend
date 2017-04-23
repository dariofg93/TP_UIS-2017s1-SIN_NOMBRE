package dummies

import caso.Caso
import detective.Detective
import java.util.ArrayList

class CasosRespositorio {

    val static SaltoDeLinea = System.getProperty("line.separator")
    val static String INTRO_A_DESCRIPCION = "Detective, tenemos un caso para usted!" + SaltoDeLinea + SaltoDeLinea
    val static String FINAL_DE_DESCRIPCION = "El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna," + SaltoDeLinea + " su mision como detective es desifrar el responsable de tal crimen y apresarlo."

    var static detectives = new ArrayList<Detective>();
    var static casos = new ArrayList<Caso>();

    val static generador = "Aqui se generan los casos y los detectives" => [
        var caso = BaseCentralRepositorio.crearCaso(
                INTRO_A_DESCRIPCION + "A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida" + SaltoDeLinea + " al darse cuenta del faltante de gran valor! El sarcófago del faraón" + SaltoDeLinea + " USERMAATRA-MERIAMON RAMSES-HEQAIUNU, el mejor conocido como Ramsés III. " + SaltoDeLinea + FINAL_DE_DESCRIPCION + SaltoDeLinea,
                "Robo del Faraón")
        .entrySet.iterator.next
        detectives.add(caso.getKey)
        casos.add(caso.getValue)
    ]

    def static cantidadDeCasos(){ return casos.size }

    def static getDetectives(){ detectives }
    def static getCasos(){ casos }
}