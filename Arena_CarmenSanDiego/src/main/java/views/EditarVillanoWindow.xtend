package views

import org.uqbar.arena.windows.WindowOwner
import ocupante.Villano
import applicationModels.VillanoAppModel

class EditarVillanoWindow extends VillanoEditableWindow {

    new(WindowOwner owner, VillanoAppModel model) {
        super(owner, model)
        title = "Expedientes - Editar Villano"
    }
}