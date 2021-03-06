package views

import applicationModels.MenuDeAccionesModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.List
import pais.Pais
import applicationModels.MapamundiAppModel
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Button
import lugar.Lugar
import org.uqbar.arena.layout.HorizontalLayout
import views.EditarPaisWindow
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class MapamundiWindow extends SimpleWindow<MapamundiAppModel>{


    override createMainTemplate(Panel mapPanel) {

        this.title = "Mapamundi"
        val Panel tablaPanel = new Panel(mapPanel)
        tablaPanel.layout= new ColumnLayout(2)
        this.crearListaDePaises(tablaPanel)
        this.caracteristicasDePaises(tablaPanel)
    }

    def crearListaDePaises(Panel owner){

        val Panel panelDeListadoDePaises = new Panel(owner)

        new Label(panelDeListadoDePaises).text = "Paises"
        new List<Pais>(panelDeListadoDePaises) => [
            //this.title = "Paises"
            height = 230
            width = 150
            value <=> "paisSeleccionado"
            (items <=> "paises").adapter = new PropertyAdapter(Pais, "nombre")

        ]
        new Button(panelDeListadoDePaises) => [
            caption = "Eliminar"
            onClick[ |
                this.modelObject.quitarPaisSeleccionado
            ]
        ]
        new Button(panelDeListadoDePaises) => [
            caption = "Editar"
             onClick[ | new EditarPaisWindow(this, this.modelObject.paisSeleccionado).open ]
        ]
        new Button(panelDeListadoDePaises) => [
            caption = "Nuevo"
            onClick[ |
                var Pais nuevoPais = this.modelObject.nuevoPais
                new NuevoPaisWindow(this, nuevoPais).open]
        ]
    }

    def caracteristicasDePaises(Panel owner){

        val Panel panelDeCaracteristicas = new Panel(owner)

        val Panel nombrePaisPanel= new Panel(panelDeCaracteristicas)
        nombrePaisPanel.layout= new HorizontalLayout

        new Label(nombrePaisPanel).text = "Nombre:  "
        new Label(nombrePaisPanel)=>[
            (value <=> "paisSeleccionado.nombre")
            fontSize = 11
        ]

        new Label(panelDeCaracteristicas).text = "Caracteristicas"

        new List<String>(panelDeCaracteristicas) => [
            title = "Paises"
            items <=> "paisSeleccionado.caracteristicas"
            height = 80
            width = 200
        ]

        new Label(panelDeCaracteristicas).text = "Conexiones"
        new List<String>(panelDeCaracteristicas) => [
            //this.title = "Paises"
            (items <=> "paisSeleccionado.conexiones").adapter = new PropertyAdapter(Pais, "nombre")
            height = 80
            width = 200
        ]

        new Label(panelDeCaracteristicas).text = "Lugares De Interes"
        new List<String>(panelDeCaracteristicas) => [
            //this.title = "Paises"
            (items <=> "paisSeleccionado.lugaresDeInteres").adapter = new PropertyAdapter(Lugar, "nombre")
            height = 80
            width = 200
        ]
    }

    new (WindowOwner parent) {
        super(parent, new MapamundiAppModel())
    }



    override protected addActions(Panel arg0) {
        throw new UnsupportedOperationException("TODO: auto-generated method stub")
    }

    override protected createFormPanel(Panel arg0) {
        throw new UnsupportedOperationException("TODO: auto-generated method stub")
    }
}