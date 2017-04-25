package views

import org.uqbar.arena.windows.WindowOwner
import ocupante.Villano
import applicationModels.VillanoAppModel

class NuevoVillanoWindow extends VillanoEditableWindow {

    new(WindowOwner owner, VillanoAppModel model) {
        super(owner, model)
        title = "Expedientes - Nuevo Villano"
    }
}