package applicationModels

import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Observable
@Accessors
class VisitarAppModel {
    var String info
    var String nombreLugar
    var String nombreCaso

    new(String unaInfo, String unNombreLugar, String unNombreCaso){
        info = unaInfo
        nombreLugar = unNombreLugar
        nombreCaso = unNombreCaso
    }
}