<%@page import="java.util.ResourceBundle"%>
<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>


<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
	String notAllowAddOrUpdate=resource.getString("fnc.generalAccounting.accountingDocuments.doc.error.canNotUpdateOrAdd");
	String floatAccountIsNeccessery=resource.getString("fnc.generalAccounting.accountingDocuments.doc.error.floatAccountIsNeccessery");
	request.setAttribute("basePath", basePath);
	String createUrl = basePath + "create";
	
	if (basePath.indexOf("/create") > -1) {
	    basePath = basePath.substring(0, basePath.indexOf("/create"));
	} else if (basePath.indexOf("/edit") > -1) {
	    basePath = basePath.substring(0, basePath.indexOf("/edit"));
	}

	String baseUrl = request.getAttribute("controllerBasePath").toString() ;
	if(!baseUrl.substring(baseUrl.length()-1,baseUrl.length()).equals("/")){
		baseUrl = baseUrl + '/';
	}
	String areUShure=resource.getString("action.alert.areYouSure.delete");

 %>

<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li><span><%=ResourceBoundleHolder.resourceBundle.getString("menu.fnc.generalAccounting.accounting.docInput")%></span></li>
	</ul>
	<div id="header-toolbar">
		<base:buttonPermission key="global.crud.new" classNames="uk-button uk-button-success" id="documentInput-new-btn" onClick="javascript:reload()"/>
		<base:buttonPermission key="fnc.generalAccounting.accountingDocuments.doc.print" classNames="uk-button uk-button-success" id="documentInput-print-btn" onClick="javascript:printDocumentItemView()"/>
		<%--<base:buttonPermission key="fnc.generalAccounting.accountingDocuments.doc.view" classNames="uk-button uk-button-success" id="documentInput-view-btn" onClick="javascript:goToDocumentView()"/>--%>
		<base:buttonPermission key="fnc.generalAccounting.accountingDocuments.doc.register" classNames="uk-button uk-button-success" id="documentInput-register-btn" onClick="javascript:changeDocumentState(2)"/>
		<base:buttonPermission key="fnc.generalAccounting.accountingDocuments.doc.back" classNames="uk-button uk-button-success" id="documentInput-back-btn" onClick="javascript:backDocumentState()"/>
		<%--<base:aPermission classNames="uk-button uk-button-danger" id="cancel" key="global.crud.cancel" url="${pageContext.request.contextPath}/fnc/generalAccounting/accountingDocuments/document/"/>--%>
		<base:buttonPermission classNames="uk-button uk-button-danger" id="cancel" key="global.crud.cancel" onClick="javascript:backToPreviousPage()"/>
	</div>
</div>
<base:dialogAlert name="dialogNotUpdateOrAdd" key="fnc.generalAccounting.accountingDocuments.doc.error.canNotUpdateOrAdd"/>
<base:dialogAlert name="stateMustNote" key="fnc.generalAccounting.accountingDocuments.doc.error.deleteArticleStateNote"/>
<base:dialogConfirm name="dialogconfirmSaveAccountCode" key="fnc.generalAccounting.accountingDocuments.confirm.contraryNature"
					yesFunction="confirmSaveAccountCode"/>
