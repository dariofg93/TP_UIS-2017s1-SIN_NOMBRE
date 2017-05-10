package dummies

import caso.Caso
import java.util.ArrayList
import java.util.stream.Collectors
import pais.Pais
import lugar.Lugar

class CasosRespositorio {

    val static SaltoDeLinea = System.getProperty("line.separator")
    val static String INTRO_A_DESCRIPCION = "Detective, tenemos un caso para usted!" + SaltoDeLinea + SaltoDeLinea
    val static String FINAL_DE_DESCRIPCION = "El criminal fue muy prolijo y la escena del crimen no contaba con pista alguna," + SaltoDeLinea + " su mision como detective es desifrar el responsable de tal crimen y apresarlo."

    var static casos = new ArrayList<Caso>() => [
        add(BaseCentralRepositorio.crearCaso(
                    INTRO_A_DESCRIPCION + "A las 9 de la mañana en la ciudad del Cairo la comunidad científica fue conmovida" + SaltoDeLinea + " al darse cuenta del faltante de gran valor! El sarcófago del faraón" + SaltoDeLinea + " USERMAATRA-MERIAMON RAMSES-HEQAIUNU, el mejor conocido como Ramsés III. " + SaltoDeLinea + FINAL_DE_DESCRIPCION + SaltoDeLinea,
                    "Robo del Faraón")
        )
    ]

    def static cantidadDeCasos(){ return casos.size }

    def static getCasos(){ casos }

    def static void main(String[] args){
        println(paisYocupantes(getCasos.get(0).getPaisDelRobo))
        println(getCasos.get(0).getPaisDelRobo.getConexiones.stream.map(p | conexionesOcupantes(p)).collect(Collectors.toList))

        println(" ")

        println(getCasos.get(0).getPlanDeEscape.size)

        println(" ")

        println(getCasos.get(0).getPlanDeEscape.stream.map(p | paisYocupantes(p)).collect(Collectors.toList))
    }

    def static String paisYocupantes(Pais pais){
        var r = pais.nombre

        for(Lugar l: pais.getLugaresDeInteres){
            r = r + " |||" + l.getOcupante().getClass.simpleName
        }
        r+">>><<<"
    }

    def static String conexionesOcupantes(Pais pais){
        var r = "CONEXION: "+ pais.nombre

        for(Lugar l: pais.getLugaresDeInteres){
            r = r + " |||" + l.getOcupante().getClass.simpleName
        }
        r+">>><<<"
    }
}