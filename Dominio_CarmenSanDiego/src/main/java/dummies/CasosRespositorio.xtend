package dummies

import detective.Detective
import java.util.ArrayList
import caso.Caso

class CasosRespositorio {

    val static String INTRO_A_DESCRIPCION = "Detective, tenemos un caso para usted" + System.getProperty("line.separator")
    val static String FINAL_DE_DESCRIPCION = "El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna, su mision como detective es desifrar el responsable de tal crimen y apresarlo."

    var static detectives = new ArrayList<Detective>();
    var static casos = new ArrayList<Caso>();

    val static generador = "Aqui se generan los casos y los detectives" => [
        var caso = BaseCentralRepositorio.crearCaso(
                INTRO_A_DESCRIPCION + "A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida al darse cuenta del faltante de gran valor! El sarcófago del faraón USERMAATRA-MERIAMON RAMSES-HEQAIUNU, el mejor conocido como Ramsés III. " + FINAL_DE_DESCRIPCION,
                "Robo del Faraón")
        .entrySet.iterator.next
        detectives.add(caso.getKey)
        casos.add(caso.getValue)
    ]

    def static cantidadDeCasos(){ return casos.size }

    def static getDetectives(){ detectives }
    def static getCasos(){ casos }

    def static void main(String[] args) {

    }
}