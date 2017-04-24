package views

import applicationModels.EditarPaisAppModel
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import pais.Pais
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Selector
import lugar.Lugar

class EditarLugaresWindow extends Dialog<EditarPaisAppModel> {
	
	override createMainTemplate (Panel mainPanel){
		this.title = "Editar Lugares"
	
	
	//Eliminar lugar
	new Label(mainPanel).text = "Lugares De Interes"
	new List<Pais>(mainPanel) => [
		height = 80
		width = 130
		value <=> "lugarSeleccionado"
		(items <=> "paisSeleccionado.lugaresDeInteres").adapter = new PropertyAdapter(Lugar, "nombre")
	]
	
	new Button(mainPanel) => [
		caption = "Eliminar"
		onClick [ | this.modelObject.eliminarLugar(this.modelObject.lugarSeleccionado)]
	]
	
	//Agregar lugar
	var agregarPanel = new Panel(mainPanel)
	agregarPanel.layout = new ColumnLayout(2)
	new Selector(agregarPanel) => [
		value <=> "lugarSeleccionado"
		(items <=> "listaDeLugares").adapter = new PropertyAdapter(Lugar, "nombre")
	]
	new Button(agregarPanel) => [
		caption = "Aceptar"
		onClick [ | this.modelObject.agregarLugar(this.modelObject.lugarSeleccionado)]
	]
	
	new Button(mainPanel)=> [
		caption = "Aceptar"
		onClick [ | this.close]
	]
	
	}
	new(WindowOwner owner, EditarPaisAppModel model) {
		super(owner, model)
	}
	
	override protected createFormPanel(Panel mainPanel) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}