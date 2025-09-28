<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%--<%@taglib prefix="kendo" uri="/kendo-taglibs.tld"%>--%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
        //String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
        String basePath=request.getAttribute("controllerBasePath").toString();
        String fullPath = basePath.toString();
        String comboLoaderFloatAccount = basePath + "/combo/loadAllFloatAccount";
%>

   <form class="uk-form2-ReceiptBillPayerItem" >
   		<input type="hidden" id="id" name="id" >
   		<div class="uk-grid uk-grid-preserve">
   			<base:comboBox name="businessPartnerType"  value="name" key="com.artonis.fnc.treasury.receipt.receiptBillPayer.businessPartnerType" comboLoaderUrl="combo/loadAllBusinessPartnerTypes" styleClass="verysmall" />
  
   		</div>
   		<div class="uk-grid uk-grid-preserve" id="floatAccountDiv">
   			<base:comboBoxAutoComplete-buttonAddToCombo name="floatAccount_id" styleClass="small"  key="com.artonis.fnc.treasury.receipt.receiptBillPayer.businessPartner"  popupUrlIsRelative="true"
	               comboLoaderUrl="<%=comboLoaderFloatAccount%>" dataTextField="nameCode" iscomboLoaderUrlRelative="false"
	               dataValueField="id" minLength="0" 
	               hasTemplate="true"
	               headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
	               templateComaSep="name,code" popupUrl="/popup/treeFloatAccount"/>
   		</div>
			<base:accountAndFloatAccountPicker accountCodingFieldName="payerAccountCoding_Id"
					floatAccount1FieldName="payerFloatAccountLevel1_Id" floatAccount2FieldName="payerFloatAccountLevel2_Id"
					floatAccount3FieldName="payerFloatAccountLevel3_Id" floatAccount4FieldName="payerFloatAccountLevel4_Id"
					accountCodingFieldKey="com.artonis.fnc.treasury.receipt.receiptBillPayer.payerAccountCoding_Id"  />
	<div class="uk-grid uk-grid-preserve">
	     <base:testBoxNumericEx styleClass="small" name="payerPrice" key="com.artonis.fnc.treasury.receipt.receiptBillPayer.payerPrice"/>
    </div>
	<div class="uk-grid uk-grid-preserve">
	     <base:textArea  name="payerDescription" key="com.artonis.fnc.treasury.receipt.receiptBillPayer.payerDescription" height="25"/>
	</div>
	</form>
<script type="text/javascript">
 function callback_change_businessPartnerType(e){
	 showHideBusinessPartner();
 }
 function showHideBusinessPartner(){
	 if(document.getElementsByName('businessPartnerType') !=null && document.getElementsByName('businessPartnerType')[0].value ==1){
		 $("#floatAccountDiv").show(600);
	 }
	 else{
		 $("#floatAccountDiv").hide(600);
			$.ajax({
				url: '${pageContext.request.contextPath}'+'/fnc/treasury/receipt/receiptBill/combo/loadAllAccount',
				contentType: "application/json; charset=utf-8",
				dataType: 'json',
				type: 'GET',
				//async: true,
				success: function (data) {
					$("#payerAccountCoding_Id_Comb").data("kendoComboBox").value("");
					$("#payerAccountCoding_Id_Comb").data("kendoComboBox").dataSource.data({})
					   for (var i = 0; i < data.length; i++) {
						   $("#payerAccountCoding_Id_Comb").data("kendoComboBox").dataSource.add({ ComboCaption:data[i].ComboCaption , ComboID: data[i].ComboID });
					   }
				},
				error: function (e) {
					alert('Error: ' + e.responseText);
				}
			});

	 
	 }

 }
  function _floatAccount_id_change(e) {
		var floatAccount_id = $("#floatAccount_id_Comb").data("kendoComboBox")._selectedValue;
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/fnc/treasury/receipt/receiptBill/combo/loadAllDynamicAccountCodeRelated/'+floatAccount_id,
			contentType: "application/json; charset=utf-8",
			dataType: 'json',
			type: 'GET',
			//async: true,
			success: function (data) {
				$("#payerAccountCoding_Id_Comb").data("kendoComboBox").value("");
				$("#payerAccountCoding_Id_Comb").data("kendoComboBox").dataSource.data({})
				   for (var i = 0; i < data.length; i++) {
					   $("#payerAccountCoding_Id_Comb").data("kendoComboBox").dataSource.add({ ComboCaption:data[i].ComboCaption , ComboID: data[i].ComboID });
				   }
			},
			error: function (e) {
				alert('Error: ' + e.responseText);
			}
		});

 }
	
</script>
