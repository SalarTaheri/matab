<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="org.apache.commons.lang3.math.NumberUtils"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
	String basePath = new UrlPathHelper().getOriginatingRequestUri(request).replace("create", "");
	String tranReadUrlCash = basePath + "item-grid-read/CashPermissionPayerItem_Cash";
	String tranReadUrlBank = basePath + "item-grid-read/CashPermissionPayerItem_Bank";
	String transportUpdateUrl = basePath + "item-grid/CashPermissionPayerItem/save";
	if(basePath.indexOf("/edit/")>-1){
    	int editIndexOf = basePath.indexOf("/edit/");
    	String masterId = basePath.substring(editIndexOf + 6);
    	if(NumberUtils.isNumber(masterId)){
        	basePath=basePath.substring(0,editIndexOf+1);
        	tranReadUrlCash=basePath+"item-grid-read/CashPermissionPayerItem_Cash/"+masterId;
        	tranReadUrlBank=basePath+"item-grid-read/CashPermissionPayerItem_Bank/"+masterId;
        	transportUpdateUrl=basePath+"item-grid/CashPermissionPayerItem/save";
    	}
	}else{
		tranReadUrlCash=basePath+"item-grid-read/CashPermissionPayerItem_Cash/-1";
		tranReadUrlBank=basePath+"item-grid-read/CashPermissionPayerItem_Bank/-1";
	}
	String tranRemoveUrl = basePath + "item-remove/CashPermissionPayerItem";
%>
<c:set var="transportReadUrlCash" value="<%=tranReadUrlCash %>" />
<c:set var="transportReadUrlBank" value="<%=tranReadUrlBank %>" />
<c:set var="transportRemoveUrl" value="<%=tranRemoveUrl %>" />
<c:set var="transportUpdateUrl" value="<%=transportUpdateUrl %>" />
<div id="CashPermissionPayerItem_cash_div" style="display: none">
	<base:my-grid-item4moreThanAGridInPage realName="CashPermissionPayerItem" name="CashPermissionPayerItem_cash" transportReadUrl="${transportReadUrlCash}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="cashPermission_id">
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.cashOriginAccountCoding_id'  field="cashAccountCoding_nameAndCode" width="50px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.cashOriginFloatAccountLevel1_id'  field="cashFloatAccountLevel1_nameAndCode" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.cashOriginFloatAccountLevel2_id'  field="cashFloatAccountLevel2_nameAndCode" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.cashOriginFloatAccountLevel3_id'  field="cashFloatAccountLevel3_nameAndCode" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.cashOriginFloatAccountLevel4_id'  field="cashFloatAccountLevel4_nameAndCode" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.cashTransferedPrice'  field="cashPrice" width="30px" format="0:#,0"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.cashTransferedDescription'  field="cashDescription" width="30px"/>
	</base:my-grid-item4moreThanAGridInPage>
</div>
<div id="CashPermissionPayerItem_bank_div" style="display: none">
	<base:my-grid-item4moreThanAGridInPage realName="CashPermissionPayerItem" name="CashPermissionPayerItem_bank" transportReadUrl="${transportReadUrlBank}" transportRemoveUrl="${transportRemoveUrl}" masterIdStr="cashPermission_id">
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.bankBank_Id'  field="bankBank_name" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.bankBranch_Id'  field="bankBranch_name" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.bankBankAccount_Id'  field="bankBankAccount_number" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.bankChequeBookletNum'  field="bankChequeBookletNum_number" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.bankMaturityDate'  field="bankMaturityDate" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.bankAccountCoding_Id'  field="bankAccountCoding_nameAndCode" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.bankFloatAccountLevel1_Id'  field="bankFloatAccountLevel1_nameAndCode" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.bankFloatAccountLevel2_Id'  field="bankFloatAccountLevel2_nameAndCode" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.bankFloatAccountLevel3_Id'  field="bankFloatAccountLevel3_nameAndCode" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.bankFloatAccountLevel4_Id'  field="bankFloatAccountLevel4_nameAndCode" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.bankPrice'  field="bankPrice" format="0:#,0" width="30px"/>
			<base:my-grid-column title='com.artonis.fnc.treasury.payment.cashPermissionPayer.bankChequeBookletItem_Id'  field="bankChequeBookletItem_number" width="30px"/>
	</base:my-grid-item4moreThanAGridInPage>
</div>
<base:footer/>