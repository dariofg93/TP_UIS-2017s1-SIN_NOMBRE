package lugares

import java.util.ArrayList
import java.util.Random
import lugar.Biblioteca
import ocupante.Cuidador
import ocupante.Villano
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import pais.Pais

import static org.mockito.Mockito.*

class BibliotecaTest {

    Biblioteca unaBiblioteca
    Villano unVillano
    Cuidador ocupante
    ArrayList<String> seniasD
    ArrayList<String> caracteristicasArg
    ArrayList<String> hobbieVillanos
    Pais argentina
    Random rnd

    @Before
    def void setUp() {

        seniasD = new ArrayList<String>()
        seniasD.add("Pelo rojo")
        caracteristicasArg = new ArrayList<String>()
        caracteristicasArg.add("Bandera Azul y Blanca")
        hobbieVillanos = new ArrayList<String>()
        hobbieVillanos.add("Leer un Libro")

        unVillano = mock(Villano)
        when(unVillano.seniasParticulares).thenReturn(seniasD)
        when(unVillano.hobbies).thenReturn(hobbieVillanos)

        argentina = mock(Pais)
        when(argentina.caracteristicas).thenReturn(caracteristicasArg)

        rnd = mock(Random)
        ocupante = new Cuidador
        unaBiblioteca = new Biblioteca("Provincia", ocupante)
        unaBiblioteca.setRnd(rnd)
    }

    @Test
    def void pistasDeBibliotecaSinHobbie() {
        when(rnd.nextInt(100)).thenReturn(75)
        unaBiblioteca.pedirPistas(unVillano, argentina)

        Assert.assertTrue(unaBiblioteca.getPistas.contains("Pelo rojo"))
        Assert.assertTrue(unaBiblioteca.getPistas.contains("Bandera Azul y Blanca"))
        Assert.assertFalse(unaBiblioteca.getPistas.contains("Leer un Libro"))
    }

    @Test
    def void pistasDeBibliotecaConHobbie() {
        when(rnd.nextInt(100)).thenReturn(25)
        unaBiblioteca.pedirPistas(unVillano, argentina)

        Assert.assertTrue(unaBiblioteca.getPistas.contains("Pelo rojo"))
        Assert.assertTrue(unaBiblioteca.getPistas.contains("Bandera Azul y Blanca"))
        Assert.assertTrue(unaBiblioteca.getPistas.contains("Leer un Libro"))
    }
}


