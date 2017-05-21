angular.module("CarmenSandiego")

.controller("MapamundiController", function() {
    this.title = "Mapamundi";

    this.paises = [
        {
            "nombre": "Argentina",
            "id": 1
        },
        {
            "nombre": "Cuba",
            "id": 2
        },
        {
            "nombre": "Israel",
            "id": 3
        },
        {
            "nombre": "Ecuador",
            "id": 4
        },
        {
            "nombre": "Canada",
            "id": 5
        },
        {
            "nombre": "Egipto",
            "id": 6
        }
    ];

    this.editarPais = function(paisId) {
        //getPais(paisId)
        //then open modal
        //this.paisBuscado = result.data;
    }
    this.borrarPais = function(pais) {
        this.paises.splice(pais, 1);
        Materialize.toast('País eliminado', 3000, 'rounded');
    }

});