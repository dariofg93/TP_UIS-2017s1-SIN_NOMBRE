package registroLugar

import lugar.Lugar
import ocupante.Ocupante
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class RegistroLugar {

    var Lugar lugar
    var Ocupante ocupante

    new(Lugar unLugar, Ocupante unOcupante){
        lugar = unLugar
        ocupante = unOcupante
    }
}