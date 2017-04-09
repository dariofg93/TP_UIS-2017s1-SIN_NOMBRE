package ocupante

import org.junit.Assert
import org.junit.Before
import org.junit.Test
import excepciones.NoEstaElVillanoException
import excepciones.VillanoEscapaException
import java.util.Arrays

class VillanoTest {

    Villano villano

    @Before
    def void setUp() {
        villano = new Villano("Carmen San Diego","Femenino",
        Arrays.asList("Pelo Rubio","Capa Roja"),
        Arrays.asList("Coleciona gemas","Estudia geologia","Anda en moto"))
    }

    @Test(expected=VillanoEscapaException)
    def void actuar() {
        villano.actuar
    }

    @Test
    def void tieneLasMismasCaracteristicas() {
        Assert.assertTrue(villano.mismasCaracteristicas("Pelo Rubio","Estudia geologia"))
    }

    @Test
    def void tieneDiferentesCaracteristicas() {
        Assert.assertFalse(villano.mismasCaracteristicas("Pelo Rubio","Juega bien al futbol"))
    }
}