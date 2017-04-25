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

        var brasil = new Pais("Brasil",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan portuges", "Bandera verde y amarilla y azul","pentacampeones del mundo")),
        conexiones = new ArrayList<Pais>(Arrays.asList()),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva, biblioteca)))

        var argentina = new Pais("Argentina",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera celeste y blanca","Toman mate")),
        conexiones = new ArrayList<Pais>(Arrays.asList(brasil)),
        lugares = new ArrayList<Lugar>(Arrays.asList(provincia,aaaj)))
        
        var italia = new Pais("Italia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan italiano", "Bandera blanca, roja y verde","Toman vino")),
        conexiones = new ArrayList<Pais>(Arrays.asList(argentina, brasil)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva, biblioteca, juventus)))

        var egipto = new Pais("Egipto",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan arabe", "Bandera roja, blanca y negra","construllen piramides")),
        conexiones = new ArrayList<Pais>(Arrays.asList(brasil,italia,argentina)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva, bibliotecaEgipto)))

        var japon = new Pais("Japon",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan japones", "Bandera roja y blanca","comen arroz")),
        conexiones = new ArrayList<Pais>(Arrays.asList(egipto, brasil)),
        lugares = new ArrayList<Lugar>(Arrays.asList(embajadaMexico,bbva)))


        var rusia = new Pais("Rusia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan ruso", "Bandera roja, blanca y azul")),
        conexiones = new ArrayList<Pais>(Arrays.asList(egipto, japon, italia, argentina)),
        lugares = new ArrayList<Lugar>(Arrays.asList(bbva, bibliotecaJapon,embajadaEeuu)))

        var españa = new Pais("España",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan ruso", "Bandera amarrillo y rojo")),
        conexiones = new ArrayList<Pais>(Arrays.asList(egipto, japon, italia, argentina)),
        lugares = new ArrayList<Lugar>(Arrays.asList(embajadaRusia,barcelona)))

        var cuba = new Pais("Cuba",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera roja, blanca y azul")),
        conexiones = new ArrayList<Pais>(Arrays.asList(rusia)),
        lugares = new ArrayList<Lugar>(Arrays.asList(embajadaEeuu,bibliotecaCuba)))

        var francia = new Pais("Francia",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan frances", "Bandera roja, blanca y azul")),
        conexiones = new ArrayList<Pais>(Arrays.asList(argentina, brasil,rusia, egipto)),
        lugares = new ArrayList<Lugar>(Arrays.asList(embajadaMexico,biblioteca,bbva)))

        var uruguay = new Pais("Uruguay",
        caracteristicas = new ArrayList<String>(Arrays.asList("Hablan español", "Bandera celeste y blanca")),
        conexiones = new ArrayList<Pais>(Arrays.asList(argentina)),
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
        var cabj = new Club("Boca Juniors")
        var juventus = new Club("Juventus FC.")
        var barcelona = new Club("Barcelona FC")
        var biblioteca = new Biblioteca("Biblioteca Nacional")
        var bibliotecaCuba = new Biblioteca("Biblioteca Jose Marti")
        var bibliotecaEgipto = new Biblioteca("Biblioteca de Alejandria")
        var bibliotecaJapon = new Biblioteca("Biblioteca Braille")
        var eeuu = new Embajada("Embajada EEUU")
        var mexico = new Embajada("Embajada Mexico")
        var rusia = new Embajada("Embajada Rusia")

    	return new ArrayList(Arrays.asList(  bbva, provincia,cabj,juventus,
         barcelona, eeuu, biblioteca,bibliotecaCuba, bibliotecaEgipto, bibliotecaJapon,
    mexico,rusia))
    }
}