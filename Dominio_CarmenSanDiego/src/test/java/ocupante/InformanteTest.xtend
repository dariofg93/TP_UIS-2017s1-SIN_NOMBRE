package ocupante

import org.junit.Assert
import org.junit.Before
import org.junit.Test

class InformanteTest {

    Informante informante

    @Before
    def void setUp() {
        informante = new Informante()
    }

    @Test
    def void actuar() {
        Assert.assertEquals(informante.actuar,"")
    }
}