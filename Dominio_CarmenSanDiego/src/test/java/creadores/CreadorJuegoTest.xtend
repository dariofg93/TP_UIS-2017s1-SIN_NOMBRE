package creadores

import java.util.ArrayList
import ocupante.Villano
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import pais.Pais

import static org.mockito.Mockito.*
import caso.Caso
import java.util.Arrays
import lugar.Club

class CreadorJuegoTest {

    CreadorJuego creador
    Pais bolibiaRobada
    Pais argentina
    Pais brasil
    Villano cesar

    @Before
    def void setUp() {
        cesar = mock(Villano)
        bolibiaRobada = mock(Pais)
        argentina = mock(Pais)
        brasil = mock(Pais)

        creador = new CreadorJuego()
    }

    @Test
    def void crearJuegoTest() {
        var rutaDeEscape = new ArrayList<Pais>()
        rutaDeEscape.add(argentina);rutaDeEscape.add(brasil)

        var caso = creador.crearJuego(cesar,rutaDeEscape,"Otra vez le robaron a la Yenii","Las joyas de la Yenii",bolibiaRobada)

        Assert.assertEquals(caso.responsable,cesar)
        Assert.assertEquals(caso.reporte,"Otra vez le robaron a la Yenii")
        Assert.assertEquals(caso.objeto,"Las joyas de la Yenii")
        Assert.assertEquals(caso.paisDelRobo,bolibiaRobada)

        //verify(brasil).asignarVillano(cesar)
        //Las instancias no son las mismas, ya que cada pais es clonado al momento del creado del juego
        //Entonces no se puede hacer verify sobre ninguna "instancia"
    }

    @Test
    def asd(){
        var clubConexHecho = new Club("Provincia")
        var conexHecho = new Pais()
        conexHecho.setLugaresDeInteres(Arrays.asList(clubConexHecho))

        var clubConexRuta = new Club("Provincia")
        var conexRuta = new Pais()
        conexRuta.setLugaresDeInteres(Arrays.asList(clubConexRuta))


        var unClubRuta = new Club("Provincia")
        var unPaisDeRuta = new Pais()
        unPaisDeRuta.setLugaresDeInteres(Arrays.asList(unClubRuta))
        unPaisDeRuta.setConexiones(Arrays.asList(conexRuta))

        var unClubHecho = new Club("River")
        var lugarDelHecho = new Pais()
        lugarDelHecho.setLugaresDeInteres(Arrays.asList(unClubHecho))
        lugarDelHecho.setConexiones(Arrays.asList(conexHecho))

        var responsable = new Villano()
        var newCase = new Caso()
        var rutaDeEscapeNewCase = new ArrayList<Pais>()
        rutaDeEscapeNewCase.add(conexRuta); rutaDeEscapeNewCase.add(unPaisDeRuta)
        newCase.setPlanDeEscape(rutaDeEscapeNewCase)
        newCase.setPaisDelRobo(lugarDelHecho)

        creador.repartirOcupantes(lugarDelHecho,responsable,newCase)

        Assert.assertTrue(newCase.getPlanDeEscape.get(1).getLugaresDeInteres.get(0).getOcupante.class.simpleName == "Villano")
        Assert.assertTrue(newCase.getPlanDeEscape.get(0).getLugaresDeInteres.get(0).getOcupante.class.simpleName == "Informante")
        Assert.assertEquals(newCase.getPaisDelRobo.getLugaresDeInteres.get(0).getOcupante.class.simpleName,"Informante")
        Assert.assertEquals(newCase.getPaisDelRobo.getConexiones.get(0).getLugaresDeInteres.get(0).getOcupante.class.simpleName,"Cuidador")
        Assert.assertEquals(newCase.getPlanDeEscape.get(1).getConexiones.get(0).getLugaresDeInteres.get(0).getOcupante.class.simpleName,"Informante")
    }
}