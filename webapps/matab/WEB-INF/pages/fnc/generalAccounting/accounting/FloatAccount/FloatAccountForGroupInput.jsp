<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%
        String basePath = new UrlPathHelper().getOriginatingRequestUri(request); 
        String fullPath = basePath.toString();
        String comboLoaderFloatAccountGroupnature = basePath + "/combo/loadAllOfFloatAccountGroupNature";
        %>   
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li><span><%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accounting.defineFloatAccountGroup")%></span></li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.save" classNames="uk-button uk-button-success" id="body-heade-saveFloatAccountGroup" onClick="javascript:saveFloatAccountGroup()"/>
		<base:buttonPermission key="fnc.generalAccounting.accountingDocuments.doc.view" classNames="uk-button uk-button-success" id="body-heade-viewFloatAccountGroup" onClick="javascript:goToFloatAccountGroupView()"/>
		
	</div>
</div>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id" >
        <input type="hidden" id="type" name="type" >
        
        <%--<input  id="hasChild" name="hasChild" >--%>
        <input type="hidden" id="parent_id" name="parent_id" >

        <input type="hidden" id="hasChild" name="hasChild" >
        <input type="hidden" id="level" name="level" >
        
        <div class="uk-grid uk-grid-preserve">
            <base:testBox  name="name" styleClass="small" key="fnc.generalAccounting.accounting.name"/>
            <<base:testBox styleClass="midsmall"  name="code" key="fnc.generalAccounting.accounting.code"/>
        </div>
         <div class="uk-grid uk-grid-preserve">
				<base:textArea name="description" key="com.artonis.fnc.generalAccounting.accounting.floatAccountDomain.description"></base:textArea>
		</div>
    </form>
</div>

<script type="text/javascript">
$(document).ready(function() {
  

    function call_back_bindToEntityById(data){

//        $("#title").text(data.title);
        $("#parentTitle").text(data.parentTitle);

    }

    function customSerialize(tmp){
        tmp['parentCode']= $("#parentCode").val();
        return tmp;
    }
  
 });
function handleClick(myRadio) {
    $("#type").val(myRadio.value);
}
 function saveFloatAccountGroup(){
		var data = {};
		data.id=$("#id").val();
		data.name=$("#name").val();
		data.code=$("#code").val();
		data.type=$("#type").val();
		data.parent_id=0;
		data.level=1;
		data.hasChild = 0;
		data.groupNature_id =0;
		data.description=$("#description").val();
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/fnc/generalAccounting/accounting/floatAccount/saveFloatAccountGroup',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(data),
			dataType: 'json',
			type: 'POST',
			//async: true,
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
function goToFloatAccountGroupView(){
	window.location = "${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/floatAccount/";
}
</script>
