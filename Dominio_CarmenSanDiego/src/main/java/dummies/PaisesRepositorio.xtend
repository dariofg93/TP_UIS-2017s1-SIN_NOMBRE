package dummies

import java.util.ArrayList
import java.util.Arrays
import java.util.List
import model.lugar.*
import model.pais.Pais

import static dummies.LugaresRepositorio.*

class PaisesRepositorio {

    static List<String> caracteristicas
    static List<Pais> conexiones
    static List<Lugar> lugares

    var static mapamundi = new ArrayList() => [
        var brasil = new Pais(1,"Brasil",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan portuges", "Bandera verde y amarilla y azul","pentacampeones del mundo")),
        conexiones = new ArrayList<Pais>(Arrays.asList()),
        lugares = new ArrayList<Lugar>(Arrays.asList(getLugar(0),getLugar(1),getLugar(2))))

        var argentina = new Pais(2,"Argentina",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera celeste y blanca","Toman mate")),
        conexiones = new ArrayList<Pais>(Arrays.asList(brasil)),
        lugares = new ArrayList<Lugar>(Arrays.asList(getLugar(3),getLugar(4),getLugar(5))))

        var italia = new Pais(3,"Italia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan italiano", "Bandera blanca, roja y verde","Toman vino")),
        conexiones = new ArrayList<Pais>(Arrays.asList(argentina, brasil)),
        lugares = new ArrayList<Lugar>(Arrays.asList(getLugar(6),getLugar(7),getLugar(8))))

        var egipto = new Pais(4,"Egipto",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan arabe", "Bandera roja, blanca y negra","construllen piramides")),
        conexiones = new ArrayList<Pais>(Arrays.asList(brasil,italia,argentina)),
        lugares = new ArrayList<Lugar>(Arrays.asList(getLugar(9),getLugar(10),getLugar(11))))

        var japon = new Pais(5,"Japon",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan japones", "Bandera roja y blanca","comen arroz")),
        conexiones = new ArrayList<Pais>(Arrays.asList(egipto, argentina,italia)),
        lugares = new ArrayList<Lugar>(Arrays.asList(getLugar(12),getLugar(13),getLugar(14))))

        var rusia = new Pais(6,"Rusia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan ruso", "Bandera roja, blanca y azul","Sufren bajas temperaturas")),
        conexiones = new ArrayList<Pais>(Arrays.asList(egipto, japon, italia, argentina)),
        lugares = new ArrayList<Lugar>(Arrays.asList(getLugar(15),getLugar(16),getLugar(17))))

        var españa = new Pais(7,"España",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan ruso", "Bandera amarrillo y rojo","Tienen a los mejores jugadores del mundo")),
        conexiones = new ArrayList<Pais>(Arrays.asList(egipto, japon, italia, argentina)),
        lugares = new ArrayList<Lugar>(Arrays.asList(getLugar(18),getLugar(19),getLugar(20))))

        var cuba = new Pais(8,"Cuba",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera roja, blanca y azul","El pais es un Archipielago")),
        conexiones = new ArrayList<Pais>(Arrays.asList(rusia,egipto, japon, italia)),
        lugares = new ArrayList<Lugar>(Arrays.asList(getLugar(21),getLugar(22),getLugar(23))))

        var francia = new Pais(9,"Francia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan frances", "Bandera roja, blanca y azul","La torre eiffel es simbolo de su nacion")),
        conexiones = new ArrayList<Pais>(Arrays.asList(cuba,rusia, egipto)),
        lugares = new ArrayList<Lugar>(Arrays.asList(getLugar(24),getLugar(25),getLugar(26))))

        var uruguay = new Pais(10,"Uruguay",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera celeste","En 1950 dieron un Maracanazo")),
        conexiones = new ArrayList<Pais>(Arrays.asList(argentina,francia,españa)),
        lugares = new ArrayList<Lugar>(Arrays.asList(getLugar(27),getLugar(28),getLugar(29))))

        add(brasil)
        add(argentina)
        add(italia)
        add(egipto)
        add(japon)
        add(rusia)
        add(españa)
        add(cuba)
        add(francia)
        add(uruguay)

    ]

    def static List<Pais> getMapamundi() {
        return mapamundi
    }

    def static List<Lugar> getLugaresDePaises() {
        return getLugares
    }
}