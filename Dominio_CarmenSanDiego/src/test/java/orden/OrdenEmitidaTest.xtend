package orden

import org.junit.Assert
import org.junit.Before
import org.junit.Test

import orden.OrdenEmitida

class DetectiveTest {

    OrdenEmitida orden

    @Before
    def void setUp() {
        orden = new OrdenEmitida("Carmen San Diego")
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