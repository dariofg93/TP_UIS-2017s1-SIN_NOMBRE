package dummies

import java.util.ArrayList
import java.util.Arrays
import java.util.List
import lugar.Banco
import lugar.Biblioteca
import lugar.Club
import pais.Pais
import lugar.Lugar
import lugar.Embajada

class PaisesRepositorio {

    static List<String> caracteristicas
    static List<Pais> conexiones
    static List<Lugar> lugares

    var static mapamundi = new ArrayList() => [
        var bbva = new Banco("BBVA Frances")
        var provincia = new Banco("Banco Provincia")
        var aaaj = new Club("Argentinos Juniors")
        var juventus = new Club("Juventus FC.")
        var biblioteca = new Biblioteca("Biblioteca Nacional")
        var bibliotecaEgipto = new Biblioteca("Biblioteca de Alejandria")
        var embajadaMexico = new Embajada("Embajada Mexico")

        var bibliotecaJapon = new Biblioteca("Biblioteca Braille")
        var bibliotecaCuba = new Biblioteca("Biblioteca Jose Marti")
        var embajadaEeuu = new Embajada("Embajada EEUU")
        var embajadaRusia = new Embajada("Embajada Rusia")
        var barcelona = new Club("Barcelona FC")

        var brasil = new Pais(1,"Brasil",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan portuges", "Bandera verde y amarilla y azul","pentacampeones del mundo","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList()),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva, biblioteca)))

        var argentina = new Pais(2,"Argentina",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera celeste y blanca","Toman mate","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(brasil)),
        lugares = new ArrayList<Lugar>(Arrays.asList(provincia,aaaj)))

        var italia = new Pais(3,"Italia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan italiano", "Bandera blanca, roja y verde","Toman vino","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(argentina, brasil)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva, biblioteca, juventus)))

        var egipto = new Pais(4,"Egipto",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan arabe", "Bandera roja, blanca y negra","construllen piramides","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(brasil,italia,argentina)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva, bibliotecaEgipto)))

        var japon = new Pais(5,"Japon",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan japones", "Bandera roja y blanca","comen arroz","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(egipto, argentina,italia)),
        lugares = new ArrayList<Lugar>(Arrays.asList(embajadaMexico,bbva)))


        var rusia = new Pais(6,"Rusia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan ruso", "Bandera roja, blanca y azul","Sufren bajas temperaturas","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(egipto, japon, italia, argentina)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva, bibliotecaJapon,embajadaEeuu)))

        var españa = new Pais(7,"España",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan ruso", "Bandera amarrillo y rojo","Tienen a los mejores jugadores del mundo","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(egipto, japon, italia, argentina)),
        lugares = new ArrayList<Lugar>(Arrays.asList(embajadaRusia,barcelona)))

        var cuba = new Pais(8,"Cuba",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera roja, blanca y azul","El pais es un Archipielago","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(rusia,egipto, japon, italia)),
        lugares = new ArrayList<Lugar>(Arrays.asList(embajadaEeuu,bibliotecaCuba)))

        var francia = new Pais(9,"Francia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan frances", "Bandera roja, blanca y azul","La torre eiffel es simbolo de su nacion","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(cuba,rusia, egipto)),
        lugares = new ArrayList<Lugar>(Arrays.asList(embajadaMexico,biblioteca,bbva)))

        var uruguay = new Pais(10,"Uruguay",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera celeste","En 1950 dieron un Maracanazo","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(argentina,francia,españa)),
        lugares = new ArrayList<Lugar>(Arrays.asList(embajadaMexico,bbva)))

        add(argentina)
        add(brasil)
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

    def static List<Lugar> getLugares() {
        var bbva = new Banco("BBVA Frances")
        var provincia = new Banco("Banco Provincia")
        var aaaj = new Club("Argentinos Juniors")
        var juventus = new Club("Juventus FC.")
        var barcelona = new Club("Barcelona FC")
        var biblioteca = new Biblioteca("Biblioteca Nacional")
        var bibliotecaCuba = new Biblioteca("Biblioteca Jose Marti")
        var bibliotecaEgipto = new Biblioteca("Biblioteca de Alejandria")
        var bibliotecaJapon = new Biblioteca("Biblioteca Braille")
        var eeuu = new Embajada("Embajada EEUU")
        var mexico = new Embajada("Embajada Mexico")
        var rusia = new Embajada("Embajada Rusia")

        return new ArrayList<Lugar>(Arrays.asList(  bbva, provincia,aaaj,juventus,
        barcelona, eeuu, biblioteca,bibliotecaCuba, bibliotecaEgipto, bibliotecaJapon,
        mexico,rusia))
    }
}