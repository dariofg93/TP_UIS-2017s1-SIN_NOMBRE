angular.module("CarmenSandiego")

.controller("ResolverMisterioController", function() {
    this.title = "Resolver Misterio";

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
                    "nombre": "Egipto",
                    "id": 7
                },
                {
                    "nombre": "Israel",
                    "id": 3
                },
                {
                    "nombre": "Japón",
                    "id": 9
                }
            ]
        },
        "paisesVisitados": ["Egipto"],
        "paisesFallidos": []
    }
});