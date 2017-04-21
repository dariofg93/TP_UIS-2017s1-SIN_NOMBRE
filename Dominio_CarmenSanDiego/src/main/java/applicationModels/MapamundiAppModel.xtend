package applicationModels

import dummies.PaisesRepositorio
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import pais.Pais

@Accessors
@Observable
class MapamundiAppModel {

    var Pais paisSeleccionado
    val paises = PaisesRepositorio.getMapamundi

}