<base:pageInputHeader/>
<form class="uk-form" id="mainForm">
<DIV style="padding-top: 20px;" class="background" id="div-doc">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="loadedId" name="loadedId" >
		<input type="hidden" id="state" name="state" >
		<input type="hidden" id="type" name="type" >
		<input type="hidden" id="financeYear_Id"  name="financeYear_Id" >
		
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="verysmall" name="docNumber" key="fnc.generalAccounting.accountingDocuments.doc.docNumber"/>
			<base:testBox styleClass="verysmall" name="referenceNumber" key="fnc.generalAccounting.accountingDocuments.doc.referenceNumber" disabled="true"/>
			<base:mDatePicker styleClass="small" name="date" key="fnc.generalAccounting.accountingDocuments.doc.Date"/>
			<base:mDatePicker styleClass="small" name="createDate" key="fnc.generalAccounting.accountingDocuments.doc.createDate" disabled="true"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="verysmall" name="typeStr" key="fnc.generalAccounting.accountingDocuments.doc.Type" disabled="true"/>
			<base:testBox styleClass="verysmall" name="stateStr" key="fnc.generalAccounting.accountingDocuments.doc.State" disabled="true"/>
			<base:testBox styleClass="verysmall" name="balanceState" key="fnc.generalAccounting.accountingDocuments.doc.State" disabled="true"/>
	
		</div>
		<div class="uk-grid uk-grid-preserve">
		</div>
        <div class="uk-grid uk-grid-preserve">
            <base:textArea name="description" divWidthVal="50%" key="fnc.generalAccounting.accountingDocuments.doc.description" height="40" width="650" />
        </div>
		<div dir="ltr" style="padding-left: 80px">
			<base:buttonPermission key="fnc.generalAccounting.accountingDocuments.doc.saveDoc" classNames="uk-button  uk-button-success" onClick="javascript:saveDoc()" style="background-color: rgb(175,214,101);" id="saveDocBtn"/>
		</div>
</DIV>
<DIV class="background" style="padding-top: 20px;" id="div-article">
		<input type="hidden" id="docAccountArticle_id" name="docAccountArticle_id" >
		
		<base:accountAndFloatAccountPicker accountCodingFieldName="account_id" floatAccount1FieldName="floatDetailAccount1_id" 
				floatAccount2FieldName="floatDetailAccount2_id" floatAccount3FieldName="floatDetailAccount3_id" floatAccount4FieldName="floatDetailAccount4_id" />
		
		<div class="uk-grid uk-grid-preserve">
			<input type="hidden" id="amountType" name="amountType" >
			<base:testBoxNumericEx styleClass="small" onChangeFunction="addCommass(this)" name="amount" key="fnc.generalAccounting.accountingDocuments.doc.amount"  />
			<!--<base:comboBox  name="amountType" value="name" key="fnc.generalAccounting.accountingDocuments.doc.amountType" comboLoaderUrl="combo/loadAllAmountType" styleClass="small"/>-->
			<div class="p-q-radio uk-form-controls" style="padding-right: 500px; padding-top: 10px">
				<label class="p-q-label uk-form-label" style="width:50px">
					<%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accountingDocuments.debtor")%>
					<input type="radio" class="p-q-radio" name="amountTypeOption" value="1" onclick="handleClick(this)" />
				</label>
				<label class="p-q-label uk-form-label" style="width:50px; padding-right: 20px">
					<%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accountingDocuments.creditor")%>
					<input type="radio" class="p-q-radio" name="amountTypeOption" value="2" onclick="handleClick(this)" />
				</label>
			</div>
		</div>
        <div class="uk-grid uk-grid-preserve">
            <base:textArea name="articleDescription" key="fnc.generalAccounting.accountingDocuments.doc.description" height="40" width="650" />
        </div>
		<div align="center" style="padding-left: 80px">
			<base:buttonPermission key="fnc.generalAccounting.accountingDocuments.doc.add" classNames="uk-button  uk-button-success" id="documentInput-add-btn" onClick="javascript:saveDetail()" style="background-color: rgb(175,214,101);"/>
			<base:buttonPermission key="fnc.generalAccounting.accountingDocuments.doc.clear" classNames="uk-button  uk-button-success" id="documentInput-clear-btn" onClick="javascript:clearArticleItems()" style="background-color: rgb(175,214,101);"/>
		</div>
</DIV>
<DIV class="background" style="padding-top: 20px; padding-bottom: 20px; " id="div-article-grid" >
<%
	String gridUrl = new UrlPathHelper().getOriginatingRequestUri(request);
	String LoadId = "-1";
	if (gridUrl.indexOf("/create") > -1) {
		gridUrl = gridUrl.substring(0, gridUrl.indexOf("/create"));
	} else if (gridUrl.indexOf("/edit") > -1) {
		LoadId = gridUrl.substring(gridUrl.lastIndexOf("/"));
		gridUrl = gridUrl.substring(0, gridUrl.indexOf("/edit"));
	}
	gridUrl += "/article/grid-read/" + LoadId;
