angular.module("CarmenSandiego")

.controller("ResolverMisterioController", function($scope, $http) {
    var url = "http://localhost:9000";
    var header = {'Content-Type': 'application/x-www-form-urlencoded'};
    $scope.title = "Resolver Misterio";
    $scope.viewData = {};

    //Post iniciar juego
    $http.post(url + "/iniciarJuego").then(function(response, status) {
        $scope.caso = response.data;
        $scope.idCaso = response.data.id;
    });

    //Get villanos
    $http.get(url + "/villanos").then(function(response, status) {
        $scope.villanos = response.data;
        $scope.villanoSeleccionado = response.data[0].id;
    });

    //Post viajar
    $scope.viajar = function() {
        $http({
            method: 'POST',
            url: url + "/viajar",
            data: {"destinoId": $scope.viewData.paisSeleccionado.id, "casoId": $scope.idCaso},
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        })
        .then(function(response, status) {
            $scope.caso = response.data;
            $scope.idCaso = response.data.id;
            alert(response.data);
        },
        function(error) {
            alert("error: " + error.data);
        });
    }

    //Get pista
    $scope.getPista = function(lugar) {
        $http.get(url + "/pistaDelLugar/"+$scope.idCaso+"/"+lugar).then(function(response, status) {
            $scope.lugarSeleccionado = response.data;
        });
        $('#modalLugar').modal('show');
    }

    //Post emitir orden de arresto
    $scope.emitirOrdenArresto = function() {
        $http({
            method: 'POST',
            url: url + "/emitirOrden",
            data: {"villanoId": $scope.villanoSeleccionado, "casoId": $scope.idCaso},
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}
        })
        .then(function(response, status) {
            $scope.ordenEmitida = response.data;
            alert(response.data);
        },
        function(error) {
            alert("error: " + error.data);
        });
    }
});