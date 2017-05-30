angular.module("CarmenSandiego")

.controller("MapamundiController", function($scope, $http) {
    $scope.title = "Mapamundi";
    var url = "http://localhost:9000";
    $scope.viewData = {};

    //Get paises
    $http.get(url + "/paises").then(function(response) {
        $scope.paises = response.data;
    });

    //Llamo a esta funcion para que una vez editado algun pais, los actualice
    $scope.actualizarDatos = function() {
        $http.get(url + "/paises").then(function(response) {
            $scope.paises = response.data;
        });
    };

    $scope.editarPais = function(paisId) {
        $http.get(url + "/pais/" + paisId).then(function(response) {
            $scope.paisSeleccionado = response.data;
        });
    };

    $scope.borrarPais = function(pais) {
        this.paises.splice(pais, 1);
        alert("Pais eliminado");
    };

    //Caracteristicas
    $scope.addCaract = function(caract) {
        $scope.paisSeleccionado.caracteristicas.push(caract);
    };

});