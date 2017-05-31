package model.orden

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import model.ocupante.Villano
import model.excepciones.NoEstaElVillanoException
import static org.mockito.Mockito.*

class OrdenTest {

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

    @Test
    def void fueEmitidaTest() {
        Assert.assertEquals(ordenEmitida.fueEmitida,1)
        Assert.assertEquals(ordenNula.fueEmitida,0)
    }

    @Test
    def void nombreTest() {
        when(villanoMock.nombre).thenReturn("Pepe")

        Assert.assertEquals(ordenEmitida.nombre,"Pepe")
        Assert.assertEquals(ordenNula.nombre,"Nadie")
    }
}