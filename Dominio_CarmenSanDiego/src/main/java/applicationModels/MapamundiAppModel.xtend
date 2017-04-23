package applicationModels

import dummies.PaisesRepositorio
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable
import pais.Pais
import java.util.List

@Accessors
@Observable
class MapamundiAppModel {

    var Pais paisSeleccionado
    var List<Pais> paises = PaisesRepositorio.getMapamundi


   def quitarPaisSeleccionado(){
      return quitarPais(paisSeleccionado)

   }

    def quitarPais(Pais unPais){
         paises.remove(unPais)
    }
}