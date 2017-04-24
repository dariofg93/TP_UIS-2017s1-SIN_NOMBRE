package dummies

import java.util.ArrayList
import java.util.Arrays
import java.util.List
import lugar.Banco
import lugar.Biblioteca
import lugar.Club
import pais.Pais
import lugar.Lugar

class PaisesRepositorio {
	
	static List<String> caracteristicas
	static List<Pais> conexiones
	static List<Lugar> lugares

    var static mapamundi = new ArrayList() => [
        var bbva = new Banco("BBVA Frances"); var carp = new Club("River Plate"); var biblioteca = new Biblioteca("Biblioteca Nacional")

        var brasil = new Pais("Brasil",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan portuges", "Bandera verde y amarilla y azul","pentacampeones del mundo")),
        conexiones = new ArrayList<Pais>(Arrays.asList()),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva, biblioteca)))

        var argentina = new Pais("Argentina",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera celeste y blanca","Toman mate")),
        conexiones = new ArrayList<Pais>(Arrays.asList(brasil)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva,carp)))
        
        var italia = new Pais("Italia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan italiano", "Bandera blanca, roja y verde","Toman vino")),
        conexiones = new ArrayList<Pais>(Arrays.asList(argentina, brasil)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva, biblioteca)))

        add(argentina)
        add(brasil)
        add(italia)
    ]

    def static List<Pais> getMapamundi() {
        return mapamundi
    }
    
    def static List<Lugar> getLugares() {
    	var bbva = new Banco("BBVA Frances") 
    	var carp = new Club("River Plate")
    	var biblioteca = new Biblioteca("Biblioteca Nacional")
    	
    	return new ArrayList(Arrays.asList(bbva, carp, biblioteca))
    }
}