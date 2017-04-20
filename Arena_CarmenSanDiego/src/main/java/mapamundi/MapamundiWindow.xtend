package mapamundi

import applicationModels.MenuDeAccionesModel
import org.uqbar.arena.windows.SimpleWindow
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.widgets.Label
import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*
import org.uqbar.arena.widgets.List
import pais.Pais
import applicationModels.MapamundiAppModel
import org.uqbar.arena.bindings.PropertyAdapter
import org.uqbar.arena.widgets.Button
import lugar.Lugar
import org.uqbar.arena.layout.HorizontalLayout

class MapamundiWindow extends SimpleWindow<MapamundiAppModel>{

    override addActions(Panel actionsPanel) {
        this.title = "Mapamundi"

    }

    override createFormPanel(Panel mapPanel) {

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
            (items <=> "paises").adapter = new PropertyAdapter(Pais, "nombre")
            height = 230
            width = 150
            value <=> "paisSeleccionado"
        ]
        new Button(panelDeListadoDePaises) => [
            caption = "Eliminar"
            //onClick[ | paisSeleccionado  ]
        ]
        new Button(panelDeListadoDePaises) => [
            caption = "Editar"
            // onClick[ | paisSeleccionado  ]
        ]
        new Button(panelDeListadoDePaises) => [
            caption = "Nuevo"
            //onClick[ | paisSeleccionado  ]
        ]

    }

    def caracteristicasDePaises(Panel owner){

        val Panel panelDeCaracteristicas = new Panel(owner)

        //var Pais paisSelec = new PropertyAdapter(Pais, "paisSeleccionado")

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
}