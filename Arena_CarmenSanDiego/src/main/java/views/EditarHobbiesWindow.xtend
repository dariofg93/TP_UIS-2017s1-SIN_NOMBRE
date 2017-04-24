package views

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import applicationModels.EditarVillanoAppModel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.TextBox

class EditarHobbiesWindow extends Dialog<EditarVillanoAppModel>{

    new(WindowOwner owner, EditarVillanoAppModel model) {
        super(owner, model)
    }

    override createMainTemplate(Panel mainPanel){
        this.title = "Editar hobbies"

        new Label(mainPanel).text = "Hobbies"
        new List<String>(mainPanel) => [
            height = 80
            width = 130
            value <=> "hobbieSeleccionado"
            items <=> "villanoSeleccionado.hobbies"
        ]

        new Button(mainPanel)=>[
            caption = "Eliminar"
            onClick[ | this.modelObject.eliminarHobbie(this.modelObject.hobbieSeleccionado) ]
        ]

        //Agregar hobbie
        val Panel agregarHobbiePanel = new Panel(mainPanel)
        agregarHobbiePanel.layout = new ColumnLayout(2)
        new TextBox(agregarHobbiePanel).value <=> "hobbieParaAgregar"
        new Button(agregarHobbiePanel) => [
            caption = "Agregar"
            onClick [ | this.modelObject.agregarHobbie(this.modelObject.hobbieParaAgregar)]
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