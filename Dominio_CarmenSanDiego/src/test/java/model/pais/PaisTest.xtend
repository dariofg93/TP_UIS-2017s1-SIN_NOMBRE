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
import java.util.List
import java.util.ArrayList

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
    def void clonarTest() {
        var Pais unPais = argentina.clonar

        //verify(riverPlate).setOcupante(alCapone)
        //Assert.assertTrue(unPais.instanceof(Pais))
    }
    */

    @Test
    def void containsAnyTest() {
        var List<Pais> mapamundi = new ArrayList<Pais>()
        Assert.assertFalse(argentina.containsAny(mapamundi))

        mapamundi.add(brasil)
        Assert.assertTrue(argentina.containsAny(mapamundi))
    }
/*
    @Test
    def void findConexionTest() {
        var List<Pais> mapamundi = new ArrayList<Pais>()
        mapamundi.add(brasil)
        Assert.assertFalse(argentina.containsAny(mapamundi))

        Assert.assertTrue(argentina.containsAny(mapamundi))
    }*/
}