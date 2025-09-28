
<%@page import="org.springframework.web.util.UrlPathHelper"%><%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%
 String basePath = new UrlPathHelper().getOriginatingRequestUri(request); String fullPath = basePath.toString();
 String comboLoaderAccount = basePath + "/combo/loadAllAccount";
 %>
<form class="uk-form2-AccountOwnersItem" >
	<input type="hidden" id="id" name="id" >
<div class="uk-grid uk-grid-preserve">
	 <base:comboBoxAutoComplete name="accountCoding_id" key="fnc.generalAccounting.basicinfo.customizeAccountRelatedAccountCoding.accountCoding_id" comboLoaderUrl="combo/loadAllAccount" dataTextField="name" dataValueField="id" minLength="0"
                   iscomboLoaderUrlRelative="true" hasTemplate="true" headerTemplateComaSep="fnc.generalAccounting.basicinfo.customizeAccountRelatedAccountCoding.accountCoding_id" templateComaSep="name"/>       
	<base:comboBox  name="level" key="fnc.generalAccounting.accounting.level" comboLoaderUrl="combo/loadAllLevel" isListConstant="true" styleClass="verysmall"/>
</div>
</form>
<script type="text/javascript">
 
</script>