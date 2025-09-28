<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	String jsFileName = pageContext.getPage().getClass().getName();
	jsFileName = jsFileName.substring(jsFileName.lastIndexOf(".") + 1).replace("_jsp", ".js");
%>
<%

    String basePath = new UrlPathHelper().getOriginatingRequestUri(request); String fullPath = basePath.toString();
    String comboLoaderAccount = basePath + "/combo/loadAllAccountCoding";
    String comboLoaderFloatAccount = basePath + "/combo/loadAllFloatAccount";

	String gridUrl = new UrlPathHelper().getOriginatingRequestUri(request);
	String LoadId = "";
	if (gridUrl.indexOf("/create") > -1) {
		gridUrl = gridUrl.substring(0, gridUrl.indexOf("/create"));
	} else if (gridUrl.indexOf("/edit") > -1) {
		gridUrl = gridUrl.substring(0, gridUrl.indexOf("/edit"));
	}
	gridUrl += "/documentItemSearch/grid-read/{}";
%>
<%--@NotEmpty
	private String name;
	private String code;
	private Long financeYear_id;
	private Date startDate;
	private Date endDate;
	private String description;
	private Boolean activeFlg;
	private Long priorSalaryPeriod_id;
	private Boolean closeFlg;
	private Date insuranceStartDate;
	private Date insuranceEndDate;
--%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("menu.fnc.generalAccounting.accounting.docItemView")%></span></li>
	</ul>
</div>
<div class="uk-container uk-container-center my-uk-container" >
    <form class="uk-form" id="mainForm">
    	<div class="uk-grid uk-grid-preserve">
			<base:testBox name="fromDocNumber"  key="fnc.generalAccounting.accountingDocuments.doc.fromDocNumber" styleClass="verysmall"/>
			<base:testBox name="toDocNumber" styledivLabel="width:15%" key="fnc.generalAccounting.accountingDocuments.doc.toDocNumber" styleClass="verysmall" />
			<base:testBox name="fromReferenceNumber" styledivLabel="width:15%" key="fnc.generalAccounting.accountingDocuments.doc.fromReferenceNumber" styleClass="verysmall"/>
			<base:testBox name="toReferenceNumber" styledivLabel="width:15%" key="fnc.generalAccounting.accountingDocuments.doc.toReferenceNumber" styleClass="verysmall" />
			</div>
	<div class="uk-grid uk-grid-preserve">
		<base:mDatePicker styleClass="verysmall" name="fromDate" key="fnc.generalAccounting.accountingDocuments.doc.fromDate"/>
		<base:mDatePicker styleClass="verysmall" styledivLabel="width:15%" name="toDate" key="fnc.generalAccounting.accountingDocuments.doc.toDate"/>
		<base:testBoxNumericEx styleClass="verysmall" styledivLabel="width:15%" name="fromAmount" key="fnc.generalAccounting.accountingDocuments.doc.fromAmount"/>		
		<base:testBoxNumericEx styleClass="verysmall" styledivLabel="width:15%"  name="toAmount" key="fnc.generalAccounting.accountingDocuments.doc.toAmount"/>
	</div>
	<div class="uk-grid uk-grid-preserve">
   <base:comboBoxAutoComplete-buttonAddToCombo name="account_id"  key="fnc.generalAccounting.accounting.accountCoding.name"  popupUrlIsRelative="true"
                                       comboLoaderUrl="<%=comboLoaderAccount%>" dataTextField="nameCode"
                                       dataValueField="id" minLength="0"
                                       hasTemplate="true"
                                       headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                                       templateComaSep="name,code" popupUrl="/popup/treeAccountCoding"/>	</div>
	 <div class="uk-grid uk-grid-preserve">
               <base:comboBoxAutoComplete-buttonAddToCombo name="floatAccountLevel1" key="fnc.generalAccounting.accounting.doc.float1"  popupUrlIsRelative="true"
                 comboLoaderUrl="<%=comboLoaderFloatAccount%>" dataTextField="nameCode"
                 dataValueField="id" minLength="0"
                 hasTemplate="true"
                 headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                 templateComaSep="name,code" popupUrl="/popup/treeFloatAccount"/>
                 
                  <base:comboBoxAutoComplete-buttonAddToCombo name="floatAccountLevel2" key="fnc.generalAccounting.accounting.doc.float2"  popupUrlIsRelative="true"
                 comboLoaderUrl="<%=comboLoaderFloatAccount%>" dataTextField="nameCode"
                 dataValueField="id" minLength="0"
                 hasTemplate="true"
                 headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                 templateComaSep="name,code" popupUrl="/popup/treeFloatAccount"/>
              
                  </div>
                   <div class="uk-grid uk-grid-preserve">
               <base:comboBoxAutoComplete-buttonAddToCombo name="floatAccountLevel3" key="fnc.generalAccounting.accounting.doc.float3"  popupUrlIsRelative="true"
                 comboLoaderUrl="<%=comboLoaderFloatAccount%>" dataTextField="nameCode"
                 dataValueField="id" minLength="0"
                 hasTemplate="true"
                 headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                 templateComaSep="name,code" popupUrl="/popup/treeFloatAccount"/>
                 
                  <base:comboBoxAutoComplete-buttonAddToCombo name="floatAccountLevel4" key="fnc.generalAccounting.accounting.doc.float4"  popupUrlIsRelative="true"
                 comboLoaderUrl="<%=comboLoaderFloatAccount%>" dataTextField="nameCode"
                 dataValueField="id" minLength="0"
                 hasTemplate="true"
                 headerTemplateComaSep="fnc.generalAccounting.accounting.name,fnc.generalAccounting.accounting.code"
                 templateComaSep="name,code" popupUrl="/popup/treeFloatAccount"/>
              
                  </div>
	<div align="center" style="padding-top: 30px">
			<base:buttonPermission key="fnc.generalAccounting.accountingDocuments.doc.search" classNames="uk-button uk-button-success" onClick="javascript:searchDocumentItems()" id="searchBtn"/>
			<base:buttonPermission key="fnc.generalAccounting.accountingDocuments.doc.search.clear" classNames="uk-button uk-button-success" onClick="javascript:clearSearchField()" id="clearFieldBtn"/>
	</div>
	
