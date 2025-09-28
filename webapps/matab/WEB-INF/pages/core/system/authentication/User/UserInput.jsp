<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%--<base:my-grid-column title='hrm.employee.firstName'  field="firstName" width="100px"/>
<base:my-grid-column title='hrm.employee.lastName'  field="lastName" width="100px"/>
<base:my-grid-column title='hrm.employee.personnleCode'  field="personnelCode" width="100px"/>
<base:my-grid-column title='login.userName'  field="userName" width="100px"/>
<base:my-grid-column title='login.password'  field="password" width="100px"/>
<base:my-grid-column title='login.active'  field="active" width="100px"/>--%>

<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id" >
        <div class="uk-grid uk-grid-preserve">
            <base:suggestMatab styleClass="small" name="employee_id" key="hrm.employee.select" onSelect="callNoOp()"
            			  suggestLoaderController="suggest/loadAllEmployee"
                          fieldNames="id,firstName,lastName,personnelCode" 
                          tagNames="employee_id,firstName,lastName,personnelCode"/>
            <base:testBox styleClass="small" name="firstName" key="hrm.employee.firstName" disabled="true"/>
            <base:testBox styleClass="small" name="lastName" key="hrm.employee.lastName" disabled="true"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="personnelCode" key="hrm.employee.personnleCode" disabled="true"/>
            <base:testBox styleClass="small" name="userName" key="login.userName"/>
            <base:checkbox styleClass="small" name="fullScreenMode" key="login.fullScreenMode"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
           <base:passwordBox name="password" key="login.password" styleClass="small"/>
           <base:passwordBox name="confirmPassword" key="login.confirmPassword" styleClass="small"/>
           <base:checkbox styleClass="small" name="active" key="login.active"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
           <base:testBox styleClass="larg" name="defaultPageController" key="system.authentication.user.defaultPage"/>
        </div>
    </form>
    <base:itemForm titleKeys="system.authentication.role,system.authentication.department" 
    				formItemTabViewJspFiles="UserRoleTabView.jsp,UserDepartmentTabView.jsp" 
    				formItemTabInputs="UserRoleTabInput,UserDepartmentTabInput" 
    				masterIdStr="user_id"/>
</div>
<script language="JavaScript" type="text/javascript">
	$("#password").keypress(function() {
  		$("#confirmPassword").css({
          'font' : 'inherit',
          'background-color' : 'red',
    	  'text-align' : 'inherit',
          'outline' : 'inherit',
          'cursor' : 'inherit'
       });
	});
	$("#confirmPassword").keyup(function() {
  		if($("#password").val()==$("#confirmPassword").val()){
	  		$("#confirmPassword").css({
	          'font' : 'inherit',
	          'background-color' : 'white',
	    	  'text-align' : 'inherit',
	          'outline' : 'inherit',
	          'cursor' : 'inherit'
	       });
  		}else{
  			  $("#confirmPassword").css({
	          'font' : 'inherit',
	          'background-color' : 'red',
	    	  'text-align' : 'inherit',
	          'outline' : 'inherit',
	          'cursor' : 'inherit'
	       });
  		}
	});
	
	
    function setVal() {}
    
</script>