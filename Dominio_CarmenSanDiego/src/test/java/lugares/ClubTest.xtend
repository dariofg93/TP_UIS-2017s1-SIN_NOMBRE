package lugares

import org.junit.Assert
import org.junit.Before
import org.junit.Test

import pais.Pais

import static org.mockito.Mockito.*
import ocupante.Villano
import java.util.ArrayList
import ocupante.Cuidador
import lugar.Club
import java.util.Random

class ClubTest {

    Club unClub
    Villano unVillano
    Cuidador ocupante
    ArrayList<String> seniasD
    ArrayList<String> hobbieVillanos
    Pais argentina
    Random rnd

    @Before
    def void setUp() {

        seniasD = new ArrayList<String>()
            seniasD.add("Pelo rojo")
            seniasD.add("maneja un convertible")

        hobbieVillanos = new ArrayList<String>()
        hobbieVillanos.add("Leer un Libro")

        unVillano = mock(Villano)
            when(unVillano.seniasParticulares).thenReturn(seniasD)
            when(unVillano.hobbies).thenReturn(hobbieVillanos)

        rnd = mock(Random)
        ocupante = new Cuidador
        unClub = new Club("Provincia", ocupante)
            unClub.setRnd(rnd)
    }

    @Test
    def void pistasDeBibliotecaSincHobbie() {
        when(rnd.nextInt(100)).thenReturn(75)
        unClub.pedirPistas(unVillano, argentina)

        Assert.assertTrue(unClub.getPistas.contains("Pelo rojo"))
        Assert.assertTrue(unClub.getPistas.contains("maneja un convertible"))
        Assert.assertFalse(unClub.getPistas.contains("Leer un Libro"))
    }

    @Test
    def void pistasDeBibliotecaConcHobbie() {
        when(rnd.nextInt(100)).thenReturn(25)
        unClub.pedirPistas(unVillano, argentina)

        Assert.assertTrue(unClub.getPistas.contains("Pelo rojo"))
        Assert.assertTrue(unClub.getPistas.contains("maneja un convertible"))
        Assert.assertTrue(unClub.getPistas.contains("Leer un Libro"))
    }
}


