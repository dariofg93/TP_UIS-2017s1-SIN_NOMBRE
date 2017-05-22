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
        "paisesFallidos": ["Uruguay", "Peru"]
    }
});