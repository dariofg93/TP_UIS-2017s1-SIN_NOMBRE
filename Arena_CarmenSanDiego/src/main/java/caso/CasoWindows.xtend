package caso

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import applicationModels.CasoApplicationModel
import org.uqbar.arena.windows.SimpleWindow

class CasoWindows extends SimpleWindow<CasoApplicationModel>{

    new(WindowOwner owner, CasoApplicationModel appModel) {
        super(owner, appModel)
        //title = "Expedientes"
    }

    override addActions(Panel panel) {
        throw new UnsupportedOperationException()
    }

    override createFormPanel(Panel panel) {
        throw new UnsupportedOperationException()
    }

}