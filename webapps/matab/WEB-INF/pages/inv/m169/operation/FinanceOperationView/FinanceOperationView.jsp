
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
<%

			  String basePath=request.getAttribute("controllerBasePath").toString();
			  String popUrl=basePath;
			  String  loadEntityUrl=basePath;
%>

<input name="loadedId" type="hidden" id="loadedId" />

<div class="uk-container uk-container-center my-uk-container" style="">
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id">

        <div class="uk-grid uk-grid-preserve">
            <base:comboBoxAutoComplete styleClass="small" name="employee_id"
                                       key="inventory.m169.operation.financeOperationView.personnelCode"
                                       comboLoaderUrl="combo/loadAllEmployee" dataTextField="personnelCode"
                                       dataValueField="id" minLength="0"
                                       hasTemplate="true"
                                       headerTemplateComaSep="inventory.m169.operation.financeOperationView.space"
                                       templateComaSep="personnelCode"/>
            <base:testBox styleClass="small" name="userName"
                          key="inventory.m169.operation.financeOperationView.userName"/>

            <base:option styleClass="verysmall" widthValue="33" styledivLabel="width:10%"
                             absulotePath="inventory/m169/operation/financeOperationView/combo/loadAllOperationTypes"
                             name="operationType" key="inventory.m169.operation.financeOperationView.operationType"
                             checkAllEventMethod="checkAllCustomizeDrugEvent"
                             noneSelectedText='<%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%>'
                             clickEventMethod="clickCustomizeDrugEvent"
                             optgrouptoggleEventMethod="optgrouptoggleCustomizeDrugEvent"
                             unCheckAllEventMethod="unCheckAllCustomizeDrugEvent"/>

        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="rahgiriCode"
                          key="inventory.m169.operation.financeOperationView.rahgiriCode"/>
            <base:comboBox name="state" value="name" key="inventory.m169.operation.financeOperationView.state"
                           comboLoaderUrl="combo/loadAllOperationStates" styleClass="small"/>
            <base:testBox styleClass="verysmall" name="documentNumber"
                          key="inventory.m169.operation.financeOperationView.documentNumber"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
            <base:comboBoxAutoComplete styleClass="small" name="year"
                                       key="inventory.m169.operation.financeOperationView.year"
                                       comboLoaderUrl="combo/loadAllSeasonVatYearName" dataTextField="year"
                                       dataValueField="id" minLength="0"
                                       hasTemplate="true"
                                       headerTemplateComaSep="inventory.m169.operation.financeOperationView.year"
                                       templateComaSep="year"/>
            <base:cascadeComboBox selectIndex="0" styleClass="small" name="season"
                                  key="inventory.m169.operation.financeOperationView.season" cascadeCombo="year"
                                  comboLoaderUrl="combo/loadSeasoNameByYear"/>

        </div>
	  <base:my-grid-search  showMultipleDelete="false" onSelectRow="selectRow" isPopup="true" >
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.operationType' field="operationTypeText" width="30px"/>
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.price' field="price" width="30px" format="0:#,0"/>
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.tax' field="taxFormat" width="30px"/>
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.toll' field="tollFormat" width="30px"/>
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.deductionTax' field="deductionTaxFormat" width="30px"/>
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.totalAmount' field="totalAmountFormat" width="30px"/>
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.state' field="stateText" width="30px"/>
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.documentNumber' field="documentNumber" width="30px"/>
		
	        <base:my-grid-schema-field name="operationTypeText" type="string"/>
	        <base:my-grid-schema-field name="price" type="long"/>
	        <base:my-grid-schema-field name="tax" type="string"/>
	        <base:my-grid-schema-field name="toll" type="string"/>
	        <base:my-grid-schema-field name="deductionTax" type="string"/>
	        <base:my-grid-schema-field name="totalAmount" type="string"/>
	        <base:my-grid-schema-field name="state" type="string"/>
	        <base:my-grid-schema-field name="documentNumber" type="string"/>

            <base:my-grid-function text="inventory.m169.operation.financeOperationView.history" functionClick="grid_onDetail"  name="detail"/>
            <base:my-grid-function text="inventory.m169.operation.financeOperationView.viewItem" functionClick="grid_onVisit"  name="visit"/>
            
		
		</base:my-grid-search>
		
	</form>
		  <div class="uk-grid uk-grid-preserve" align="center">
     <base:testBoxNumericEx styleClass="small" disabled="true" styledivLabel="width:8%" name="sumPrice" key="inventory.m169.operation.financeOperationView.sumPrice"/>
      <base:testBoxNumericEx styleClass="small"  disabled="true" styledivLabel="width:8%" name="sumTax" key="inventory.m169.operation.financeOperationView.sumTax"/>
       <base:testBoxNumericEx styleClass="small" disabled="true" styledivLabel="width:8%" name="sumToll" key="inventory.m169.operation.financeOperationView.sumToll"/>
     </div>   
        <div class="uk-grid uk-grid-preserve" align="center">
       <base:testBoxNumericEx styleClass="small" disabled="true" styledivLabel="width:8%" name="sumDeductionTax" key="inventory.m169.operation.financeOperationView.sumdeductionTax"/>
       <base:testBoxNumericEx styleClass="small"  disabled="true" styledivLabel="width:8%" name="sumTotal" key="inventory.m169.operation.financeOperationView.sumTotal"/>
 
 </div>
	<div style="text-align: center">
  	<base:buttonPopup selectAllOnNotSelected="true"  selectAllOnNotSelectedUrl="/loadIds/" loadEntityUrlByEntityField="realId" smallShow="true" formPopup="ConfirmItem" key="inventory.m169.operation.financeOperationView.confirm" popUrl="item/ConfirmItemTabInput" saveUrl="/save/ConfirmItem" isRelative="true" loadEntityUrl="/loadFinanceOperation/"/>
  	<base:buttonPopup selectAllOnNotSelected="true" selectAllOnNotSelectedUrl="/loadIds/" loadEntityUrlByEntityField="realId" smallShow="true" formPopup="AssignAccountingDocumentItem" key="inventory.m169.operation.financeOperationView.documentAssignment" popUrl="item/AssignAccountingDocumentItemTabInput" saveUrl="/save/AssignAccountingDocumentItem" isRelative="true" loadEntityUrl="/loadFinanceOperation/"/>
  	<base:buttonPermission key="fnc.btn.back" classNames="uk-button uk-button-success" id="backState" onClick="javascript:backState()"/>
  	<base:buttonPopupM169 loadEntityUrlByEntityField="realId"  formPopup="PurchaseOperationItem" key="inventory.m169.operation.financeOperationView.viewItem" popUrl="item/ConfirmItemTabInput" saveUrl="/save/ConfirmItem" isRelative="true" loadEntityUrl="/loadFinanceOperationItems/"/>
 </div>
