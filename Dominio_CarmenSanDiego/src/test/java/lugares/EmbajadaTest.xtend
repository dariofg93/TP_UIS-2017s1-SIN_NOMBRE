package lugares

import org.junit.Assert
import org.junit.Before
import org.junit.Test

import pais.Pais

import static org.mockito.Mockito.*
import ocupante.Villano
import java.util.ArrayList
import ocupante.Cuidador
import lugar.Embajada

class EmbajadaTest {

    Embajada unaEmbajada
    Villano unVillano
    Cuidador ocupante
    ArrayList<String> caracteristicasArg
    Pais argentina

    @Before
    def void setUp() {

        caracteristicasArg = new ArrayList<String>()
        caracteristicasArg.add("Bandera Azul y Blanca")
        caracteristicasArg.add("Moneda Peso")

        argentina = mock(Pais)
        when(argentina.caracteristicas).thenReturn(caracteristicasArg)


        ocupante = new Cuidador
        unaEmbajada = new Embajada("Provincia", ocupante)

    }

    @Test
    def void pistasDeEmbajada() {

        unaEmbajada.pedirPistas(unVillano, argentina)
        Assert.assertTrue(unaEmbajada.getPistas.contains("Bandera Azul y Blanca"))
        Assert.assertTrue(unaEmbajada.getPistas.contains("Moneda Peso"))
        Assert.assertTrue(argentina.caracteristicas.isEmpty)



    }


}