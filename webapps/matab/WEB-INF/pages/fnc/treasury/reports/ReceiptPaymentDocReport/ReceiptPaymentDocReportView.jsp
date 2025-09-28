
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<base:pageHeader/>

<div class="uk-container uk-container-center my-uk-container" >
<form class="uk-form" id="mainForm">
        <div class="uk-grid uk-grid-preserve">
              <base:comboBoxAutoComplete styleClass="small" name="businessPartner_id"
                                       key="com.artonis.inv.receipt.purchaseReceipt.businessPartner_id"
                                       comboLoaderUrl="combo/loadAllBusinessPartner" dataTextField="nameAndFamily"
                                       dataValueField="id" minLength="0" iscomboLoaderUrlRelative="true"
                                       hasTemplate="false"
                                       headerTemplateComaSep="com.artonis.clinic.basicInfo.proficiency.name"
                                       templateComaSep="nameAndFamily"/>
        </div>
        <div class="uk-grid uk-grid-preserve">
        	<base:comboBox name="operation" value="name" key="com.artonis.fnc.treasury.reports.receiptPaymentDocReport.operation" comboLoaderUrl="combo/loadAllOperation" styleClass="midsmall" />
		    <base:cascadeComboBox selectIndex="0" styleClass="midsmall" name="branch_id" key="com.artonis.fnc.treasury.reports.receiptPaymentDocReport.subOperation" cascadeCombo="operation" comboLoaderUrl="combo/loadAllSubOperation"/>
        </div>
         <div class="uk-grid uk-grid-preserve">
         </div>

<base:my-grid-search >
	<base:my-grid-column title='com.artonis.fnc.treasury.reports.receiptPaymentDocReport.chequeSerial'  field="chequeSerial" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.reports.receiptPaymentDocReport.type'  field="type" width="50px"/>
	<base:my-grid-column title='com.artonis.fnc.treasury.reports.receiptPaymentDocReport.businessPartner_id'  field="businessPartner_id" width="50px"/>

        <base:my-grid-schema-field name="chequeSerial" type="string"/>
        <base:my-grid-schema-field name="type" type="string"/>
        <base:my-grid-schema-field name="bill_id" type="string"/>
        <base:my-grid-schema-field name="businessPartner_id" type="string"/>
</base:my-grid-search>
</form>
</div>
<base:footer/>
<script type="text/javascript">
function getSearchObject(){
	var jsobj = {};
	jsobj.xxx=$("#xxx").val();
	return jsobj;
}
</script>