</div>
<div style="display:inline;" id="modal-detail">
</div>
<base:footer/>
<base:popupGrid gridPopupName="gridDetail" selectGridName="searchGrid" relativePopupUrl="popup/detail" fieldQueryPopup="operationId,operationType" functionValueQueryPopup="searchQueryValueCreator"/>

<script>
       function doAfterSave_ConfirmItem(){
	 		$("#searchGrid").data("kendoGrid").dataSource.read();   
	  }
	    function doAfterSave_AssignAccountingDocumentItem(){
	 		$("#searchGrid").data("kendoGrid").dataSource.read();   
	  }
	   function selectRow(e){
	    var entityGrid = $("#searchGrid").data("kendoGrid");
        var rows = entityGrid.select();
        var rowEntity = [rows.length];
        var selectedItem = entityGrid.dataItem(rows);
        if(selectedItem.state==1){
      	 $('#ConfirmItem_popup_button').attr("disabled", false); 
      	 $('#AssignAccountingDocumentItem_popup_button').attr("disabled", true); 
      	 
      	 }
        else if(selectedItem.state==2){
      	 $('#ConfirmItem_popup_button').attr("disabled", true); 
         $('#AssignAccountingDocumentItem_popup_button').attr("disabled", false); 
          
        }
        else{
         $('#ConfirmItem_popup_button').attr("disabled", true); 
         $('#AssignAccountingDocumentItem_popup_button').attr("disabled", true); 
    
        }
	   }
	   
  function getSearchObject(){
		var financeOperationVar = {};
		financeOperationVar.operationTypes=$("#operationType").val();
		financeOperationVar.rahgiriCode=$("#rahgiriCode").val();
		financeOperationVar.state=$("#state").val();
		financeOperationVar.documentNumber=$("#documentNumber").val();
		financeOperationVar.year=$("#year").val();
		financeOperationVar.season=$("#season").val();
	   	financeOperationVar.employee_id=$("#employee_id").val();
	   	return financeOperationVar;
      }

    function searchQueryValueCreator(row){
        var search=[];
        search[0]=row.realId.split(':')[0];
        search[1]=row.realId.split(':')[1];
        return search;
//        return row.realId.split(':')[0];
    }
    function grid_onDetail(e){
        _searchGrid_popup(e);

    }

       function backState() {
           var rowIds = "";
           var realIds;
           var entityGrid = $("#searchGrid").data("kendoGrid");
           if (entityGrid.select().length != 0) {
               for (var i = 0; i < entityGrid.select().length; i++) {
                   rowIds += entityGrid.dataItem(entityGrid.select()[i]).realId + ",";
               }
                  realIds = rowIds.substring(0, rowIds.length - 1);
               
           }
               else{
               	
                var baseUrl=getBaseUrl();
                 var searchJsonString=getSearchJsonString();
                            $.ajax({
                                url:baseUrl +"/loadIds/" +searchJsonString,
//                                contentType:"application/json; charset=utf-8",
//                                dataType:'json',
                                type:'POST',
                                async:false,
                                success:function (data, success, xhr) {
                                   realIds=data;
                                }

                            });

               }
               $.ajax({
                   url:'${pageContext.request.contextPath}' + '/inventory/m169/operation/financeOperationView/backStateFinanceOperations/' + realIds,
                   contentType:"application/json; charset=utf-8",
                   data:JSON.stringify(rowIds),
                   dataType:'json',
                   type:'POST',
                   success:function (data, success, xhr) {
                       alertify.success(data.message);
                       $("#searchGrid").data("kendoGrid").dataSource.read();
                   }

               });
           }
       

    function doAfterSearch(searchString){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/inventory/m169/operation/financeOperationView/search/sumColumns/' + searchString,
            contentType:"application/json; charset=utf-8",
            dataType:'json',
            type:'POST',
            success:function (data, success, xhr) {
            $("#sumPrice").val(data.sumPrice);
            $("#sumToll").val(data.sumToll);
            $("#sumTax").val(data.sumTax);
            $("#sumDeductionTax").val(data.sumDeductionTax);
            $("#sumTotal").val(data.sumTotal);
            
            setNumericTextValue();
                //fill form
//                alertify.success(data.message);
//                $("#searchGrid").data("kendoGrid").dataSource.read();


            }

        });

    }
    $(document).ready(function(){
     $("#PurchaseOperationItem_popup_button").hide();
    var searchJsonString = "{}";
     doAfterSearch(searchJsonString);
});
       function grid_onVisit(e) {
           var myData = this.dataItem($(e.target).closest("tr"));
           popUpClickM169(myData);
       }
       function doAfterClearAndSearch() {
           var searchJsonString = "{}";
           doAfterSearch(searchJsonString);
       }
</script>
