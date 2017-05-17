angular.module('CarmenSandiego', [])

.controller('MainController', function() {
	this.title = "Agenda AngularJS";

	var pepe = {nombre: "pepe", edad:"50", telefono:"1235456"};
	var jose = {nombre: "jose", edad:"40", telefono:"1235456323"};
	var juan = {nombre: "juan", edad:"35", telefono:"5645455"};
	var jorge = {nombre: "jorge", edad:"67", telefono:"5465478899"};
	
	this.personas = [pepe, jose, juan, jorge];
});