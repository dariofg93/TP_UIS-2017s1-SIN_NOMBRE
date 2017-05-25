angular.module("CarmenSandiego")

.controller("ExpedientesController", function($scope, $http) {
    $scope.title = "Expedientes";

    //Get villanos
    $http.get("http://localhost:9000/villanos").then(function(response, status) {
        $scope.villanos = response.data;
    });
});