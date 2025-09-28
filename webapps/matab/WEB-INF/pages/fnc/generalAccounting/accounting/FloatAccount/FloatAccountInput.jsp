<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id" >
        <input type="hidden" id="parent_id" name="parent_id" >
        <input type="hidden" id="groupNature_id" name="groupNature_id" >
        <input type="hidden" id="hasChild" name="hasChild" >
        <input type="hidden" id="level" name="level" >
        <%if(request.getAttribute("type")!=null && request.getAttribute("type").toString().equals("0")) {%>
	       	<div class="uk-grid uk-grid-preserve">
	      		<base:testBox styleClass="normal" name="parentTitle" key="com.artonis.fnc.generalAccounting.accounting.floatAccountDomain.parentFloat" disabled="true"/>
	      	</div>
      
        <div class="uk-grid uk-grid-preserve">
            <input type="hidden" id="type" name="type" >
            <base:testBox  name="name" styleClass="small" key="fnc.generalAccounting.accounting.name"/>
            <base:testBox  name="code" styleClass="midsmall" key="fnc.generalAccounting.accounting.code"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
        </div>
        </div>
     <%} %>
       <% if(request.getAttribute("type")!=null && (
    		    request.getAttribute("type").toString().equals("1") || request.getAttribute("type").toString().equals("2") ||
    		  	request.getAttribute("type").toString().equals("3"))) {%>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox  name="name" key="fnc.generalAccounting.accounting.costCenter.name"/>
            <base:testBox  name="code" styleClass="midsmall" key="fnc.generalAccounting.accounting.code"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
        </div>
         <div class="uk-grid uk-grid-preserve">
        <base:comboBox  name="type"  key="fnc.generalAccounting.accounting.costCenter.type" comboLoaderUrl="/combo/loadAllcostCenterTypes" styleClass="small" />
        </div>
     </div>
     <%} %> 
 </form>

<script type="text/javascript">
    function call_back_bindToEntityById(data){
        $("#parentTitle").text(data.parentTitle);
    }

    function customSerialize(tmp){
        tmp['parentCode']= $("#parentCode").val();
        return tmp;
    }
    function callback_DataBound_type(tmp){
    	 if((document.getElementsByName('type') !=null) &&( document.getElementsByName('type')[0].value ==2
    	 || document.getElementsByName('type')[0].value ==3)
     	)
     		$("#type_Comb").data("kendoComboBox").enable(false);
    }
   function saveRelatedFloatAccountGrp(){
		var data = {};
		data.floatAccountId=$("#id").val();
		data.floatAccountGroupId=$("#floatAccountGroupId").val();
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/fnc/generalAccounting/accounting/floatAccount/saveRelatedFloatAccountGroup',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(data),
			dataType: 'json',
			type: 'POST',
			success: function (data) {
                if (data.state == "error") {
                    for (var i = 0; i < data.errors.length; i++) {
                        if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + data.errors[i].Field + "']").text() + ":  " + data.errors[i].Message);
                        } else {
                            alertify.error(data.errors[i].Field + ":  " + data.errors[i].Message);
                        }
                    }
                }else{
					alertify.success(data.message);
	                document.getElementById("loadedId").value = data.baseObjectId;
                }
			},
			error: function (e) {
				alert('Error: ' + e.responseText);
			}
		});
   }
</script>
