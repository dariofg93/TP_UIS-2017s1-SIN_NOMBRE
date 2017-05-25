angular.module("CarmenSandiego")

.controller("ResolverMisterioController", function($scope, $http) {
    //spinner y ocultar container
    $(".container").hide();
    $(".spinner").show();

    $scope.title = "Resolver Misterio";
    $scope.viewData = {};
    $scope.lugarSeleccionado;
    $scope.pista; 
    $scope.villanos;
    $scope.villanoSeleccionado;

    //Post iniciar juego
    $http.post("http://localhost:9000/iniciarJuego").then(function(response, status) {
        $scope.caso = response.data;
    });

    //Get villanos
    $http.get("http://localhost:9000/villanos").then(function(response, status) {
        $scope.villanos = response;
    });

    $(".container").show();
    $(".spinner").hide();

    $scope.getPista = function(lugar) {
        //getPista
        $scope.pista = "Pista de: " + lugar;
        $scope.lugarSeleccionado = lugar;
        $('#modalLugar').modal('show');
    }

    $scope.emitirOrdenArresto = function() {
        //post villano.id
        alert("id: "+ $scope.villanoSeleccionado);
    }

    $scope.viajar = function() {
        //post pais.id
        alert("Pais: "+ $scope.paisSeleccionado.nombre);
    }
});