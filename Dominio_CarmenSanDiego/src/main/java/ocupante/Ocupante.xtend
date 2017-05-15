package ocupante

import org.eclipse.xtend.lib.annotations.Accessors
import orden.Orden

@Accessors
abstract class Ocupante{

    def String actuar(Orden orden)
    def Boolean estuvoVillano()
}