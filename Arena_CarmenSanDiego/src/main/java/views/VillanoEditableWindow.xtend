package views

import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.TextBox
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.List
import ocupante.Villano
import applicationModels.EditarVillanoAppModel
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.commons.model.UserException

class VillanoEditableWindow extends Dialog<Villano>{

    new(WindowOwner owner, Villano model) {
        super(owner, model)
    }

    override protected createFormPanel(Panel mainPanel) {
        this.title = "Expedientes"

        //Nombre villano
        val Panel nombrePanel = new Panel(mainPanel)
        nombrePanel.layout = new ColumnLayout(2)
        new Label(nombrePanel).text = "Nombre:"
        new TextBox(nombrePanel).value <=> "nombre"

        //Sexo villano
        val Panel generoPanel = new Panel(mainPanel)
        generoPanel.layout = new ColumnLayout(2)
        new Label(generoPanel).text = "Sexo:"
        new Selector(generoPanel) => [
            items <=> "sexos"
            value <=> "sexo"
        ]

        //Senias villano
        val Panel seniasPanel = new Panel(mainPanel)
        seniasPanel.layout = new ColumnLayout(2)
        new Label(seniasPanel).text = "Senias Particulares:"
        new Button(seniasPanel) => [
            caption = "Editar Senias Particulares"
            val editarVillanoAppModel = new EditarVillanoAppModel(this.modelObject)
            onClick [ | new EditarSeniasWindow(this, editarVillanoAppModel).open]
        ]
        new List<String>(mainPanel) => [
            height = 80
            width = 130
            items <=> "seniasParticulares"
        ]

        //Hobbies villano
        val Panel hobbiesPanel = new Panel(mainPanel)
        hobbiesPanel.layout = new ColumnLayout(2)
        new Label(hobbiesPanel).text = "Hobbies"
        new Button(hobbiesPanel) => [
            caption = "Editar Hobbies"
            val editarVillanoAppModel = new EditarVillanoAppModel(this.modelObject)
            onClick [ | new EditarHobbiesWindow(this, editarVillanoAppModel).open]
        ]

        new List<String>(mainPanel) => [
            height = 80
            width = 130
            items <=> "hobbies"
        ]

        new Button(mainPanel)=> [
            caption = "Aceptar"
            onClick[ | validarNombre()
         ]
            bindEnabled(new NotNullObservable("sexo"))

        ]
    }

    //Validacion villano
    def validarNombre() {
        if(this.modelObject.nombre == null) {
            throw new UserException("El nombre del villano es obligatorio.")
        }
        else { this.close }
    }

}