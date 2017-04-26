package applicationModels

import detective.Detective
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import ocupante.Villano
import dummies.VillanosRepositorio
import java.util.List

@Observable
@Accessors
class ResolverMisterioAppModel {

    Detective detective
    String nombreCaso
    var List<Villano> villanos = VillanosRepositorio.getVillanos()
    var Villano villanoSeleccionado

    new(Detective unDetective, String unCaso){
        nombreCaso = unCaso
        detective = unDetective
    }

    def nombreOrdenEmitida(){
        detective.ordenEmitida.nombre
    }
	
	def setOrden(Villano villano) {
		detective.setOrden(villano)
	}
	
}