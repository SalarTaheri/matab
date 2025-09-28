
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
             <base:comboBoxAutoComplete styleClass="midsmall" name="serviceGoodsName" styledivLabel="width:8.5%"
                                       key="inventory.m169.operation.financeReportsView.serviceGoodsName"
                                       comboLoaderUrl="combo/loadAllServiceGoods" dataTextField="name"
                                       dataValueField="id" minLength="0"
                                       hasTemplate="true"
                                       headerTemplateComaSep="inventory.m169.operation.financeReportsView.serviceGoodsName"
                                       templateComaSep="name"/>
            <base:comboBoxAutoComplete styleClass="midsmall" name="serviceGoodsCode" styledivLabel="width:10.5%"
                                       key="inventory.m169.operation.financeReportsView.serviceGoodsCode"
                                       comboLoaderUrl="combo/loadAllServiceGoods" dataTextField="code"
                                       dataValueField="id" minLength="0"
                                       hasTemplate="true"
                                       headerTemplateComaSep="inventory.m169.operation.financeReportsView.serviceGoodsCode"
                                       templateComaSep="code"/>
             <div class="uk-grid uk-grid-preserve">
                 <base:comboBox styleClass="midsmall" name="personType" isListConstant="true"
                           key="com.artonis.inv.m169.basicInfo.person.type" comboLoaderUrl="combo/loadAllPersonType" />
             </div>
             <div class="uk-grid uk-grid-preserve">
                 <base:comboBox styleClass="midsmall" name="personTitle"  isListConstant="true"
                           key="com.artonis.inv.m169.basicInfo.person.title" comboLoaderUrl="combo/loadAllPersonTitle" />
                 <base:comboBoxAutoComplete styleClass="midsmall" name="personName"
                                       key="inventory.m169.operation.financeReportsView.personName"
                                       comboLoaderUrl="combo/loadAllPersonName" dataTextField="name"
                                       dataValueField="id" minLength="0"
                                       hasTemplate="true"
                                       headerTemplateComaSep="inventory.m169.operation.financeReportsView.personName"
                                       templateComaSep="name"/>
                <base:testBox styleClass="midsmall" name="economicNo" key="com.artonis.inv.m169.basicInfo.person.economicNo"/>
             </div>
             <div class="uk-grid uk-grid-preserve">
               <base:testBox styleClass="midsmall" name="nationalCode" key="com.artonis.inv.m169.basicInfo.person.nationalCode"/>
               <base:testBox styleClass="midsmall" name="documentNumber" key="inventory.m169.operation.financeOperationView.documentNumber"/>
               <base:testBox styleClass="midsmall" name="rahgiriCode" key="inventory.m169.operation.financeOperationView.rahgiriCode"/>
                 </div>
             <div class="uk-grid uk-grid-preserve">
               <base:comboBox styleClass="midsmall"  name="citizenship" isListConstant="true"
                           key="com.artonis.inv.m169.basicInfo.person.citizenship" comboLoaderUrl="combo/loadAllPersonCitizenship" />
               <base:cascadeComboBox styleClass="midsmall"  name="countryId" cascadeCombo="citizenship"
                           key="com.artonis.inv.m169.basicInfo.person.country" comboLoaderUrl="combo/loadCountry" />
			   <base:cascadeComboBox styleClass="midsmall" name="provinceId"   cascadeCombo="countryId"
                           key="com.artonis.inv.m169.basicInfo.person.state" selectIndex="0" comboLoaderUrl="combo/loadProvince" />
               <base:cascadeComboBox styleClass="midsmall" name="cityId" isListConstant="true" cascadeCombo="provinceId"
                           key="com.artonis.inv.m169.basicInfo.person.city" comboLoaderUrl="combo/loadCity" />
              </div>
                <div class="uk-grid uk-grid-preserve">
             <base:comboBox name="state" value="name" key="inventory.m169.operation.financeOperationView.state"
                           comboLoaderUrl="combo/loadAllOperationStates" styleClass="midsmall"/>
            <base:testBox styleClass="midsmall" name="phoneNo" key="com.artonis.inv.m169.basicInfo.person.phoneNo"/>
              </div>
              <div class="uk-grid uk-grid-preserve">
               	 <base:testBox styleClass="midsmall" name="fromPrice" key="inventory.m169.operation.financeReportsView.fromPrice"/>
               	 <base:testBox styleClass="midsmall" name="toPrice" key="inventory.m169.operation.financeReportsView.toPrice"/>
               	 <base:testBox styleClass="midsmall" name="fromTax" key="inventory.m169.operation.financeReportsView.fromTax"/>
               	 <base:testBox styleClass="midsmall" name="toTax" key="inventory.m169.operation.financeReportsView.toTax"/>
               </div>
             <div class="uk-grid uk-grid-preserve">
                 <base:testBox styleClass="midsmall" name="fromToll" key="inventory.m169.operation.financeReportsView.fromToll"/>
                 <base:testBox styleClass="midsmall" name="toToll" key="inventory.m169.operation.financeReportsView.toToll"/>
                 <base:testBox styleClass="midsmall" name="fromTaxDeduction" key="inventory.m169.operation.financeReportsView.fromTaxDeduction"/>
                 <base:testBox styleClass="midsmall" name="toTaxDeduction" key="inventory.m169.operation.financeReportsView.toTaxDeduction"/>
               </div>
            <div class="uk-grid uk-grid-preserve">
                <base:mDatePicker styleClass="midsmall" name="startDate" key="com.artonis.inv.m169.operation.purchaseContractOperation.startdate"></base:mDatePicker>
				<base:mDatePicker styleClass="midsmall" name="finishDate" key="com.artonis.inv.m169.operation.purchaseContractOperation.endDate"></base:mDatePicker>
				<base:comboBox name="type" styleClass="midsmall" comboLoaderUrl="combo/loadAllContractType" key="inventory.m169.basicInfo.contract.type" />
                <base:option widthValue="20" styledivLabel="width:10%" styleClass="small" styledivSelect="width:15%"
                             absulotePath="inventory/m169/operation/financeOperationView/combo/loadAllOperationTypes"
                             name="operationType" key="inventory.m169.operation.financeOperationView.operationType"
                             checkAllEventMethod="checkAllCustomizeDrugEvent"
                             noneSelectedText='<%=ResourceBoundleHolder.resourceBundle.getString("system.combo.pleaseSelect")%>'
                             clickEventMethod="clickCustomizeDrugEvent"
                             optgrouptoggleEventMethod="optgrouptoggleCustomizeDrugEvent"
                             unCheckAllEventMethod="unCheckAllCustomizeDrugEvent"/>
   
          </div>
	       <base:my-grid-search  showMultipleDelete="false" onSelectRow="selectRow" isPopup="true" showOperation="false" >
			<base:my-grid-column title='inventory.m169.operation.financeReportsView.personName' field="person_fullName" width="30px"/>
			<base:my-grid-column title='com.artonis.inv.m169.basicInfo.person.economicNo' field="economic_no" width="30px"/>
			<base:my-grid-column title='com.artonis.inv.m169.basicInfo.person.nationalCode' field="nationalcode" width="30px"/>
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.price' field="price" width="30px" format="0:#,0"/>
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.tax' field="taxFormat" width="30px" />
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.toll' field="tollFormat" width="30px" />
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.deductionTax' field="deductionTaxFormat" width="30px" format="0:#,0"/>
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.totalAmount' field="totalAmountFormat" width="30px" format="0:#,0"/>
			<base:my-grid-column title='inventory.m169.operation.financeOperationView.state' field="stateText" width="30px"/>
		
	        <base:my-grid-schema-field name="person_fullName" type="string"/>
	        <base:my-grid-schema-field name="economic_no" type="string"/>
	        <base:my-grid-schema-field name="nationalcode" type="string"/>
	        <base:my-grid-schema-field name="price" type="long"/>
	        <base:my-grid-schema-field name="tax" type="string"/>
	        <base:my-grid-schema-field name="toll" type="string"/>
	        <base:my-grid-schema-field name="deductionTax" type="string"/>
	        <base:my-grid-schema-field name="totalAmount" type="string"/>
	        <base:my-grid-schema-field name="state" type="string"/>
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
</div>
<base:footer/>
<script>
  function getSearchObject(){
		var financeReportsVar = {};
		financeReportsVar.serviceGoodsName=$("#serviceGoodsName").val();
		financeReportsVar.serviceGoodsName=$("#serviceGoodsName").val();
		financeReportsVar.personType=$("#personType").val();
		financeReportsVar.personTitle=$("#personTitle").val();
		financeReportsVar.person_id=$("#personName").val();
		financeReportsVar.citizenship=$("#citizenship").val();
		financeReportsVar.economic_no=$("#economicNo").val();
		financeReportsVar.nationalcode=$("#nationalCode").val();
		financeReportsVar.country_id=$("#countryId").val();
		financeReportsVar.province_id=$("#provinceId").val();
		financeReportsVar.city_id=$("#cityId").val();
		financeReportsVar.fromPrice=$("#fromPrice").val();
		financeReportsVar.toPrice=$("#toPrice").val();
		financeReportsVar.fromTax=$("#personName").val();
		financeReportsVar.toTax=$("#toTax").val();
		financeReportsVar.fromToll=$("#fromToll").val();
		financeReportsVar.toToll=$("#toToll").val();
		financeReportsVar.fromTaxDeduction=$("#fromTaxDeduction").val();
		financeReportsVar.toTaxDeduction=$("#toTaxDeduction").val();
		financeReportsVar.phoneno=$("#phoneNo").val();
		financeReportsVar.startDate=$("#startDate").val();
		financeReportsVar.finishDate=$("#finishDate").val();
		financeReportsVar.operationTypes=$("#operationType").val();	
		financeReportsVar.documentNumber=$("#documentNumber").val();
		financeReportsVar.rahgiriCode=$("#rahgiriCode").val();
		financeReportsVar.state=$("#state").val();
	   	return financeReportsVar;
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

    function doAfterSearch(searchString){
        $.ajax({
            url:'${pageContext.request.contextPath}' + '/inventory/m169/operation/financeReportsView/search/sumColumns/' + searchString,
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
    var searchJsonString = "{}";
     doAfterSearch(searchJsonString);
});
       function doAfterClearAndSearch() {
           var searchJsonString = "{}";
           doAfterSearch(searchJsonString);
       }
       function callback_change_citizenship(e){
     if(document.getElementsByName('citizenship')[0].value ==1){
         $("#countryId_Comb").data("kendoComboBox").enable(false);
         /*if($("div").children("ul#countryId_Comb_listbox").children().length == 0) {
         	var url = getBaseUrl() + "combo/loadCountry/";
			$.getJSON(url, function (data) {
				alert(data.country);
				$("#countryId").val(data);
			});
         }*/
         $("#countryId").val(1);
         $("#countryId_Comb").data("kendoComboBox").value(1);
         $("#foreignPersonNumber").prop("disabled", true);
         $("#foreignPersonNumber").css('background-color','rgb(206, 215, 235)');
         $("#nationalCode").prop("disabled", false);
		 $("#nationalCode").css('background-color',''); 
     }
     else if(document.getElementsByName('citizenship')[0].value ==2){
     	$("#countryId").val(2);
         $("#countryId_Comb").data("kendoComboBox").value(2);
         $("#countryId_Comb").data("kendoComboBox").enable(false);
         $("#provinceId_Comb").data("kendoComboBox").enable(false);
         $("#cityId_Comb").data("kendoComboBox").enable(true);
         $("#foreignPersonNumber").prop("disabled", false);
         $("#foreignPersonNumber").css('background-color','');
         $("#economicNo").prop("disabled", true);
		 $("#economicNo").css('background-color','rgb(206, 215, 235)');
		 $("#nationalCode").prop("disabled", true);
		 $("#nationalCode").css('background-color','rgb(206, 215, 235)');
     }
}
</script>
