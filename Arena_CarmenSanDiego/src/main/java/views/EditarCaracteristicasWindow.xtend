package views

import applicationModels.EditarPaisAppModel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.TextBox

class EditarCaracteristicasWindow extends Dialog<EditarPaisAppModel> {

    new(WindowOwner owner, EditarPaisAppModel model) {
        super(owner, model)
    }

    override createMainTemplate(Panel mainPanel){
        this.title = "Editar Caracteristicas"

        new Label(mainPanel).text = "Caracteristicas"
        new List<String>(mainPanel) => [
            height=80
            width=130
            value <=> "caracteristicaSeleccionada"
            items <=> "paisSeleccionado.caracteristicas"

        ]
        new Button(mainPanel) => [
            caption = "Eliminar"
            onClick[ | this.modelObject.eliminarCaracteristica(this.modelObject.caracteristicaSeleccionada)]
        ]
        
        var textboxPanel = new Panel(mainPanel)
        textboxPanel.layout = new ColumnLayout(2)
        new TextBox(textboxPanel).value <=> "caracteristicaParaAgregar"
        new Button(textboxPanel) => [
        	caption = "Agregar"
        	onClick [ | this.modelObject.agregarCaracteristica(this.modelObject.caracteristicaParaAgregar)]
        ]
        
        new Button(mainPanel)=> [
            caption = "Aceptar"
            onClick[ | this.close]
        ]
    }

    override protected createFormPanel(Panel mainPanel) {
        throw new UnsupportedOperationException("TODO: auto-generated method stub")
    }

}