package model.ocupante

import model.excepciones.NoEstaElVillanoException
import org.junit.Before
import org.junit.Test

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