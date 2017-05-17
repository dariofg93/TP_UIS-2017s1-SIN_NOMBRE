package model.pais

import java.util.Arrays
import model.lugar.Banco
import model.lugar.Biblioteca
import model.lugar.Club
import model.ocupante.Villano
import org.junit.Before
import org.junit.Test

import static org.mockito.Mockito.*
import org.junit.Assert

class PaisTest {

    Pais argentina
    Pais brasil; Pais uruguay; Pais paraguay                                //Conexiones
    Banco bancoGalicia; Biblioteca bibliotecaNacional; Club riverPlate      //lugaresDeInteres

    @Before
    def void setUp() {
        brasil = mock(Pais) ; uruguay = mock(Pais) ; paraguay = mock(Pais)
        bancoGalicia = mock(Banco) ; bibliotecaNacional = mock(Biblioteca) ; riverPlate = mock(Club)

        argentina = new Pais(1,"Nombre",
        Arrays.asList("Moneda Peso","Bandera Celeste y Blanca","Hablan español"),
        Arrays.asList(brasil,uruguay,paraguay),
        Arrays.asList(bancoGalicia,bibliotecaNacional,riverPlate))
    }
/*
    @Test
    def void asignarPistasALugares() {
        var paisActual = mock(Pais)
        var alCapone = mock(Villano)
        argentina.asignarPistasALugares(alCapone,paisActual)

        verify(bancoGalicia).pedirPistas(alCapone,paisActual)
        verify(bibliotecaNacional).pedirPistas(alCapone,paisActual)
        verify(riverPlate).pedirPistas(alCapone,paisActual)
    }

    @Test
    def void asignarOcupantesALugares() {
        var paisAnterior = brasil
        argentina.asignarOcupantesALugares(paisAnterior)
    }

    @Test
    def void asignarUltimasPistas() {
        argentina.asignarUltimasPistas()

        verify(riverPlate).setPistas(Arrays.asList("CUIDADO DETECTIVE!! ha estado a punto de caer en una trampa.."))
        verify(bancoGalicia).setPistas(Arrays.asList("CUIDADO DETECTIVE!! ha estado a punto de caer en una trampa.."))
        verify(bibliotecaNacional).setPistas(Arrays.asList("CUIDADO DETECTIVE!! ha estado a punto de caer en una trampa.."))
    }

    @Test
    def void asignarVillano() {
        var alCapone = mock(Villano)
        argentina.setLugaresDeInteres(Arrays.asList(riverPlate))

        argentina.asignarVillano(alCapone)

        verify(riverPlate).setOcupante(alCapone)
    }

    @Test
    def void clonarTest() {
        var Pais unPais = argentina.clonar

        //Assert.assertTrue(unPais.instanceof(Pais))
    }
    */
}