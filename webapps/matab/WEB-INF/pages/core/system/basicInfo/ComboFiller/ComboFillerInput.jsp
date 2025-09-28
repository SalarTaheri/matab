<%@page import="org.springframework.web.util.UrlPathHelper"%>
<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@page contentType="text/html;charset=UTF-8"%>

<base:pageHeader/>
<base:pageInputHeader/>
<div class="uk-container uk-container-center my-uk-container" >

    <%--private String code;
	private String name;
	private long module_id;--%>
	<form class="uk-form" id="mainForm">
        <input type="hidden" id="id" name="id" >
		<div class="uk-grid uk-grid-preserve">
			<base:comboBox styleClass="small" name="parentModule_id" isListConstant="true" comboLoaderUrl="combo/loadAllParentModule" key="system.basicinfo.combofiller.parentModule"/>
			<base:cascadeComboBox  styleClass="small" name="module_id" key="system.basicinfo.combofiller.subModule" comboLoaderUrl="combo/loadCascadeSubModule" cascadeCombo="parentModule_id"/>
            <base:testBox styleClass="small" name="name" key="system.basicinfo.combofiller.name"/>
		</div>
		<div class="uk-grid uk-grid-preserve">
            <base:testBox styleClass="small" name="code" key="system.basicinfo.combofiller.code"/>
		</div>

	</form>
	<base:itemForm titleKeys="system.basicinfo.combofillervalue" formItemTabViewJspFiles="ComboFillerValueTabView.jsp" formItemTabInputs="ComboFillerValueTabInput" masterIdStr="comboFiller_id"/>

</div>