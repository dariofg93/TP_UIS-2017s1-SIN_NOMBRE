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

class EditarVillanoWindow extends Dialog<Villano>{

    new(WindowOwner owner, Villano model) {
        super(owner, model)
    }

    override createMainTemplate(Panel mainPanel) {
        this.title = "Expedientes - Editar Villano"

        //Nombre villano
        val Panel nombrePanel = new Panel(mainPanel)
        nombrePanel.layout = new ColumnLayout(2)
        new Label(nombrePanel).text = "Nombre:"
        new TextBox(nombrePanel).value <=> "nombre"

        //Sexo villano
        val Panel generoPanel = new Panel(mainPanel)
        generoPanel.layout = new ColumnLayout(2)
        new Label(generoPanel).text = "Sexo:"
        new TextBox(generoPanel).value <=> "sexo"

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
        new Label(hobbiesPanel).text = "Hobbies:"
        new Button(hobbiesPanel) => [
            caption = "Editar Hobbies"
            //onClick [ | new EditarHobbiesWindow()]
        ]
        new List<String>(mainPanel) => [
            height = 80
            width = 130
            items <=> "hobbies"
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