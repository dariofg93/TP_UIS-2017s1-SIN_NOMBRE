package detective

import baseCentralAcme.BaseCentralAcme
import java.util.stream.Collectors
import lugar.Lugar
import orden.Orden
import orden.OrdenNula
import org.eclipse.xtend.lib.annotations.Accessors
import pais.Pais
import registroVillano.RegistroVillano
import org.uqbar.commons.utils.Observable
import orden.OrdenEmitida
import ocupante.Villano

@Observable
@Accessors
class Detective{

    Orden ordenEmitida
    Pais lugarActual
    BaseCentralAcme baseDeDatos
    RegistroVillano registroVillano

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

    def emitirOrden(Villano villano) {
        ordenEmitida = new OrdenEmitida(villano)
    }

    def recorridoCriminal(){
        registroVillano.lugaresVisitados.stream.map(p | p.nombre).collect(Collectors.toList())
    }

    def destinosFallidos(){
        registroVillano.lugaresNoVisitados.stream.map(p | p.nombre).collect(Collectors.toList())
    }
}