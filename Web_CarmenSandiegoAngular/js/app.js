angular.module("CarmenSandiego", ["ngRoute"])

.config(function($routeProvider) {
    $routeProvider
    .when("/", {
        redirectTo: "/resolverMisterio"
    })
    .when("/resolverMisterio", {
        templateUrl: "pages/resolverMisterio.html",
        controller: "ResolverMisterioController",
        controllerAs: "resolverMisterioCtrl"
    })
    .when("/mapamundi", {
        templateUrl: "pages/mapamundi.html",
        controller: "MapamundiController",
        controllerAs: "mapamundiCtrl"
    })
    .when("/expedientes", {
        templateUrl: "pages/expedientes.html",
        controller: "ExpedientesController",
        controllerAs: "expedientesCtrl"
    })
    .otherwise({
		redirectTo: '/'
	})
})

.controller("MainController", function(){
    
});