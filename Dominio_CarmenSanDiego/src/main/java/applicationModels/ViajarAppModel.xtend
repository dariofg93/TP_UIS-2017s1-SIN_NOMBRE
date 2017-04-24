package applicationModels

import detective.Detective
import pais.Pais
import org.uqbar.commons.utils.Observable
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
@Observable
class ViajarAppModel {

    var Detective detective
    var Pais paisSeleccionado

    new(Detective unDetective){
        detective = unDetective
    }
}