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

    var static lugares = new ArrayList() => [
        add(new Banco("BBVA Frances"))                      //0
        add(new Banco("Banco Provincia"))                   //1

        add(new Club("Argentinos Juniors"))                 //2
        add(new Club("Juventus FC."))                       //3
        add(new Club("Barcelona FC"))                       //4

        add(new Biblioteca("Biblioteca Nacional"))          //5
        add(new Biblioteca("Biblioteca de Alejandria"))     //6
        add(new Biblioteca("Biblioteca Braille"))           //7
        add(new Biblioteca("Biblioteca Jose Marti"))        //8

        add(new Embajada("Embajada EEUU"))                  //9
        add(new Embajada("Embajada Mexico"))                //10
        add(new Embajada("Embajada Rusia"))                 //11
    ]

    var static mapamundi = new ArrayList() => [
        var brasil = new Pais("Brasil",
        Arrays.asList("Hablan portuges", "Bandera verde y amarilla y azul","pentacampeones del mundo"),
        Arrays.asList(),
        Arrays.asList(getLugares.get(0), getLugares.get(5)))

        var argentina = new Pais("Argentina",
        Arrays.asList("Hablan español", "Bandera celeste y blanca","Toman mate"),
        Arrays.asList(brasil),
        Arrays.asList(getLugares.get(1),getLugares.get(2)))

        var italia = new Pais("Italia",
        Arrays.asList("Hablan italiano", "Bandera blanca, roja y verde","Toman vino"),
        Arrays.asList(argentina, brasil),
        Arrays.asList(getLugares.get(0), getLugares.get(5), getLugares.get(3)))

        var egipto = new Pais("Egipto",
        Arrays.asList("Hablan arabe", "Bandera roja, blanca y negra","construllen piramides"),
        Arrays.asList(brasil,italia,argentina),
        Arrays.asList(getLugares.get(0), getLugares.get(6)))

        var japon = new Pais("Japon",
        Arrays.asList("Hablan japones", "Bandera roja y blanca","comen arroz"),
        Arrays.asList(egipto, italia,argentina),
        Arrays.asList(getLugares.get(10),getLugares.get(0)))

        var rusia = new Pais("Rusia",
        Arrays.asList("Hablan ruso", "Bandera roja, blanca y azul","Sufren bajas temperaturas"),
        Arrays.asList(egipto, japon, italia, argentina),
        Arrays.asList(getLugares.get(0), getLugares.get(7),getLugares.get(9)))

        var españa = new Pais("España",
        Arrays.asList("Hablan catalán", "Bandera amarrillo y rojo","Tienen a los mejores jugadores del mundo"),
        Arrays.asList(egipto, japon, italia, argentina),
        Arrays.asList(getLugares.get(11),getLugares.get(4)))

        var cuba = new Pais("Cuba",
        Arrays.asList("Hablan español", "Bandera roja, blanca y azul","El pais es un Archipielago"),
        Arrays.asList(rusia,españa,egipto),
        Arrays.asList(getLugares.get(9),getLugares.get(8)))

        var francia = new Pais("Francia",
        Arrays.asList("Hablan frances", "Bandera roja, blanca y azul","La torre eiffel es simbolo de su nacion"),
        Arrays.asList(argentina,rusia, egipto),
        Arrays.asList(getLugares.get(10),getLugares.get(5),getLugares.get(0)))

        var uruguay = new Pais("Uruguay",
        Arrays.asList("Hablan español", "Bandera celeste","En 1950 dieron un Maracanazo"),
        Arrays.asList(argentina,japon,egipto),
        Arrays.asList(getLugares.get(10),getLugares.get(0)))

        /*
        brasil => [ agregarConexion(argentina);agregarConexion(egipto);agregarConexion(rusia)]
        argentina => [ agregarConexion(italia);agregarConexion(japon);agregarConexion(españa)]
        italia => [ agregarConexion(egipto);agregarConexion(rusia);agregarConexion(cuba)]
        egipto => [ agregarConexion(japon);agregarConexion(españa);agregarConexion(francia)]
        japon => [ agregarConexion(rusia);agregarConexion(cuba);agregarConexion(uruguay)]
        rusia => [ agregarConexion(españa);agregarConexion(francia);agregarConexion(brasil)]
        españa => [ agregarConexion(cuba);agregarConexion(uruguay);agregarConexion(argentina)]
        cuba => [ agregarConexion(francia);agregarConexion(brasil);agregarConexion(italia)]
        francia => [ agregarConexion(uruguay);agregarConexion(argentina);agregarConexion(egipto)]
        uruguay => [ agregarConexion(brasil);agregarConexion(italia);agregarConexion(japon)]
        */

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
        return lugares
    }
}