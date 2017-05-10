package applicationModels

import java.util.List
import pais.Pais
import java.util.ArrayList

class CreadorDeJuegoAppModel {
    int id
    List<Pais> paises
    List<Pais> paisesVisitados
    List<Pais> paisesFallidos

    new(int unid,List<Pais> unosPaises){
        id = unid
        paises = unosPaises
        paisesVisitados = new ArrayList<Pais>()
        paisesFallidos = new ArrayList<Pais>()
    }

}