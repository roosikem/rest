<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div ng-controller="StudentController as ctrl">
 <div class="searchCriteriaBox" style="overflow:visible;">
	 	  <div class="criteriabox"><span style="float:left;"><spring:message code="msdssearch.label.searchCriteria" /></span> </div>
	      <div class="searchForm" style="overflow:visible;">
	           <div class="rowOne">
			          <label><spring:message code="msds.label.productName" /></label>
			         <!--  <input type="text" placeholder="Enter chemical product name" maxlength="100" ng-model="msdsSearchCriteria.chemicalProductName" class="computerInput" /> -->
			         <div placeholder="Search Product Name" angucomplete-alt id="ex1" maxlength="100" style="float:left;width:50%;" pause="100" selected-object="setCheProductName" remote-url="${pageContext.request.contextPath}/cd/mc/getUsersNames?cheName="
			              remote-url-data-field="msdsListJson" title-field="name" minlength="1" input-class="computerInput" match-class="highlight">
			          </div>
	          </div>
	      </div>
</div>

<div class="searchCriteriaBox" >
	 	        <br>
               <!--Upload History-->
                 <table border="0" width="100%" cellpadding="0" cellspacing="0" class="chemicalTableContent">
                  <thead>
                    <tr class="tableHeader">
                      <th class="tableHeader"><spring:message code="msds.label.fileName" /></th>
                      <th class="tableHeader"><spring:message code="msds.label.fileSize" /></th>
                      <th class="tableHeader"><spring:message code="msds.label.fileStatus" /></th>
                      <th class="tableHeader"><spring:message code="msds.label.fileStatus" /></th>
                    </tr>
                  </thead>
                  
                  <tbody>
                    <tr ng-repeat="u in ctrl.users" class="chemicalSupplier">
                    
                    <td><span ng-bind="u.pid"></span></td>
                    <td><span ng-bind="u.name"></span></td>
                    <td><span ng-bind="u.location"></span></td>
                     <td align="left">
                        <a class="btn btn-danger btn-xs" href="#/home/{{u.pid}}"> Edit </a>
                        <button type="button" class="btn btn-danger btn-xs" ng-click="ctrl.remove(u.pid)"> Remove </button>
                     </td>
                    
	 		     </tbody> 
                </table>
	  </div>
</div>