%>
	<base:my-grid name="articleGrid" transportReadUrl="<%=gridUrl%>" selectable="multiple" isPopup="true">
		<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.accountName'  field="accountName" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.accountCode'  field="accountCode" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.debtorAmount'  field="debtorAmountWithSeparator" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.creditorAmount'  field="creditorAmountWithSeparator" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.floatAcc1Name'  field="floatAcc1Name" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.floatAcc2Name'  field="floatAcc2Name" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.floatAcc3Name'  field="floatAcc3Name" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.floatAcc4Name'  field="floatAcc4Name" width="50px"/>
		<base:my-grid-column title='fnc.generalAccounting.accountingDocuments.doc.description'  field="articleDescription" width="50px"/>
		
        <base:my-grid-schema-field name="accountName" type="string"/>
        <base:my-grid-schema-field name="accountCode" type="string"/>
        <base:my-grid-schema-field name="debtorAmountWithSeparator" type="string"/>
        <base:my-grid-schema-field name="creditorAmountWithSeparator" type="string"/>
        <base:my-grid-schema-field name="floatAcc1Name" type="string"/>
        <base:my-grid-schema-field name="floatAcc2Name" type="string"/>
        <base:my-grid-schema-field name="floatAcc3Name" type="string"/>
        <base:my-grid-schema-field name="floatAcc4Name" type="string"/>
        <base:my-grid-schema-field name="articleDescription" type="string"/>
        
		<base:my-grid-function styleClass="uk-button-success" text="fnc.generalAccounting.accountingDocuments.doc.article.edit" functionClick="grid_onEditArticle" name="editArticle"/>
        <base:my-grid-function styleClass="uk-button-danger" text="fnc.generalAccounting.accountingDocuments.doc.article.delete" functionClick="grid_onDeleteArticle" name="deleteArticle"/>
	</base:my-grid>

	<div class="uk-grid uk-grid-preserve" style="padding-top: 20px; padding-right: 150px">
			<div class="uk-width-1-10 left-align" >
			    <label><%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accounting.document.sum")%></label>
			</div>
			<base:testBox name="sumDebtor"  key="fnc.generalAccounting.accounting.empty" styleClass="verysmall" disabled="true" />
			<base:testBox name="sumCreditor" key="fnc.generalAccounting.accounting.empty" styleClass="verysmall" disabled="true" />
	</div>
	<div class="uk-grid uk-grid-preserve" style="padding-right: 150px">
			<div class="uk-width-1-10 left-align" >
			    <label><%=ResourceBoundleHolder.resourceBundle.getString("fnc.generalAccounting.accounting.document.different")%></label>
			</div>
			<base:testBox name="different" key="fnc.generalAccounting.accounting.empty" styleClass="small" disabled="true" />
	</div>
	 <div dir="ltr" align="center" style="background: rgb(216, 216, 216);">
			<base:buttonPermission key="fnc.generalAccounting.accountingDocuments.doc.copyArticle" classNames="uk-button  uk-button-success" id="documentInput-copy-btn" onClick="javascript:copyArticle()" style="background-color: rgb(175,214,101);"/>
	</div>
