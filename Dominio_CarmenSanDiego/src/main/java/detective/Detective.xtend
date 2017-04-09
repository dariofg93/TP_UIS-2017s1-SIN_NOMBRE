package detective

import pais.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import lugar.Lugar
import baseCentralAcme.BaseCentralAcme
import orden.OrdenNula
import orden.Orden

@Accessors
class Detective{

    var Orden ordenEmitida
    var Pais lugarActual
    var BaseCentralAcme baseDeDatos

    new(BaseCentralAcme unaBase, Pais lugarDeLosHechos){
        baseDeDatos = unaBase
        lugarActual = lugarDeLosHechos
        ordenEmitida = new OrdenNula()
    }

    def viajar(Pais unPais){
        lugarActual = unPais
    }

    def String visitar(Lugar unLugar){
        unLugar.mostrarPistas(ordenEmitida)
    }

    def emitirOrden(String... pistas){
        ordenEmitida = baseDeDatos.validarOrden(pistas)
    }
}