package views

import applicationModels.ExpedientesAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.List
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.windows.WindowOwner
import ocupante.Villano
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.layout.ColumnLayout

class ExpedientesWindow extends SimpleWindow<ExpedientesAppModel> {

    new(WindowOwner parent) {
        super(parent, new ExpedientesAppModel())
    }

    new(WindowOwner parent, ExpedientesAppModel model) {
        super(parent, model)
    }

    override createMainTemplate(Panel mainPanel) {
        this.title = "Expedientes"

        val Panel contentPanel = new Panel(mainPanel)
        contentPanel.layout = new ColumnLayout(2)

        this.crearListaDeVillanos(contentPanel)
        this.crearPanelDerecho(contentPanel)
    }

    def crearListaDeVillanos(Panel contentPanel) {

        val Panel villanosPanel = new Panel(contentPanel)

        //Creo lista de villano
        new Label(villanosPanel).text = "Villano"
        new List<Villano>(villanosPanel) => [
            height = 150
            width = 130
            value <=> "villanoSeleccionado"
            (items <=> "villanos").adapter = new PropertyAdapter(Villano, "nombre")
        ]

        //Agrega un villano
        new Button(villanosPanel) => [
            caption = "Nuevo"
            val villanoNuevo = new Villano()
            onClick[ |
                var Villano nuevo = this.modelObject.nuevoVillano
                new NuevoVillanoWindow(this, nuevo).open]
        ]

        //Edita un villano
        new Button(villanosPanel) => [
            caption = "Editar"
            onClick[ | new EditarVillanoWindow(this, this.modelObject.villanoSeleccionado).open ]
        ]
    }

    def crearPanelDerecho(Panel contentPanel) {

        val Panel panelDerecho = new Panel(contentPanel)

        //Nombre villano
        val Panel panelNombreVillano = new Panel(panelDerecho)
        panelNombreVillano.layout = new ColumnLayout(2)
        new Label(panelNombreVillano).text = "Nombre:"
        new Label(panelNombreVillano)=> [
            value <=> "villanoSeleccionado.nombre"
            width = 120
        ]
        //Sexo villano
        val Panel panelSexoVillano = new Panel(panelDerecho)
        panelSexoVillano.layout = new ColumnLayout(2)
        new Label(panelSexoVillano).text = "Sexo:"
        new Label(panelSexoVillano)=> [
            value <=> "villanoSeleccionado.sexo"
            width = 120
        ]
        //Senias villano
        new Label(panelDerecho).text = "Senias particulares"
        new List<Villano>(panelDerecho) => [
            height = 100
            width = 130
            items <=> "villanoSeleccionado.seniasParticulares"
        ]
        //Hobbies villano
        new Label(panelDerecho).text = "Hobbies"
        new List<Villano>(panelDerecho) => [
            height = 100
            width = 130
            items <=> "villanoSeleccionado.hobbies"
        ]

    }

    override protected addActions(Panel arg0) {
        throw new UnsupportedOperationException("TODO: auto-generated method stub")
    }

    override protected createFormPanel(Panel arg0) {
        throw new UnsupportedOperationException("TODO: auto-generated method stub")
    }

}
