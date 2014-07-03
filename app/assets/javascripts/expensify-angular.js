//= require angular
//= require angular-resource
//= require angular-route
//= require_self
//= require_tree ./angular/initializers
//= require_tree ./angular

Expensify = angular.module('Expensify', ["ngResource", "ngRoute"]);
