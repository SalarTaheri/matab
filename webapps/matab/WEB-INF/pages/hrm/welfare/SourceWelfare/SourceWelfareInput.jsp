<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	String jsFileName = pageContext.getPage().getClass().getName();
	jsFileName = jsFileName.substring(jsFileName.lastIndexOf(".") + 1).replace("_jsp", ".js");
 %>
 <base:pageHeader/>
 <base:pageInputHeader/>

<div class="uk-container uk-container-center my-uk-container" >
	
	<form class="uk-form" id="mainForm">
		<input type="hidden" id="id" name="id" >
		<input type="hidden" id="fileAddress" name="fileAddress" >
		<div class="uk-grid uk-grid-preserve">
			<base:testBox name="name" key="hrm.welfare.suorceWelfare.name"/>
			<base:testBox name="code" key="hrm.welfare.suorceWelfare.name"/>
			
		</div>	
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="type" key="hrm.welfare.suorceWelfare.type" comboLoaderUrl="combo/loadAllSuorceWelfareType"/>
			<base:comboBox name="state" key="hrm.welfare.suorceWelfare.state" comboLoaderUrl="combo/loadAllState"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox name="capacityUnit" key="hrm.welfare.suorceWelfare.capacityUnit" comboLoaderUrl="combo/loadAllcapacityUnit"/>
			<base:testBox name="description" key="hrm.welfare.suorceWelfare.description"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:fileUploader fileRemoveUrl="file/fileUpload" name="files" key="hrm.basicInfo.formule.name" fileSaveUrl="file/fileUpload" uploadedFileAddress="fileAddress"/>
		</div>		
		
	</form>
</div>