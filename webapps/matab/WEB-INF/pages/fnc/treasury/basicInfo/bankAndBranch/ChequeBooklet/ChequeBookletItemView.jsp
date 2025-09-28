<%@page import="com.artonis.core.base.utilClass.ResourceBoundleHolder"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span><%=ResourceBoundleHolder.resourceBundle.getString("fnc.treasury.basicInfo.bankAndBranch.viewDetail")%></span></li>
	</ul>
</div>
		<div class="uk-container uk-container-center my-uk-container" >
		<form class="uk-form" id="mainForm">
			<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="small" disabled="true" name="bank_name" key="fnc.treasury.basicInfo.bankAndBranch.chequeBookletItem.bankName"/>
			</div>
          <base:my-grid name="grid" showOperation="false"  transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBookletItem.chequeType'  field="chequeTypeStr" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBookletItem.serial'  field="serial" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBookletItem.chequeState'  field="chequeStateStr" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBookletItem.price'  field="price" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.chequeBookletItem.receiverAccountCoding'  field="receiverAccountcodeName" width="50px"/>


         <base:my-grid-schema-field name="chequeTypeStr" type="string"/>
         <base:my-grid-schema-field name="serial" type="long"/>
         <base:my-grid-schema-field name="chequeStateStr" type="string"/>
         <base:my-grid-schema-field name="price" type="long"/>
         <base:my-grid-schema-field name="receiverAccountcodeName" type="string"/>      
     </base:my-grid>
		
		</form>
		</div>
		<base:footer/>
