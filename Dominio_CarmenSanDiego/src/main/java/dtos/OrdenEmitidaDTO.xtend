package dtos

import org.eclipse.xtend.lib.annotations.Accessors
import caso.Caso

@Accessors
class OrdenEmitidaDTO {

    var Integer villanoId
    var Integer casoId

    new(Integer villanoId, Integer casoId){
        this.villanoId = villanoId
        this.casoId = casoId
    }
}