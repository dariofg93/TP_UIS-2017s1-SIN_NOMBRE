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
        var bbva                = new Banco("BBVA Frances")
        var palmeiras           = new Club("Palmeiras")
        var biblioteca          = new Biblioteca("Biblioteca Nacional")

        var aaaj                = new Club("Argentinos Juniors")
        var provincia           = new Banco("Banco Provincia")
        var bibliotecaArg       = new Biblioteca("Biblioteca 'La Posada'")

        var embajadaMexico      = new Embajada("Embajada Mexico")
        var bibliotecaItalia    = new Biblioteca("Biblioteca 'La Tana'")
        var juventus            = new Club("Juventus FC.")

        var bibliotecaEgipto    = new Biblioteca("Biblioteca de Alejandria")
        var embajadaEeuu        = new Embajada("Embajada EEUU")
        var abuDabi             = new Club("Abu Dabi FC")

        var bbva2               = new Banco("BBVA Frances")
        var embajadaRusia       = new Embajada("Embajada Rusia")
        var sanfrece            = new Club("Sanfrece Hiroshima FC")

        var bibliotecaRusia     = new Biblioteca("Biblioteca Rusia")
        var embajadaArg         = new Embajada("Embajada Argentina")
        var bancoRusia          = new Banco("Banco Rusia")

        var bbva3               = new Banco("BBVA Frances")
        var bibliotecaEsp       = new Biblioteca("Biblioteca de Gallegos")
        var barcelona           = new Club("Barcelona FC")

        var banco               = new Banco("Banco Nacional")
        var embajadaBrasil      = new Embajada("Embajada Brasil")
        var bibliotecaCuba      = new Biblioteca("Biblioteca Jose Marti")

        var poodle              = new Biblioteca("Biblioteca 'Le Poodles'")
        var embajadaAustralia   = new Embajada("Embajada Australia")
        var bbv4                = new Banco("BBVA Frances")

        var bibliotecaUruguay   = new Biblioteca("Biblioteca 'Lucho Suarez'")
        var embajadaJapon       = new Embajada("Embajada Japon")
        var rio                 = new Banco("Rio")

        var brasil = new Pais(1,"Brasil",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan portuges", "Bandera verde y amarilla y azul","pentacampeones del mundo","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList()),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva,palmeiras,biblioteca)))

        var argentina = new Pais(2,"Argentina",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera celeste y blanca","Toman mate","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(brasil)),
        lugares = new ArrayList<Lugar>(Arrays.asList(provincia,aaaj,bibliotecaArg)))

        var italia = new Pais(3,"Italia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan italiano", "Bandera blanca, roja y verde","Toman vino","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(argentina, brasil)),
        lugares = new ArrayList<Lugar>(Arrays.asList(embajadaMexico,bibliotecaItalia,juventus)))

        var egipto = new Pais(4,"Egipto",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan arabe", "Bandera roja, blanca y negra","construllen piramides","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(brasil,italia,argentina)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bibliotecaEgipto,embajadaEeuu,abuDabi)))

        var japon = new Pais(5,"Japon",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan japones", "Bandera roja y blanca","comen arroz","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(egipto, argentina,italia)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva2,embajadaRusia,sanfrece)))

        var rusia = new Pais(6,"Rusia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan ruso", "Bandera roja, blanca y azul","Sufren bajas temperaturas","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(egipto, japon, italia, argentina)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bibliotecaRusia,embajadaArg,bancoRusia)))

        var españa = new Pais(7,"España",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan ruso", "Bandera amarrillo y rojo","Tienen a los mejores jugadores del mundo","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(egipto, japon, italia, argentina)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva3,bibliotecaEsp,barcelona)))

        var cuba = new Pais(8,"Cuba",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera roja, blanca y azul","El pais es un Archipielago","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(rusia,egipto, japon, italia)),
        lugares = new ArrayList<Lugar>(Arrays.asList(banco,embajadaBrasil,bibliotecaCuba)))

        var francia = new Pais(9,"Francia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan frances", "Bandera roja, blanca y azul","La torre eiffel es simbolo de su nacion","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(cuba,rusia, egipto)),
        lugares = new ArrayList<Lugar>(Arrays.asList(poodle,embajadaAustralia,bbv4)))

        var uruguay = new Pais(10,"Uruguay",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera celeste","En 1950 dieron un Maracanazo","","","","","")),
        conexiones = new ArrayList<Pais>(Arrays.asList(argentina,francia,españa)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bibliotecaUruguay,embajadaJapon,rio)))

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