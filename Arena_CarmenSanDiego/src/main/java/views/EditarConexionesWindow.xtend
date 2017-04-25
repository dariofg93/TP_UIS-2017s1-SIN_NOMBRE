package views

import org.uqbar.arena.windows.Dialog
import applicationModels.EditarPaisAppModel
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Button
import pais.Pais
import org.uqbar.arena.widgets.Selector
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.commons.model.UserException
import java.util.Arrays

class EditarConexionesWindow extends Dialog<EditarPaisAppModel> {

    new(WindowOwner owner, EditarPaisAppModel model) {
        super(owner, model)
    }

    override createMainTemplate(Panel mainPanel){
        this.title = "Editar Conexiones"

		//Eliminar conexion
        new Label(mainPanel).text = "Conexiones"
        new List<Pais>(mainPanel) => [
            height=80
            width=130
            value <=> "conexionSeleccionada"
            (items <=> "paisSeleccionado.conexiones").adapter = new PropertyAdapter(Pais, "nombre")
        ]
        new Button(mainPanel) => [
            caption = "Eliminar"
            onClick[ | this.modelObject.eliminarConexion(this.modelObject.conexionSeleccionada)]
        ]
        
        //Agregar conexion
        var selectorPanel = new Panel(mainPanel)
        selectorPanel.layout = new ColumnLayout(2)
        new Selector(selectorPanel) => [
        	 value <=> "conexionParaAgregar"
        	 (items <=> "listaDeConexiones").adapter = new PropertyAdapter(Pais, "nombre")
       	]
        new Button(selectorPanel) => [
        	caption = "Agregar"
        	onClick [ | validarConexion()]
        ]
        
        new Button(mainPanel)=> [
            caption = "Aceptar"
            onClick[ | this.close]
        ]
    }
    
    //Validacion
    def validarConexion() {
    	if(this.modelObject.listaDeConexionesOriginal.contains(this.modelObject.conexionParaAgregar)) {
    		this.modelObject.agregarConexion(this.modelObject.conexionParaAgregar)
    	}
    	else {
    		throw new UserException("Las conexiones deben ser a países que se hayan ingresado al sistema previamente.")
    	}
    }

    override protected createFormPanel(Panel mainPanel) {
        throw new UnsupportedOperationException("TODO: auto-generated method stub")
    }
				
}