<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
        String basePath = request.getAttribute("controllerBasePath").toString();
%>

<base:pageHeader/>

<div id="modal-copyItem" style="display: inline;">
</div>

<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
		<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeServiceAmount.employee_id'  field="employeeFullName" width="50px"/>
		<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeServiceAmount.fromDate'  field="fromDate" width="40px"/>
		<base:my-grid-column title='com.artonis.clinic.basicInfo.employeeServiceAmount.toDate'  field="toDate" width="30px"/>
		
		<base:my-grid-function  name="employeeContractCopy" styleClass="uk-button-primary" functionClick="grid_copyItem"
					text="com.artonis.clinic.basicInfo.employeeServiceAmount.copyItem"/>
</base:my-grid>
	
<base:footer/>

<script type="text/javascript">
function grid_copyItem(e){
	var data = this.dataItem($(e.target).closest("tr"));
	var esa_id = data.id;
    if (e) {
		var modal ;
	    $(function() {
            var popUpUrl = '<%=basePath%>' + "/popup/copyEmployeeServiceAmount";
            $.get(popUpUrl , function (data) {
                $("#modal-copyItem").empty();
                var id = "modal-copyItem_popup";
                $("#modal-copyItem").append('<div id="' + id + '" class="uk-modal" data-employeeServiceAmountId="' + esa_id + '">');
                $("#" + id).append(data);
                modal = new $.UIkit.modal.Modal("#" + id);
                $("#" + id).on(
                    {
                        'uk.modal.hide':function () {
                            $("#modal-copyItem").empty();
                        }
                    }
                );
                modal.show();
            });
	    });
    }
}
</script>
