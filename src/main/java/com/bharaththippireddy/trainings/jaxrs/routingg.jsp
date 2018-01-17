<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Environmental Emission Evaluator - Search Chemical Inventory List</title>
<%@include file="../common.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/angucomplete-alt.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/jquery.datepick.css" />

<script src="${pageContext.request.contextPath}/resources/js/lib/angular-touch.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/lib/angucomplete-alt.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.26/angular-route.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/angular-resource/1.2.27/angular-resource.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/demo/routing.js"></script>

<style type="text/css">
	   .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }
 
      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
 
    </style>
	
</head>


<body ng-app="demoModule">
<jsp:include page="../header.jsp"/>

<script>
	$(document).ready(function(){
		$("li[id^=parentMenu_]").hover(function(){
			$("select").blur();
		});
		
	});
</script>

<div class="navigationSection">
	<div class="wrapperContiner">
		<div id="cssmenu">
		 <ul style="z-index: 99999999;">
			 	<li id="parentMenu_1" class="has-sub">
			 		<a href="#/home">Home</a>
			 	</li>
			 	
			 	<li id="parentMenu_1" class="has-sub">
			 		<a href="#/viewStudents">PRSL</a>
			 	</li>
		 </ul> 
		</div> 
		
	</div>
</div>

<div class="wrapperContiner" >
  <div class="midContainer"> 
 	 <ng-view></ng-view>
 	 
 	 
	 
    <!-- <div class="generic-container" >
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">User Registration Form </span></div>
              <div class="formcontainer">
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      <input type="hidden" ng-model="ctrl.user.pid" />
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="uname">Name</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.name" id="uname" class="username form-control input-sm" placeholder="Enter your name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                         
                       
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="address">Address</label>
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.location" id="address" class="form-control input-sm" placeholder="Enter your Address. [This field is validation free]"/>
                              </div>
                          </div>
                      </div>
 
                      <div class="row">
                          <div class="form-actions floatRight">
                              <input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>
              </div>
          </div>
          <div class="panel panel-default">
                Default panel contents
              <div class="panel-heading"><span class="lead">List of Users </span></div>
              <div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>ID.</th>
                              <th>Name</th>
                              <th>Address</th>
                              <th>Action</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.users">
                              <td><span ng-bind="u.pid"></span></td>
                              <td><span ng-bind="u.name"></span></td>
                              <td><span ng-bind="u.location"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(u.pid)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div> -->
 	 

</div>
</div>

<script type="text/javascript">

	
</script>
</body>
</html>
