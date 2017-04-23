package lugares

import java.util.ArrayList
import lugar.Banco
import ocupante.Cuidador
import ocupante.Villano
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import pais.Pais

import static org.mockito.Mockito.*

class BancoTest {

    Banco unBanco
    Villano unVillano
    Cuidador ocupante
    ArrayList<String> seniasD
    ArrayList<String> caracteristicasArg
    Pais argentina

    @Before
    def void setUp() {

        seniasD = new ArrayList<String>()
        seniasD.add("Pelo rojo")
        caracteristicasArg = new ArrayList<String>()
        caracteristicasArg.add("Bandera Azul y Blanca")


        unVillano = mock(Villano)
        when(unVillano.seniasParticulares).thenReturn(seniasD)
        argentina = mock(Pais)
        when(argentina.caracteristicas).thenReturn(caracteristicasArg)



        ocupante = new Cuidador
        unBanco = new Banco("Provincia", ocupante)

    }

    @Test
    def void pistasDeBanco() {

        unBanco.pedirPistas(unVillano, argentina)
        Assert.assertTrue(unBanco.getPistas.contains("Pelo rojo"))
        Assert.assertTrue(unBanco.getPistas.contains("Bandera Azul y Blanca"))

    }


}