<%@ page import="com.artonis.core.base.utilClass.ResourceBoundleHolder" %>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<script>
	function _popupServiceItemGrid_onEdit(e){
        var data = this.dataItem($(e.target).closest("tr"));
        $("#popupServiceItemId").val(data.id);
        $("#popupServiceName").val(data.name);
        $("#popupServiceCost").val(data.cost);
        setNumericTextValue();
	}
	//
	function _popupServiceItemGrid_onDelete(e){
        var data = this.dataItem($(e.target).closest("tr"));
        var areUShure = "<%=ResourceBoundleHolder.resourceBundle.getString("action.alert.areYouSure.delete")%>";
        alertify.confirm(areUShure, function (e) {
            if (e) {
                jQuery.ajax({
                    url: basePath + "removePopupServiceItem",
                    type: "POST",
                    data: JSON.stringify({id: data.id}),
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (result) {
                        if (result.state == "success") {
                            $('#popupServiceItemGrid').data('kendoGrid').dataSource.read();
                            alertify.success(result.message);
                        } else {
                            for (var i = 0; i < result.errors.length; i++) {
                                alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
                            }
                        }
                    }
                });
            }
        });
    }
    //
	function _popupServiceItemGrid_requestEnd(e){
	}
</script>

<form class="uk-form" id="form-popup">
	<input type="hidden" id="popupServiceItemId"/>
	<div class="uk-grid uk-grid-preserve popupServiceItem">
		<base:testBox styleClass="small" name="popupServiceName" key="com.artonis.clinic.basicInfo.clinicConfiguration.service.service"/>
		<base:testBoxNumericEx styleClass="small" name="popupServiceCost" key="com.artonis.clinic.basicInfo.clinicConfiguration.service.price"/>
	</div>
	<div align="center" style="margin-top: 10px;">
		<base:button id="saveServiceItem" key="global.crud.save"/>
	</div>
	<div style="margin-top: 10px;">
		<base:my-grid name="popupServiceItemGrid" transportReadUrl="${basePath}/popupServiceItemGridRead" showToolbar="false" groupable="false">
			<base:my-grid-column title='com.artonis.clinic.basicInfo.clinicConfiguration.service.service' field="service_name" width="50px"/>
			<base:my-grid-column title='com.artonis.clinic.basicInfo.clinicConfiguration.service.price' field="totalCost" width="50px"/>
		</base:my-grid>
	</div>
</form>

<script type="text/javascript">
	$(".ui-dialog-title").text("تعریف خدمت");
	$(".my-popup-footer .uk-button-success").remove();
	$(".my-popup-footer .uk-button").text("خروج");
	//
	$("#saveServiceItem").click(function(){
		var tmp = {};
		tmp.serviceItemCostId = $("#popupServiceItemId").val();
		tmp.service_name = $("#popupServiceName").val();
		tmp.cost = $("#popupServiceCost").val();

		jQuery.ajax({
			url: getBaseUrl() + "popupServiceItem/save",
			type: "POST",
			data: JSON.stringify(tmp),
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function (result) {
				if (result.state == "error") {
					for (var i = 0; i < result.errors.length; i++) {
                        if (result.errors[i].Field == "name") {
                            result.errors[i].Field = "popupServiceName";
                        }
                        if (result.errors[i].Field == "cost") {
                            result.errors[i].Field = "popupServiceCost";
                        }
						if ($("label[for='" + result.errors[i].Field + "']").text().length > 0) {
							alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
						} else {
							alertify.error(result.errors[i].Field + ":  " + result.errors[i].Message);
						}
					}
				}
				if (result.state == "success") {
					alertify.success(result.message);
					$('#popupServiceItemGrid').data('kendoGrid').dataSource.read();
					resetPopupServiceItemFields();
					//
					$("#serviceItemId_Comb").data("kendoComboBox").dataSource.read(); // for refresh ServiceItem comboBox in ServiceCostPartView tab
					$('#serviceGrid').data('kendoGrid').dataSource.read(); // for refresh ServiceG Grid in ServiceCostPartView tab
				}
			}
		});
	});
	//
	function resetPopupServiceItemFields() {
		$(".popupServiceItem input").val('');
	}
</script>

<style>
	#popupServiceItemGrid .k-button{
		color: white;
	}
</style>