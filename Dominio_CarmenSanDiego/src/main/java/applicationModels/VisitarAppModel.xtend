package applicationModels

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors
import detective.Detective
import lugar.Lugar

@Observable
@Accessors
class VisitarAppModel {
    var String info
    var Lugar lugar
    var String nombreCaso
    var Detective detective

    new(String unaInfo, Lugar unLugar, String unNombreCaso, Detective unDetective){
        info = unaInfo
        lugar = unLugar
        nombreCaso = unNombreCaso
        detective = unDetective
    }

    def estaElVillano(){
        lugar.estaElVillano
    }

    def nombreDelLugar(){
        lugar.nombre
    }
}