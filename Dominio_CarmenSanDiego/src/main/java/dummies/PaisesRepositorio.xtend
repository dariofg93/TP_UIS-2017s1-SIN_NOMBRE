package dummies

import java.util.List
import pais.Pais
import java.util.ArrayList
import java.util.Arrays
import lugar.*

class PaisesRepositorio {

    var static mapamundi = new ArrayList() => [
        var bbva = new Banco("BBVA Frances"); var carp = new Club("River Plate"); var biblioteca = new Biblioteca("Biblioteca Nacional")

        var brasil = new Pais("Brasil",
        Arrays.asList("Hablan portugez", "Badera verde y amarilla y azul","pentacampeones del mundo","!","","","","",""),
        Arrays.asList(),
        Arrays.asList(bbva,carp))

        var argentina = new Pais("Argentina",
        Arrays.asList("Hablan español", "Badera celeste y blanca","Toman mate","!","","","","",""),
        Arrays.asList(brasil,brasil,brasil),    //Obvio que las conexiones estan horribles asi!
        Arrays.asList(bbva,carp))
        brasil.setConexiones(Arrays.asList(argentina))
        add(argentina)
        add(argentina)
        add(argentina)
        add(argentina)
        add(argentina)
        add(argentina)
        add(argentina)
        add(argentina)
    ]

    def static List<Pais> getMapamundi() {
        return mapamundi
    }
}