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
import applicationModels.SexosPosibles

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
        var unPaisDeRuta = new Pais("España-Villano")

        var clubConexRuta = new Club("Provincia")
        var conexRuta = new Pais("Italia")
        conexRuta.setLugaresDeInteres(Arrays.asList(clubConexRuta))
        conexRuta.setConexiones(Arrays.asList(unPaisDeRuta))

        var clubConexHecho = new Club("Provincia")
        var conexHecho = new Pais("Brasil")
        conexHecho.setLugaresDeInteres(Arrays.asList(clubConexHecho))
        conexHecho.setConexiones(Arrays.asList(conexRuta))

        var unClubRuta = new Club("Provincia")
        unPaisDeRuta.setLugaresDeInteres(Arrays.asList(unClubRuta))
        unPaisDeRuta.setConexiones(Arrays.asList(conexRuta))

        var unClubHecho = new Club("River")
        var lugarDelHecho = new Pais("Argentina")
        lugarDelHecho.setLugaresDeInteres(Arrays.asList(unClubHecho))
        lugarDelHecho.setConexiones(Arrays.asList(conexHecho))

        var responsable = new Villano("Cesar", SexosPosibles.Masculino, Arrays.asList("pelo corto","hincha de bosta","asdads"),Arrays.asList("jugar pinball","jugar futbol","asdas"))
        var rutaDeEscapeNewCase = new ArrayList<Pais>()
        rutaDeEscapeNewCase.add(conexRuta); rutaDeEscapeNewCase.add(unPaisDeRuta)
        /*
        var newCase = new Caso()
        newCase.setPlanDeEscape(rutaDeEscapeNewCase)
        newCase.setPaisDelRobo(lugarDelHecho)

        creador.repartirOcupantes(lugarDelHecho,responsable,newCase)

        Assert.assertTrue(newCase.getPlanDeEscape.get(1).getLugaresDeInteres.get(0).getOcupante.class.simpleName == "Villano")
        Assert.assertTrue(newCase.getPlanDeEscape.get(0).getLugaresDeInteres.get(0).getOcupante.class.simpleName == "Informante")
        Assert.assertEquals(newCase.getPaisDelRobo.getLugaresDeInteres.get(0).getOcupante.class.simpleName,"Informante")
        Assert.assertEquals(newCase.getPaisDelRobo.getConexiones.get(0).getLugaresDeInteres.get(0).getOcupante.class.simpleName,"Cuidador")
        Assert.assertEquals(newCase.getPlanDeEscape.get(1).getConexiones.get(0).getLugaresDeInteres.get(0).getOcupante.class.simpleName,"Informante")
        */

        var caso = creador.crearJuego(responsable,rutaDeEscapeNewCase,"Le robaron a la Yenii","La tarjeta sube de la Yenii",lugarDelHecho)

        //print(caso.getPlanDeEscape.get(0).getNombre + "    ")
        //print(caso.getPlanDeEscape.size)
        //Assert.assertEquals(caso.getPaisDelRobo.getLugaresDeInteres.get(0).getOcupante.class.simpleName,"Informante")
    }
}