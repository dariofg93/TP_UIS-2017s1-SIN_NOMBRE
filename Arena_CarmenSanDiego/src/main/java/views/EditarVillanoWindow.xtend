package views

import org.uqbar.arena.windows.WindowOwner
import ocupante.Villano

class EditarVillanoWindow extends VillanoEditableWindow {

    new(WindowOwner owner, Villano model) {
        super(owner, model)
        title = "Expedientes - Editar Villano"
    }
}