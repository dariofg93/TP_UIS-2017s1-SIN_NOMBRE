package baseCentralAcme

import org.junit.Assert
import org.junit.Before
import org.junit.Test

import pais.Pais

import static org.mockito.Mockito.*
import baseCentralAcme.BaseCentralAcme
import ocupante.Villano
import java.util.Arrays

class BaseCentralAcmeTest {

    BaseCentralAcme unaBaseCentralAcme
    Villano unVillanoMock
    Villano unVillanoMock2
    Pais argentina
    Pais unPaisMock
    BaseCentralAcme acme

    @Before
    def void setUp() {
        unPaisMock = mock(Pais)
        acme = mock(BaseCentralAcme)

        argentina = mock(Pais)
        when(argentina.nombre).thenReturn("Argentina")
        when(argentina.conexiones).thenReturn(Arrays.asList(unPaisMock,unPaisMock,unPaisMock))

        unaBaseCentralAcme = new BaseCentralAcme()

        unVillanoMock = mock(Villano)
        when(unVillanoMock.mismasCaracteristicas("Pelo rojo","Juega bien al futbol")).thenReturn(false)

        unVillanoMock2 = mock(Villano)
        when(unVillanoMock2.mismasCaracteristicas("Pelo rojo","Juega bien al futbol")).thenReturn(true)
        when(unVillanoMock2.nombre).thenReturn("Dario")
    }

    @Test
    def void registrarVillanoTest() {
        unaBaseCentralAcme.registrarVillano(unVillanoMock)

        Assert.assertTrue(unaBaseCentralAcme.villanos.contains(unVillanoMock))
    }

    @Test
    def void registrarPaisTest() {
        unaBaseCentralAcme.registrarPais(argentina)

        Assert.assertTrue(unaBaseCentralAcme.mapamundi.contains(argentina))
    }

    @Test
    def void validarOrdenTest() {
        unaBaseCentralAcme.registrarVillano(unVillanoMock)
        unaBaseCentralAcme.registrarVillano(unVillanoMock2)

        Assert.assertEquals(unVillanoMock2.nombre,
        (unaBaseCentralAcme.validarOrden("Pelo rojo","Juega bien al futbol")).nombre)
    }

    @Test
    def void crearCasoTest() {
        unaBaseCentralAcme.registrarVillano(unVillanoMock)
        for(var i = 0;i<8;i++) { unaBaseCentralAcme.registrarPais(argentina) }

        Assert.assertEquals(unaBaseCentralAcme.crearCaso("Los turros se robaron algo","Cadena de la Yeni").size,1)
    }
}