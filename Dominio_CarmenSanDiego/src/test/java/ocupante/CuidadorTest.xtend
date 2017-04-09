package ocupante

import org.junit.Before
import org.junit.Test
import excepciones.NoEstaElVillanoException

class CuidadorTest {

    Cuidador informante

    @Before
    def void setUp() {
        informante = new Cuidador()
    }

    @Test(expected=NoEstaElVillanoException)
    def void actuar() {
        informante.actuar
    }
}