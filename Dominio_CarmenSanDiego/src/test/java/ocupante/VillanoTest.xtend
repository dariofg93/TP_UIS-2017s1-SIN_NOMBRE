package ocupante

import applicationModels.SexosPosibles
import excepciones.VillanoEscapaException
import java.util.Arrays
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class VillanoTest {

    Villano villano

    @Before
    def void setUp() {
        villano = new Villano("Carmen San Diego", 1,SexosPosibles.Masculino,
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