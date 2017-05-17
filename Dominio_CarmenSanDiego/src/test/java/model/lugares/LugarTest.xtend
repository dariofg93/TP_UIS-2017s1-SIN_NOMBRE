package model.lugares

import model.excepciones.NoEstaElVillanoException
import model.excepciones.VillanoEscapaException
import java.util.Arrays
import model.lugar.Club
import model.lugar.Lugar
import model.ocupante.*
import model.orden.Orden
import org.junit.Assert
import org.junit.Before
import org.junit.Test

import static org.mockito.Mockito.*

class LugarTest {
    Lugar riverPlate
    Orden orden

    @Before
    def void setUp() {
        orden = mock(Orden)

        riverPlate = new Club("River Plate")
        riverPlate.setPistas(Arrays.asList("Tiene pelo Rojo","Juega bien al Futbol"))
    }

    @Test
    def void mostrarPistasInformante() {
        var informante = mock(Informante)
        when(informante.actuar).thenReturn("")

        riverPlate.setOcupante(informante)

        var pistasEsperadas = "Tiene pelo Rojo, Juega bien al Futbol"

        Assert.assertEquals(riverPlate.mostrarPistas(orden),pistasEsperadas)
    }

    @Test
    def void mostrarPistasCuidador() {
        var cuidador = mock(Cuidador)
        doThrow(new NoEstaElVillanoException()).when(cuidador).actuar
        riverPlate.setOcupante(cuidador)

        var pistasEsperadas = "Lo siento creo que se ha equivocado de Ciudad, no hay nadie con esas caracteristicas"

        Assert.assertEquals(riverPlate.mostrarPistas(orden),pistasEsperadas)
    }

    @Test
    def void mostrarPistasVillanoQueEscapo() {
        var villano = mock(Villano)
        when(villano.nombre).thenReturn("Carmen San Diego")
        doThrow(new VillanoEscapaException()).when(villano).actuar
        riverPlate.setOcupante(villano)

        when(orden.fueEmitida()).thenReturn(0)
        var pistasEsperadas = "El villano ha escapado"

        Assert.assertEquals(riverPlate.mostrarPistas(orden),pistasEsperadas)
    }

    @Test
    def void mostrarPistasVillanoEquivocado() {
        var villano = mock(Villano)
        doThrow(new VillanoEscapaException()).when(villano).actuar
        riverPlate.setOcupante(villano)

        when(orden.nombre).thenReturn("Al Capone")
        when(orden.fueEmitida()).thenReturn(1)

        var pistasEsperadas = "ALTO!!! Detengase: Al Capone"

        Assert.assertEquals(riverPlate.mostrarPistas(orden),pistasEsperadas)
    }
}