<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>
<%@ page import="org.springframework.web.util.UrlPathHelper" %>
<% 
    String basePath = new UrlPathHelper().getOriginatingRequestUri(request);
   
    String comboLoaderBank=basePath+"/combo/loadAllBank";
%>
<div class="body-header">
	<ul class="uk-breadcrumb uk-h3" id="breadcrumb">
		<li id="breadcrumb-main-section"><span>${pageTitle}</span></li>
	</ul>
</div>
     <div class="uk-container uk-container-center my-uk-container" style="margin-bottom: 4px; ">
       <form class="uk-form" id="mainForm">
         <input type="hidden" id="id" name="id">
          <div class="uk-grid uk-grid-preserve">
           <base:comboBoxAutoComplete name="bank_id" styleClass="midsmall" key="fnc.treasury.basicInfo.bankAndBranch.bank.name" comboLoaderUrl="<%=comboLoaderBank%>" dataTextField="name" dataValueField="id" minLength="0"
                    hasTemplate="true" headerTemplateComaSep="fnc.treasury.basicInfo.bankAndBranch.bank.name" templateComaSep="name"/>       
	   <base:testBox styleClass="midsmall" name="branchName" key="fnc.treasury.basicInfo.bankAndBranch.branch.name"/>
		<base:testBox styleClass="midsmall" name="code" key="fnc.treasury.basicInfo.bankAndBranch.branch.code"/>
	
		</div>
		<div class="uk-grid uk-grid-preserve">
			<base:testBox styleClass="midsmall" name="telephone" key="fnc.treasury.basicInfo.bankAndBranch.branch.telephone"/>
			<base:testBox name="address" key="fnc.treasury.basicInfo.bankAndBranch.branch.address"  styleClass="normal" />
		</div>
     
        </form>
        </div>
        <!--  <div class="uk-grid uk-grid-preserve">
         </div> -->
               
               <div align="center">
                <base:SubmitButton/>
               </div> 
         
         <base:Pattern3/>
<base:my-grid name="grid" transportReadUrl="${basePath}/grid-read" selectable="single">
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.bank.name'  field="bank_name" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.branch.name'  field="branchName" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.branch.code'  field="code" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.branch.telephone'  field="telephone" width="50px"/>
	<base:my-grid-column title='fnc.treasury.basicInfo.bankAndBranch.branch.address'  field="address" width="50px"/>

    <base:my-grid-schema-field name="bank_name" type="string"/>
    <base:my-grid-schema-field name="branchName" type="string"/>
    <base:my-grid-schema-field name="code" type="string"/>
    <base:my-grid-schema-field name="address" type="string"/>
    <base:my-grid-schema-field name="telephone" type="string"/>
</base:my-grid>
<base:footer/>
