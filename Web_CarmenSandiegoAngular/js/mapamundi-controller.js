angular.module("CarmenSandiego")

.controller("MapamundiController", function($scope, $http) {
    $scope.title = "Mapamundi";
    var header = {Authorization: 'Basic QWxhZGRpbjpvcGVuIHNlc2FtZQ=='};
    var url = "http://localhost:9000";

    //Get paises
    $http.get(url + "/paises").then(function(response) {
        $scope.paises = response.data;
    });

    $scope.editarPais = function(paisId) {
        $http.get(url + "/getPais", 
            {
                params: {id: paisId},
                headers: header
            }
        ).then(function(response) {
            $scope.paisSeleccionado = response.data;
        });
    };

    $scope.borrarPais = function(pais) {
        this.paises.splice(pais, 1);
        alert("Pais eliminado");
    };

});