</DIV>
</form>
<script language="JavaScript" type="text/javascript">
	$(document).ready(function(){
		document.getElementById("div-article").style.display = "none";
		document.getElementById("div-article-grid").style.display = "none";
		setSumArticleValueAndBalanceState(-1);
	 });

	function backToPreviousPage() {
        var refere='<%= request.getHeader("referer")%>';
        if(refere.indexOf('/documentItem/')>-1){
            window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accountingDocuments/documentItem/";
		}else{
            window.location.href="${pageContext.request.contextPath}"+"/fnc/generalAccounting/accountingDocuments/document/";
        }
    }
	 
	function callback_deserialize(data){
		document.getElementById("loadedId").value = data.id;
		if(data.id != null && data.id>0){
			document.getElementById("div-article").style.removeProperty("display");
			document.getElementById("div-article-grid").style.removeProperty("display");
		}
		setSumArticleValueAndBalanceState($("#loadedId").val());
	};
			 
	function saveDoc(){
		var data = {};
		data.id=$("#loadedId").val();
		data.docNumber=$("#docNumber").val();
		data.referenceNumber=$("#referenceNumber").val();
		data.date=$("#date").val();
		data.createDate=$("#createDate").val();
		data.type=$("#type").val();
		data.state=$("#state").val();
		data.currencyType=$("#currencyType").val();
		data.description=$("#description").val();
        data.financeYear_Id=$("#financeYear_Id").val();
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/fnc/generalAccounting/accountingDocuments/document/save',
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
	                document.getElementById("id").value = data.baseObjectId;
	                $("#div-article").show(100);
	                $("#div-article-grid").show(100);
                }
			},
			error: function (e) {
				alert('Error: ' + e.responseText);
			}
		});
	}
	
	function saveDetail(isContraryNatureChecked){
	  var result=validationSavePicker_account_id();
	  if(result == true){
	  
       
       	 if($('#state').val()>1)
       	{
       	     $("#dialogNotUpdateOrAdd").dialog("open");
       	}
        else{
		var data = {};
		data.doc_id=$("#loadedId").val();
		data.account_id=$("#account_id").val();
		data.floatDetailAccount1_id=$("#floatDetailAccount1_id").val();
		data.floatDetailAccount2_id=$("#floatDetailAccount2_id").val();
		data.floatDetailAccount3_id=$("#floatDetailAccount3_id").val();
		data.floatDetailAccount4_id=$("#floatDetailAccount4_id").val();
		data.amount=$("#amount_txt").val().split(",").join("");
		data.amountType=$("#amountType").val();
		data.articleDescription=$("#articleDescription").val();
		data.docAccountArticle_id=$("#docAccountArticle_id").val();
		if(isContraryNatureChecked){
		    data.isContraryNatureChecked=isContraryNatureChecked;
		}
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/fnc/generalAccounting/accountingDocuments/document/saveDetail',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(data),
			dataType: 'json',
			type: 'POST',
			//async: true,
			success: function (data, success, xhr) {
                if (data.state == "error") {
                    for (var i = 0; i < data.errors.length; i++) {
                        if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
                            alertify.error($("label[for='" + data.errors[i].Field + "']").text() + ":  " + data.errors[i].Message);
                        } else if(data.errors[i].Field=='amountType') {
							alertify.error('<%=resource.getString("fnc.generalAccounting.accountingDocuments.doc.error.amountType")%>');
						} else{
                            alertify.error(data.errors[i].Field + ":  " + data.errors[i].Message);
                        }
                    }
                }else if(data.state =="success"){
					alertify.success(data.message);
	        		var urlGrid=$("#articleGrid").data("kendoGrid").dataSource.transport.options.read.url;
	                var indexnumber=urlGrid.valueOf().lastIndexOf("/");
	                var subUrlGrid=urlGrid.valueOf().substring(0,indexnumber);
	                urlGrid=subUrlGrid.valueOf()+"/"+loadedId.value;
	                $("#articleGrid").data("kendoGrid").dataSource.transport.options.read.url=urlGrid;
	        		$("#articleGrid").data("kendoGrid").dataSource.read();
					clearArticleItems();
					setSumArticleValueAndBalanceState($("#loadedId").val());
                }else {
                    $("#dialogconfirmSaveAccountCode").data('contents', this).dialog("open");
                }
			},
			error: function (e) {
				alert('Error: ' + e.responseText);
			}
		});
		}
	}
	}

	function confirmSaveAccountCode(e){
        saveDetail(true)
	}

	function clearArticleItems(){
		resetAccountAndFloatAccountPicker();
		$("#amount").val("");
		$("#amount_txt").val("")
		$("#amountType").val("");
		document.getElementsByName('amountTypeOption')[0].checked = false;
		document.getElementsByName('amountTypeOption')[1].checked = false;
		$("#articleDescription").val("");
		$("#docAccountArticle_id").val("");
	}

	
    function grid_onDeleteArticle(e){
		var documentState = $("#state").val();
		var data = this.dataItem($(e.target).closest("tr"));
		if (documentState == 1) {
			var areUShure = "<%=areUShure%>";
			alertify.confirm(areUShure, function (e) {
				if (e) {
					jQuery.ajax({
						url: "${pageContext.request.contextPath}" + "/fnc/generalAccounting/accountingDocuments/document/deleteDetail/" + data.accountArticleId,
						type: "GET",
//						data: JSON.stringify({accountArticleId: data.accountArticleId}),
						dataType: "json",
						contentType: "application/json; charset=utf-8",
						success: function (result) {
							if (result.state == "success") {
								alertify.success(result.message);
								var urlGrid = $("#articleGrid").data("kendoGrid").dataSource.transport.options.read.url;
								var indexnumber = urlGrid.valueOf().lastIndexOf("/");
								var subUrlGrid = urlGrid.valueOf().substring(0, indexnumber);
								urlGrid = subUrlGrid.valueOf() + "/" + loadedId.value;
								$("#articleGrid").data("kendoGrid").dataSource.transport.options.read.url = urlGrid;
								$("#articleGrid").data("kendoGrid").dataSource.read();
								setSumArticleValueAndBalanceState($("#loadedId").val());
							} else if (result.state == "error") {
								for (var i = 0; i < result.errors.length; i++) {
									alertify.error($("label[for='" + result.errors[i].Field + "']").text() + ":  " + result.errors[i].Message);
								}
							} else {
								lertify.error("Something is not good! O_o");
							}
						},
						error: function (result) {
							if (result.status == 401) {
								window.location.href = "";
							}
						}
					});
				}

			});

		}
		else
			$("#stateMustNote").dialog("open");

	}
	
	function grid_onEditArticle(e){
		var data = this.dataItem($(e.target).closest("tr"));
	    if (e) {
			editAccountAndFloatAccountPicker(data.accountId, data.floatAcc1Id, data.floatAcc2Id, data.floatAcc3Id, data.floatAcc4Id);
			$("#amount").val(data.debtorAmount + data.creditorAmount);
			$("#amount_txt").val(addCommass(data.debtorAmount + data.creditorAmount));
			$("#amountType").val(data.amountType);
			if(data.amountType==1){
				document.getElementsByName("amountTypeOption")[0].checked=true;
			}else{
				document.getElementsByName("amountTypeOption")[1].checked=true;
			}
			$("#articleDescription").val(data.articleDescription);
			$("#docAccountArticle_id").val(data.accountArticleId);
	    }
	}
	