<base:my-grid name="grid"  transportReadUrl="<%=gridUrl%>" isPopup="true">
    <base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.docNumber'  field="docNumber" width="50px"/>
    <base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.referenceNumber' field="referenceNumber"  width="50px"/>
    <base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.Date' field="date_"  width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.accountName'  field="accountName" width="50px"/>
    <base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.accountCode'  field="accountCode" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.debtorAmount'  field="debtorAmountWithSeparator" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.creditorAmount'  field="creditorAmountWithSeparator" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.floatAcc1Name'  field="floatAcc1Name" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.floatAcc2Name'  field="floatAcc2Name" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.floatAcc3Name'  field="floatAcc3Name" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.floatAcc4Name'  field="floatAcc4Name" width="50px"/>
	<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.description'  field="articleDescription" width="50px"/>
		
      <base:my-grid-schema-field name="docNumber" type="string"/>
	  <base:my-grid-schema-field name="referenceNumber" type="string"/>
	  <base:my-grid-schema-field name="date_" type="string"/>
      <base:my-grid-schema-field name="accountName" type="string"/>
      <base:my-grid-schema-field name="accountCode" type="string"/>
      <base:my-grid-schema-field name="debtorAmountWithSeparator" type="string"/>
      <base:my-grid-schema-field name="creditorAmountWithSeparator" type="string"/>
      <base:my-grid-schema-field name="floatAcc1Name" type="string"/>
      <base:my-grid-schema-field name="floatAcc2Name" type="string"/>
      <base:my-grid-schema-field name="floatAcc3Name" type="string"/>
      <base:my-grid-schema-field name="floatAcc4Name" type="string"/>
      <base:my-grid-schema-field name="articleDescription" type="string"/>
      <base:my-grid-function text="fnc.generalAccounting.accountingDocuments.doc.article.edit" functionClick="grid_showDocument" name="editArticle"/>
        

</base:my-grid>
</form>
</div>
<script type="text/javascript">
	$("#searchBtn").kendoButton({
		spriteCssClass: "k-icon k-i-funnel"
	});
	$("#clearFieldBtn").kendoButton({
		icon: "funnel-clear"
	});
function grid_showDocument(e){
		var data = this.dataItem($(e.target).closest("tr"));	  
	   	window.location = "${pageContext.request.contextPath}"+"/fnc/generalAccounting/accountingDocuments/document/edit/"+data.doc_id;
	}
	function searchDocumentItems(){
		var docItemVar = {};
		docItemVar.fromDocNumber=$("#fromDocNumber").val();
		docItemVar.toDocNumber=$("#toDocNumber").val();
		docItemVar.fromReferenceNumber=$("#fromReferenceNumber").val();
		docItemVar.toReferenceNumber=$("#toReferenceNumber").val();
	
		docItemVar.accountId=$("#account_id").val();
		docItemVar.floatAcc1Id=$("#floatAccountLevel1").val();
		docItemVar.floatAcc2Id=$("#floatAccountLevel2").val();
		docItemVar.floatAcc3Id=$("#floatAccountLevel3").val();
		docItemVar.floatAcc4Id=$("#floatAccountLevel4").val();
			var urlGrid=$("#grid").data("kendoGrid").dataSource.transport.options.read.url;
	                var indexnumber=urlGrid.valueOf().lastIndexOf("/");
	                var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);
	                urlGrid=subUrlGrid.valueOf()+"/"+JSON.stringify(docItemVar);
	                $("#grid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
	        		$("#grid").data("kendoGrid").dataSource.read();
}

function clearSearchField(){
		$("#fromDocNumber").val("");
		$("#toDocNumber").val("");
		$("#fromReferenceNumber").val("");
		$("#toReferenceNumber").val("");
		$("#fromDate").val("");
		$("#toDate").val("");
    	$("#account_id").val("");
    	$("#floatAccountLevel1").val("");
    	$("#floatAccountLevel2").val("");
    	$("#floatAccountLevel3").val("");
    	$("#floatAccountLevel4").val("");
    	searchDocumentItems();
}

</script>

<base:footer></base:footer>

