package dummies

import java.util.ArrayList
import java.util.Arrays
import java.util.List
import lugar.Banco
import lugar.Biblioteca
import lugar.Club
import pais.Pais

class PaisesRepositorio {

    var static mapamundi = new ArrayList() => [
        var bbva = new Banco("BBVA Frances"); var carp = new Club("River Plate"); var biblioteca = new Biblioteca("Biblioteca Nacional")

        var brasil = new Pais("Brasil",
        Arrays.asList("Hablan portugez", "Badera verde y amarilla y azul","pentacampeones del mundo"),
        Arrays.asList(),
        Arrays.asList(bbva,carp))

        var argentina = new Pais("Argentina",
        Arrays.asList("Hablan español", "Badera celeste y blanca","Toman mate"),
        Arrays.asList(),
        Arrays.asList(carp,bbva))

        brasil.setConexiones(Arrays.asList(argentina))
        argentina.setConexiones(Arrays.asList(brasil))

        add(argentina)
        add(brasil)
    ]

    def static List<Pais> getMapamundi() {
        return mapamundi
    }
}