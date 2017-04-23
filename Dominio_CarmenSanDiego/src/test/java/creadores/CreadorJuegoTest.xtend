package creadores

import java.util.ArrayList
import ocupante.Villano
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import pais.Pais

import static org.mockito.Mockito.*

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
}