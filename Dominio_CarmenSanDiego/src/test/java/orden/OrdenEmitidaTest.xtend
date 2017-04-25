package orden

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ocupante.Villano

import static org.mockito.Mockito.*

class DetectiveTest {

    OrdenEmitida orden
    Villano villanoMock

    @Before
    def void setUp() {
        villanoMock = mock(Villano)
        when(villanoMock.nombre).thenReturn("Carmen San Diego")
        orden = new OrdenEmitida(villanoMock)
    }

    @Test
    def void esElVillanoCorrecto() {
        Assert.assertTrue(orden.esElVillano("Carmen San Diego"))
    }

    @Test
    def void noEsElVillanoCorrecto() {
        Assert.assertFalse(orden.esElVillano("Al Capone"))
    }
}