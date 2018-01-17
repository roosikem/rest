/**
 * 
 */
var demoModule = angular.module("demoModule", ['ngRoute',"changePwdModule", 'ngResource',"angucomplete-alt"]);
demoModule.config(function($routeProvider) {
	$routeProvider
	.when('/home', {
		templateUrl: '/ChemicalDischarge5/cd/mc/routingHome',
		controller: 'UserController'
	})
	.when('/home/:pid', {
		templateUrl: '/ChemicalDischarge5/cd/mc/routingHome',
		controller: 'UserController'
	})
	.when('/viewStudents/:pid', {
		templateUrl: '/ChemicalDischarge5/cd/mc/viewStudents',
		controller: 'StudentController'
	}).when('/viewStudents', {
		templateUrl: '/ChemicalDischarge5/cd/mc/viewStudents',
		controller: 'StudentController'
	}).otherwise({
		redirectTo: '/home'
	});
})

demoModule.factory('Person', ['$resource', function ($resource) {
    return $resource('http://10.136.66.63:8080/ChemicalDischarge5/cd/mc/person/:personId', {personId: '@pid'},
	{
		updatePerson: {method: 'PUT'}
	}
    );
}]);



demoModule.factory('User', ['$resource', function ($resource) {
    //$resource() function returns an object of resource class
    return $resource(
            'http://10.136.66.63:8080/ChemicalDischarge5/cd/mc/person/:id', 
            {id: '@id'},
            {
                update: {
                      method: 'PUT' // To send the HTTP Put request when calling this custom update method.
                }
                 
            }
    );
}]);

demoModule.controller('demoCtrl', ["$scope", "$filter", "$http", "$window","testService", "testFactory", function ($scope, $filter, $http, $window, testService, testFactory) {
	
	 
	 
}]);

demoModule.controller('UserController', ['$scope', '$routeParams', 'User', function($scope, $routeParams, User) {
    var self = this;
    self.user= new User();
   
    self.users=[];
         
    self.fetchAllUsers = function(){
        self.users = User.query();
    };
      
    self.createUser = function(){
        self.user.$save(function(){
            self.fetchAllUsers();
        });
    };

    self.updateUser = function(){
        self.user.$update(function(){
            self.fetchAllUsers();
        });
    };

  

    self.fetchAllUsers();

    self.submit = function() {
        if(self.user.pid==null){
            console.log('Saving New User', self.user);    
            self.createUser();
        }else{
            console.log('Upddating user with id ', self.user.pid);
            self.updateUser();
            console.log('User updated with id ', self.user.pid);
        }
        self.reset();
    };
         
    self.edit = function(id){
        console.log('id to be edited', id);
        User.query(function(data){
        	self.users = data;
        	for(var i = 0; i < self.users.length; i++){
                if(self.users[i].pid == id) {
                   self.user = angular.copy(self.users[i]);
                   break;
                }
            }
        })
        
    };
         
   

     
    self.reset = function(){
        self.user= new User();
        $scope.myForm.$setPristine(); //reset Form
    };
    $scope.ID = $routeParams.pid;
    if($scope.ID != null){
    	self.edit($scope.ID);
    }
    

}]);

demoModule.controller('StudentController', ['$scope', 'User','$location', function($scope, User, $location) {
	 var self = this;
	    self.user= new User();
	     
	    self.users=[];
	         
	    self.fetchAllUsers = function(){
	        self.users = User.query();
	    };
	    self.fetchAllUsers();
	    
	    self.deleteUser = function(identity){
	        var user = User.get({id:identity}, function(user) {
	             User.delete({ id: identity}, function() {
	            	 self.fetchAllUsers();
	             });
	        });
	     };
	     
	     self.remove = function(id){
	         console.log('id to be deleted', id);
	         if(self.user.id == id) {//If it is the one shown on screen, reset screen
	           // self.reset();
	         }
	         self.deleteUser(id);
	     };
    $scope.setCheProductName = function(selected) {
	      
	};
    
	$scope.message = "";
}]);


