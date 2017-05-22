$(document).ready(function(){
    //Components initialization
    $('.modal').modal();
    $('select').material_select();
});

angular.module("CarmenSandiego")

.controller("ResolverMisterioController", function() {
    this.title = "Resolver Misterio";
    this.paisSeleccionado = "";
    this.lugarSeleccionado;
    this.pista; 
    this.villanoSeleccionado = "";
    this.villanos = [
        {
            "nombre": "Carmen San Diego",
            "id": 1
        },
        {
            "nombre": "Higor Hiorovich",
            "id": 2
        },
        {
            "nombre": "Elvis Presley",
            "id": 3
        },
        {
            "nombre": "Al Capone",
            "id": 4
        },
        {
            "nombre": "Lucei Lou",
            "id": 5
        },
        {
            "nombre": "Betty Chiars",
            "id": 6
        }
    ]
    this.caso = {
        "id": 1,
        "pais": {
            "id": 2,
            "nombre": "Cuba",
            "lugares": [
                "Embajada",
                "Banco",
                "Club"
            ],
            "conexiones": [
                {
                    "nombre": "Arabia Saudita",
                    "id": 7
                },
                {
                    "nombre": "Israel",
                    "id": 3
                },
                {
                    "nombre": "Japón",
                    "id": 9
                },
                {
                    "nombre": "Rusia",
                    "id": 2
                }
            ]
        },
        "paisesVisitados": ["Egipto", "Argentina"],
        "paisesFallidos": ["Uruguay", "Peru", "China"]
    }

    this.changeVillano = function() {
        alert("id: "+this.villanoSeleccionado);
    }
    this.getPista = function(lugar) {
        //getPista
        this.pista = "Pista de: " + lugar;
        this.lugarSeleccionado = lugar;
        $('#modalLugar').modal('open');
    }

    this.emitirOrdenArresto = function() {
        //post villano.id
        alert("id: "+ this.villanoSeleccionado);

    }
});