///////////////////////////////////////////
function handleClick(myRadio) {
    $("#amountType").val(myRadio.value);
}
///////////////////////////////////////////
function goToDocumentView(){
	window.location = "${pageContext.request.contextPath}"+"/fnc/generalAccounting/accountingDocuments/document/";
}

function printDocumentItemView(){
		var searchJsonString = {};
		searchJsonString.doc_id=$('#id').val();
		searchJsonString.docNumber=$('#docNumber').val();
		searchJsonString.referenceNumber=$('#referenceNumber').val();
		searchJsonString.date_=$('#date').val();
		searchJsonString = JSON.stringify(searchJsonString);
		searchJsonString = searchJsonString.replace(/\//g, ':@:');

//	var urlGrid = getBaseUrl() + "print/" + searchJsonString;
	var urlGrid = "<%=baseUrl%>" + "print/documentItemView/" + searchJsonString;

	window.open(urlGrid);
}
///////////////
function setSumArticleValueAndBalanceState(documentId){
	if(documentId==""){
		return;
	}
	var requestUrl = "${pageContext.request.contextPath}"+"/fnc/generalAccounting/accountingDocuments/document/getSumArticleValue/"+documentId;
	$.getJSON(requestUrl, function (data) {
		$('#sumDebtor').val(addCommass(data.sumDebtorValue));
		$('#sumCreditor').val(addCommass(data.sumCreditorValue));
		$('#different').val(addCommass(data.different));
		if(data.different == "0"){
			$('#balanceState').val('تراز');
		}else{
			$('#balanceState').val('ناتراز');
		}
	});
}
////////////
function backDocumentState(){
	if ($("#loadedId").val()!=null && $("#loadedId").val()>0){
		var requestUrl = "${pageContext.request.contextPath}"+"/fnc/generalAccounting/accountingDocuments/document/backDocumentState/"+$("#loadedId").val();
		$.getJSON(requestUrl, function (data) {
			$('#state').val(data.newStateValue);
			$('#stateStr').val(data.newStateText);
		});
	}else{
		alert(":\ ابتدا سند را ذخیره کنید")
	}
}
function changeDocumentState(newState){
	if ($("#loadedId").val()!=null && $("#loadedId").val()>0){
		var document = {};
		document.id=$("#loadedId").val();
		document.state=newState;
		$.ajax({
			url: '${pageContext.request.contextPath}'+'/fnc/generalAccounting/accountingDocuments/document/changeDocumentState',
			contentType: "application/json; charset=utf-8",
			data: JSON.stringify(document),
			dataType: 'json',
			type: 'POST',
			success: function (data, success, xhr) {
	            if (data.state == "error") {
	                for (var i = 0; i < data.errors.length; i++) {
	                    if ($("label[for='" + data.errors[i].Field + "']").text().length > 0) {
	                        alertify.error($("label[for='" + data.errors[i].Field + "']").text() + "  " + data.errors[i].Message);
	                    } else {
	                        alertify.error(data.errors[i].Field + "  " + data.errors[i].Message);
	                    }
	                }
	            }else{
					$('#state').val(data.newStateValue);
					$('#stateStr').val(data.newStateText);
				}
			},
			error: function (e) {
				alert('Error: ' + e.responseText);
			}
		});
	}else{
		alert(":\ ابتدا سند را ذخیره کنید")
	}
}
function addCommass(nStr)
{
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
        x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
}
  function copyArticle() {
           var rowIds = "";
           var documentitem_ids;
           var loadedId=$("#loadedId").val();
           var entityGrid = $("#articleGrid").data("kendoGrid");
           if (entityGrid.select().length != 0) {
               for (var i = 0; i < entityGrid.select().length; i++) {
                   rowIds += entityGrid.dataItem(entityGrid.select()[i]).id + ",";
               }
                  documentitem_ids = rowIds.substring(0, rowIds.length - 1);
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
			       url: '${pageContext.request.contextPath}'+'/fnc/generalAccounting/accountingDocuments/document/copyArticle/'+documentitem_ids+'@'+loadedId,
                   data:JSON.stringify(rowIds),
                   dataType:'json',
                   type:'POST',
                   success:function (data, success, xhr) {
                       alertify.success(data.message);
                       $("#articleGrid").data("kendoGrid").dataSource.read();
                       setSumArticleValueAndBalanceState($("#loadedId").val());
                       
                   },
			       error: function (e) {
				       alert('Error: ' + e.responseText);
			}
               });
           }
       
