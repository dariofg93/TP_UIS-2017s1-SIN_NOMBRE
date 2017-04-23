package detective

import pais.Pais
import org.eclipse.xtend.lib.annotations.Accessors
import lugar.Lugar
import baseCentralAcme.BaseCentralAcme
import orden.OrdenNula
import orden.Orden
import registroVillano.RegistroVillano
import java.util.stream.Collectors
import java.util.List

@Accessors
class Detective{

    var Orden ordenEmitida
    var Pais lugarActual
    var BaseCentralAcme baseDeDatos
    var RegistroVillano registroVillano

    new(BaseCentralAcme unaBase, Pais lugarDeLosHechos){
        baseDeDatos = unaBase
        lugarActual = lugarDeLosHechos
        ordenEmitida = new OrdenNula()
        registroVillano = new RegistroVillano()
    }

    def viajar(Pais unPais){
        lugarActual = unPais
    }

    def String visitar(Lugar unLugar){
        var msj = unLugar.mostrarPistas(ordenEmitida)
        if(unLugar.villanoEstuvo)
            registroVillano.agregarVisitado(lugarActual)
        else
            registroVillano.agregarNoVisitado(lugarActual)

        msj
    }

    def emitirOrden(String... pistas){
        ordenEmitida = baseDeDatos.validarOrden(pistas)
    }

    def getNombreDeOrdenEmitida(){
        ordenEmitida.nombre()
    }

    def recorridoCriminal(){
        registroVillano.lugaresVisitados.stream.map(p | p.nombre).collect(Collectors.toList())
    }

    def destinosFallidos(){
        registroVillano.lugaresNoVisitados.stream.map(p | p.nombre).collect(Collectors.toList())
    }
}