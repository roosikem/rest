/**
 * 
 */
var demoModule = angular.module("demoModule", []);

demoModule.factory('testFactory', function(){
    return {
        sayHello: function(text){
            return "Search \"Criteria " + text + "\"";
        },
        sayGoodbye: function(text){
            return "Search \"Criteria " + text + "\"";
        }  
    }               
});

demoModule.service('testService', function(){
    this.sayHello= function(text){
        return "Search \"Criteria " + text + "\"";
    };        
    this.sayGoodbye = function(text){
        return "Search \"Criteria " + text + "\"";
    };   
});

demoModule.controller('demoCtrl', ["$scope", "$filter", "$http", "$window","testService", "testFactory", function ($scope, $filter, $http, $window, testService, testFactory) {
	 $scope.fromService = testService.sayHello("Brand");
	 $scope.fromFactory = testFactory.sayHello("Factory");
	
	 $scope.name;
	 $scope.age;
	 $scope.submit = function(){
	 $scope.info = true;
	 $scope.$broadcast('myEvent', {
		    myName: $scope.name,
	        myAge: $scope.age
	    })
	  }
	 
	 
}]);

demoModule.controller("secondCtrl", function($scope) {
	  $scope.myName;
	  $scope.myAge;

	  $scope.$on('myEvent', function(event, message){
		  console.log(event);
	    $scope.myName = message.myName;
	    $scope.myAge = message.myAge;
	  })

	});

demoModule.controller('ParentController', function($scope) {
    $scope.foo = "Hello";
    
    //Emit to Parent example part 2
    $scope.$on("UPDATE_PARENT", function(event, message){
        $scope.foo = message;
          
        //Broadcast to Child example part 1
        $scope.$broadcast("DO_BIDDING", {
            buttonTitle : "Taken over",
            onButtonClick : function(){
                $scope.foo = "HAHA this button no longer works!";
            }
        });
    });
});

demoModule.controller('ChildController', function($scope) {
    $scope.buttonTitle = "Update Parent";
    $scope.onButtonClick = function(){
        
        //Emit to Parent example part 1
        this.$emit("UPDATE_PARENT", "Updated");
    };
    
    //Broadcast to Child example part 2
    $scope.$on("DO_BIDDING", function(event, data){
        for(var i in data){
            $scope[i] = data[i];
        }
    });
});



demoModule.controller('AppCtrl', function($scope){
	$scope.user = 'fabio';
})

// Scope: false (default)
// The directive is in the same scope of the controller
demoModule.directive('profilePanel1', function(){
    return {
        restrict: 'EA',
        template: '<input type="text" ng-model="user" class="form-control">'
    };
})

// Scope: true
// The directive create a new child scope inherited from parent
demoModule.directive('profilePanel2', function(){
    return {
        restrict: 'EA',
        scope: true,
        template: '<input type="text" ng-model="user" class="form-control">'
    };
})

// Isolated scope
// Note: the directive has its own scope
demoModule.directive('profilePanel3', function(){
    return {
        restrict: 'EA',
        scope: {}, 
        template: '<input type="text" ng-model="user" class="form-control">'
    };
})

// Directive with isolated scope and a property in two-way binding
demoModule.directive('profilePanel4', function(){
    return {
        restrict: 'EA',
        scope: {
        	name: '='
        }, 
        template: '<input type="text" ng-model="name" class="form-control">'
    };
})

// Directive with isolated scope and a property in one-way binding
demoModule.directive('profilePanel5', function(){
    return {
        restrict: 'EA',
        scope: {
        	name: '@'
        }, 
        template: '<input type="text" ng-model="name" class="form-control">'
    };
});


demoModule.factory("UserService", function() {
	  var users = ["Peter", "Daniel", "Nina"];

	  return {
	    all: function() {
	      return users;
	    },
	    first: function() {
	      return users[0];
	    }
	  };
	});

demoModule.controller("MyCtrl", function($scope,UserService) {
	  $scope.users = UserService.all();
	});

demoModule.controller("AnotherCtrl", function($scope,UserService) {
	  $scope.firstUser = UserService.first();
	});
demoModule.controller('QuestionsStatusController1', ['$rootScope', '$scope', 'myservice',function ($rootScope, $scope, myservice) {
	$scope.aval = myservice.getVal();  
    
	$scope.$watch(function() {
	    return myservice.getVal()
	}, function(newValue, oldValue) {
		$scope.aval = newValue;
	});
 }]);

demoModule.controller('QuestionsStatusController2',['$rootScope', '$scope', 'myservice',function ($rootScope, $scope, myservice) {
   $scope.$watch('qval', function (newValue, oldValue) {
       if (newValue !== oldValue) {
    	   myservice.setVal(newValue);
       }
   });
 }]);

demoModule.service('myservice', function() {
   this.xxx = "yyy";
   
   this.getVal= function(){
       return this.xxx;
   };  
   
   this.setVal= function(text){
      this.xxx = text;
   }; 
 });

