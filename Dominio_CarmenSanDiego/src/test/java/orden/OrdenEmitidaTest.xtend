package orden

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import ocupante.Villano

import static org.mockito.Mockito.*
import excepciones.NoEstaElVillanoException

class DetectiveTest {

    OrdenEmitida ordenEmitida
    OrdenNula ordenNula
    Villano villanoMock

    @Before
    def void setUp() {
        villanoMock = mock(Villano)
        ordenEmitida = new OrdenEmitida(villanoMock)
        ordenNula = new OrdenNula()
    }

    @Test
    def void getVillanoTest() {
        Assert.assertEquals(ordenEmitida.getVillano,villanoMock)
    }

    @Test(expected=NoEstaElVillanoException)
    def void getVillanoTestSinVillano() {
        ordenNula.getVillano
    }
}