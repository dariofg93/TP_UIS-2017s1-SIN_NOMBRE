angular.module("CarmenSandiego")

.controller("MapamundiController", function($scope, $http) {
    $scope.title = "Mapamundi";
    var url = "http://localhost:9000";
    $scope.viewData = {};

    //Get paises tabla
    $http.get(url + "/paises").then(function(response) {
        $scope.paises = response.data;
    });

    //Get paises completos(para select conexiones)
    $http.get(url + "/paisesCompletos").then(function(response) {
        $scope.paisesCompletos = response.data;
    });

    //Llamo a esta funcion para que una vez editado algun pais, los actualice
    $scope.actualizarDatos = function() {
        $http.get(url + "/paises").then(function(response) {
            $scope.paises = response.data;
        });
    };

    //Editar Pais
    $scope.editarPais = function(paisId) {
        $http.get(url + "/paises/" + paisId).then(function(response) {
            $scope.paisSeleccionado = response.data;
        });
    };

    //Borrar Pais
    $scope.borrarPais = function(pais) {
        this.paises.splice(pais, 1);
    };

    //Caracteristicas
    //Add Caracteristica
    $scope.addCaract = function() {
        $scope.paisSeleccionado.caracteristicas.push($scope.viewData.caracteristica);
    };
    //Borrar Caracteristica
    $scope.borrarCaracteristica = function(caract) {
        $scope.paisSeleccionado.caracteristicas.splice(caract, 1);
    };

    //Conexiones
    //Add Caracteristica
    $scope.addConexion = function() {
        $scope.paisSeleccionado.conexiones.push($scope.viewData.conexion);
    };
    //Borrar Caracteristica
    $scope.borrarCaracteristica = function(conexion) {
        $scope.paisSeleccionado.conexiones.splice(conexion, 1);
    };

});