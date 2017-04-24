package views

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.TextBox
import applicationModels.EditarVillanoAppModel

class EditarSeniasWindow extends Dialog<EditarVillanoAppModel>{

    new(WindowOwner owner, EditarVillanoAppModel model) {
        super(owner, model)
    }

    override createMainTemplate(Panel mainPanel) {
        this.title = "Editar Senias Particulares"

        new Label(mainPanel).text = "Senia"
        new List<String>(mainPanel) => [
            height = 80
            width = 130
            value <=> "seniaSeleccionada"
            items <=> "villanoSeleccionado.seniasParticulares"
        ]

        new Button(mainPanel)=> [
            caption = "Eliminar"
            onClick[ | this.modelObject.eliminarSenia(this.modelObject.seniaSeleccionada)]
        ]

        //Agregar senia
        val Panel agregarSeniaPanel = new Panel(mainPanel)
        agregarSeniaPanel.layout = new ColumnLayout(2)
        new TextBox(agregarSeniaPanel).value <=> "seniaParaAgregar"
        new Button(agregarSeniaPanel) => [
            caption = "Agregar"
            onClick [ | this.modelObject.agregarSenia(this.modelObject.seniaParaAgregar)]
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