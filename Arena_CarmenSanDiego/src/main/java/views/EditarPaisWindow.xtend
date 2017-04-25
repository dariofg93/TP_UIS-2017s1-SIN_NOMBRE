package views

import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import pais.Pais
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import applicationModels.EditarPaisAppModel
import org.uqbar.arena.bindings.PropertyAdapter
import lugar.Lugar
import org.uqbar.commons.model.UserException

class EditarPaisWindow extends Dialog<Pais>{

    new(WindowOwner parent, Pais model) {
        super(parent, model)
    }

    override createMainTemplate(Panel mainPanel){

        this.title = "Mapamundi - Editar Pais"
        
        //Instancio el app model para las vistas que lo necesiten
        val editarPaisAppModel = new EditarPaisAppModel(this.modelObject)
		
		//Nombre pais
        val Panel nombrePais = new Panel(mainPanel)
        nombrePais.layout = new ColumnLayout(2)
        new Label (nombrePais).text = "Nombre:"
        new TextBox(nombrePais).value <=>"nombre"

		//Caracteristicas pais
        val Panel caractPanel = new Panel(mainPanel)
        caractPanel.layout = new ColumnLayout(2)
        new Label(caractPanel).text = "Caracteristicas"
        new Button(caractPanel) =>[ caption = "Editar Caracteristicas"
            onClick[| new EditarCaracteristicasWindow(this, editarPaisAppModel).open]
        ]
        new Label (mainPanel).text = "Caracteristicas"
        new List<Pais>(mainPanel) => [
            items <=> "caracteristicas"
        ]
		
		//Conexiones pais
        val Panel conexionesPanel = new Panel(mainPanel)
        conexionesPanel.layout = new ColumnLayout(2)
        new Label (conexionesPanel).text = "Conexiones"
        new Button(conexionesPanel) => [ caption = "Editar Conexiones"
            onClick[| new EditarConexionesWindow(this, editarPaisAppModel).open]
        ]
        new Label(mainPanel).text = "Conexiones"
        new List<Pais>(mainPanel) => [
            (items <=> "conexiones").adapter = new PropertyAdapter(Pais, "nombre")
        ]

		//Lugares pais
        val Panel lugaresPanel = new Panel(mainPanel)
        lugaresPanel.layout = new ColumnLayout(2)
        new Label(lugaresPanel).text = "Lugares de Interes"
        new Button (lugaresPanel)=> [ caption = "Editar Lugares de Interes"
            onClick[| new EditarLugaresWindow(this, editarPaisAppModel).open]
        ]
        new Label(mainPanel).text = "Lugares de Interes"
        new List<Pais>(mainPanel) => [
            (items <=> "lugaresDeInteres").adapter = new PropertyAdapter(Lugar, "nombre")
        ]

     	this.agregarButton(mainPanel)
    }

	def agregarButton(Panel panel){
		new Button (panel) => [ 
        	caption = "Aceptar"
            onClick[| validarNombre()]
        ]
	}
	
	//Validacion nombre
	def validarNombre() {
		if(this.modelObject.nombre == null) {
			throw new UserException("El nombre del pais es obligatorio.")
		}
		else { this.close }
	}

    override protected addActions(Panel actionsPanel) {
        throw new UnsupportedOperationException("TODO: auto-generated method stub")
    }

    override protected createFormPanel(Panel mainPanel) {
        throw new UnsupportedOperationException("TODO: auto-generated method stub")
    }

}