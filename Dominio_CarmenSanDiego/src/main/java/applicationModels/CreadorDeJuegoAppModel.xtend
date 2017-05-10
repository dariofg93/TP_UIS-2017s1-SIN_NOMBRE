package applicationModels

import java.util.List
import pais.Pais
import java.util.ArrayList
import caso.Caso
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class CreadorDeJuegoAppModel {
    int id
    Pais pais
    List<Pais> paisesVisitados
    List<Pais> paisesFallidos

    new(Caso unCaso){
        id = unCaso.id
        pais = unCaso.detective.lugarActual
        paisesVisitados = new ArrayList<Pais>()
        paisesFallidos = new ArrayList<Pais>()
    }
}