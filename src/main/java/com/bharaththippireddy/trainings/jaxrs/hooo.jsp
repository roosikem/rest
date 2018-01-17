<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div ng-controller="UserController as ctrl">
      <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
      <div class="searchCriteriaBox" style="overflow:visible;">
	 	  <div class="criteriabox"><span style="float:left;"><spring:message code="msdssearch.label.searchCriteria" /></span> </div>
	      
	      <div class="searchForm" style="overflow:visible;">
	           <div class="rowOne">
			        <div class="rowOne">
			          <label><spring:message code="msds.label.preparationName" /></label>
			          <input  type="text" placeholder="Enter preparation name" maxlength="500" ng-model="ctrl.user.name"  class="computerInput prepName" required/>
			        	<div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                        </div>
			        </div>
			        <div class="rowOne">
			          <label><spring:message code="msds.label.preparationName" /></label>
			          <input  type="text" placeholder="Enter preparation name" maxlength="500" ng-model="ctrl.user.location"  class="computerInput prepName" required/>
			        </div>
	          </div>
	      </div>
	     
      </div>
       <input type="submit"  class="logINbutton"  value="{{!ctrl.user.pid ? 'Add' : 'Update'}}" ng-disabled="myForm.$invalid"/>
	   <input type="button"  class="logINbutton" ng-click="ctrl.reset()" value='<spring:message code="bvcil.btn.backToSearch" />'/>
	 </form>
</div>
