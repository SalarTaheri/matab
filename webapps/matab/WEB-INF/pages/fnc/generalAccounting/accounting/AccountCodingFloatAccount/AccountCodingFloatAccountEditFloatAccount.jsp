<%@ page import="com.artonis.core.system.authentication.model.GlobalVariable" %>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="base" tagdir="/WEB-INF/tags" %>
<%@page contentType="text/html;charset=UTF-8" %>
<%
    String cancelUrl=request.getHeader("referer");
//    String context=pageContext.getRequest().contextPath();
    String context="";
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
    String fullPath = basePath.toString();

    if (basePath.indexOf("/create") > -1) {
        basePath = basePath.substring(0, basePath.indexOf("/create"));
    } else if (basePath.indexOf("/edit") > -1) {
        basePath = basePath.substring(0, basePath.indexOf("/edit"));
    }
    String comboLoaderAccount = basePath + "/combo/loadAllAccountCoding";
    String comboLoaderFloatAccount = basePath + "/combo/loadAllFloatAccount";
//    String gridRead=basePath+"/grid-read";
//    request.setAttribute("basePath",basePath);
    String gridRead = basePath + "/grid-read/floatAccount" + fullPath.substring(fullPath.lastIndexOf("/"));

%>

<base:pageHeader/>
<base:pageInputHeader/>
<c:url value='<%=basePath%>' var="transportReadUrl"/>
<div class="uk-container uk-container-center my-uk-container">

    <form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id">

        <input type="hidden" id="floatDetailAccount_id" name="floatDetailAccount_id">
        <input type="hidden" id="parent_id" name="parent_id">

        <div class="uk-grid uk-grid-preserve" style="margin-bottom: 5px">
			<base:textBoxDisable  styleClass="small" name="floatAccountName" key="fnc.generalAccounting.accounting.detail.float" disabled="true" divStyle="width: 15%"/>

            <base:comboBoxAutoComplete-buttonAddToCombo name="account_id" key="fnc.generalAccounting.accounting.accountCoding.name"  popupUrlIsRelative="true"
                                       comboLoaderUrl="<%=comboLoaderAccount%>" dataTextField="nameCode"
                                       dataValueField="id" minLength="0"
                                       hasTemplate="true"
                                       headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                                       templateComaSep="name,code" popupUrl="/popup/treeAccountCoding" style="width: 35%"/>

			<base:comboBox  name="level" key="fnc.generalAccounting.accounting.level" comboLoaderUrl="combo/loadAllLevel" isListConstant="true" styleClass="verysmall"/>
        </div>
    </form>

    <div style=" width: 100%; height: 100%;">
        <base:my-grid name="grid" transportReadUrl="<%=gridRead%>" selectable="single" isPopup="true">
            <base:my-grid-column title='fnc.generalAccounting.accounting.account.name' field="accountName" width="50px"/>
            <base:my-grid-column title='fnc.generalAccounting.accounting.account.code' field="accountCode" width="50px"/>
            <base:my-grid-column title='fnc.generalAccounting.accounting.float.name' field="floatAccountName" width="50px"/>
            <base:my-grid-column title='fnc.generalAccounting.accounting.float.code' field="floatAccountCode" width="50px"/>
            <base:my-grid-column title='fnc.generalAccounting.accounting.level' field="level" width="50px"/>
            <base:my-grid-column title='fnc.generalAccounting.accounting.loading' field="loadingStr" width="50px"/>
            <base:my-grid-function text="action.delete" functionClick="gridOnDeleteRels" name="delete"/>

            <base:my-grid-schema-field name="accountName" type="string"/>
            <base:my-grid-schema-field name="accountCode" type="string"/>
            <base:my-grid-schema-field name="floatAccountName" type="string"/>
            <base:my-grid-schema-field name="floatAccountCode" type="string"/>
            <base:my-grid-schema-field name="level" type="string"/>
            <base:my-grid-schema-field name="loadingStr" type="string"/>
        </base:my-grid>
    </div>
    
</div>

<script>
    $(document).ready(function () {
        setTailEndUrl('floatAccount/');
    });

    function callback_deserialize(){
        var url=cancelUrlSurvey();
        $("#breadcrumb-main-section-cancel").attr("href", url);
    }

    function callback_saveClose(){

        var url=cancelUrlSurvey();
        window.location.href = url;
    }

    function callback_save_success() {
        $("#account_id").val('');
        $("#level").val('');
        $("#grid").data("kendoGrid").dataSource.read();
    }

    function cancelUrlSurvey(){
        <%--var cancelUrl = "<%=cancelUrl%>";--%>
        var cancelUrl = '';
        var context = "${pageContext.request.contextPath}";
//        if(cancelUrl.indexOf('login')>-1 ||cancelUrl.indexOf('null')>-1){
            cancelUrl=context+'/fnc/generalAccounting/accounting/floatAccount/edit/floatAccount/'+$("#parent_id").val();
//        }
        return cancelUrl;
    }
    function gridOnDeleteRels(e){
      	var data = this.dataItem($(e.target).closest("tr"));
        alertify.confirm('ARE U SURE?', function (e) {
		    if (e) {
		        jQuery.ajax ({
				    url: "${pageContext.request.contextPath}"+"/fnc/generalAccounting/accounting/accountCodingFloatAccount/floatAccount/remove/" + data.id,
				    type: "POST",
				    data: JSON.stringify({id: data.id}),
				    dataType: "json",
				    contentType: "application/json; charset=utf-8",
				    success: function(result){
				        if(result.state == "success"){
				        	$("#grid").data("kendoGrid").dataSource.read();
			        		alertify.success(result.message);
				        }else if(result.state == "error"){
				        	for(var i=0; i<result.errors.length; i++){
				        		alertify.error($("label[for='"+ result.errors[i].Field + "']").text()  + ":  " +  result.errors[i].Message);
				        	}
				        }else{
				        	lertify.error("Something is not good! O_o");
				        }
				        
				    },
                    error:function(result){
                        if(result.status==401){
                            window.location.href="";
                        }
                    }
				});
		    }
		});
    }

</script>