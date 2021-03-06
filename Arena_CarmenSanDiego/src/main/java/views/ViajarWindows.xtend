package views

import applicationModels.ViajarAppModel
import applicationModels.ViajarAppModel.*
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import org.uqbar.arena.bindings.PropertyAdapter
import pais.Pais
import org.uqbar.arena.widgets.Button
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import applicationModels.ResolverMisterioAppModel

class ViajarWindows extends Dialog<ViajarAppModel>{

    new (WindowOwner owner, ViajarAppModel model) {
        super(owner, model)
    }

    override createFormPanel(Panel panel) {
        this.title = "Viajar"

        val Panel viajar = new Panel(panel)
        viajar.layout= new HorizontalLayout

        new Label(viajar) => [
            text = "Estás en: "
            fontSize = 12
        ]
        new Label(viajar)=>[
            value <=> "detective.lugarActual.nombre"
            fontSize = 12
        ]

        new List<String>(panel) => [
            height = 80
            width = 50
            value <=> "paisSeleccionado"
            (items <=> "detective.lugarActual.conexiones").adapter = new PropertyAdapter(Pais, "nombre")
        ]

        val Panel acciones = new Panel(panel)
        acciones.layout= new HorizontalLayout

        new Button(acciones) => [
            caption = "Volver al País anterior"
            val model = new ResolverMisterioAppModel(this.modelObject.getDetective,this.modelObject.getNombreCaso)
            onClick[ this.close new ResolverMisterioWindows(this,model).open ]
        ]

        new Button(acciones) => [
            caption = "Viajar"
            onClick[
                this.modelObject.viajar
                val model = new ResolverMisterioAppModel(this.modelObject.getDetective,this.modelObject.getNombreCaso)
                this.close new ResolverMisterioWindows(this,model).open
            ]
        ]
    }
    /*
            this.modelObject.getDetective.viajar(this.modelObject.getPaisSeleccionado)
            val model = new ResolverMisterioAppModel(this.modelObject.getDetective,"asd")
            onClick[ this.close new ResolverMisterioWindows(this,model).open ]
    */
}