</script>
<style type="text/css">
.background{
	margin: 16px;
	padding: 16px;
	border: 1px solid #c8c8d3;
	-moz-box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
	-webkit-box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
	
	background: rgb(242,245,246); /* Old browsers */
	background: -moz-linear-gradient(top,  rgba(242,245,246,1) 0%, rgba(227,234,237,1) 37%, rgba(200,215,220,1) 100%); /* FF3.6+ */
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,rgba(242,245,246,1)), color-stop(37%,rgba(227,234,237,1)), color-stop(100%,rgba(200,215,220,1))); /* Chrome,Safari4+ */
	background: -webkit-linear-gradient(top,  rgba(242,245,246,1) 0%,rgba(227,234,237,1) 37%,rgba(200,215,220,1) 100%); /* Chrome10+,Safari5.1+ */
	background: -o-linear-gradient(top,  rgba(242,245,246,1) 0%,rgba(227,234,237,1) 37%,rgba(200,215,220,1) 100%); /* Opera 11.10+ */
	background: -ms-linear-gradient(top,  rgba(242,245,246,1) 0%,rgba(227,234,237,1) 37%,rgba(200,215,220,1) 100%); /* IE10+ */
	background: linear-gradient(to bottom,  rgba(242,245,246,1) 0%,rgba(227,234,237,1) 37%,rgba(200,215,220,1) 100%); /* W3C */
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f2f5f6', endColorstr='#c8d7dc',GradientType=0 ); /* IE6-9 */
}
</style>