<%@page import="java.util.ResourceBundle"%>
<%@taglib prefix="kendo" uri="/WEB-INF/kendo-taglibs.tld"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="base" tagdir="/WEB-INF/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@page contentType="text/html;charset=UTF-8"%>

<%
	ResourceBundle resource = ResourceBundle.getBundle("application_fa");
	String jsFileName = pageContext.getPage().getClass().getName();
	jsFileName = jsFileName.substring(jsFileName.lastIndexOf(".") + 1).replace("_jsp", ".js");
 %>
 <base:pageHeader></base:pageHeader>
<div class="uk-container uk-container-center my-uk-container" >	
	<form class="uk-form" id="mainForm">	
		<div class="uk-grid uk-grid-preserve">
			<div class="uk-width-1-10 left-align">
				<label for="field1"><%=resource.getString("system.name")%></label>			
			</div>			
			<div class="uk-width-4-10">
				<input type="text" id="field1" name="field1" class="uk-width-1-1">
			</div>
			
			<div class="uk-width-1-10 left-align">
				<label for="field2"><%=resource.getString("system.code")%></label>
			</div>			
			<div class="uk-width-4-10">
				<input type="text" id="field2" name="field2" class="uk-width-1-1">
			</div>
		</div>
	</form>
	<div class="" style="margin-top: 20px;">
		<ul class="uk-tab" data-uk-tab data-uk-switcher="{connect:'#pattern2-tabs'}">
			<li class=" uk-active"><a href="">Aha!</a></li>
			<li class="" data-uk-switcher="{connect:'#pattern2-tab-2'}"><a href="">Baha!</a></li>
			<li class="" data-uk-switcher="{connect:'#pattern2-tab-3'}"><a href="">Zaha!</a></li>
		</ul>
		<ul id="pattern2-tabs" class="uk-switcher">
			<li>
				<h2>Hakjhjkdsf</h2>
			</li>
			<li>
				<h2>aaaaaaaaaaaaaaaa</h2>
				<input type="text" id="df" name="dfg" class="uk-width-1-1">
			</li>
			<li>
				<h2>44444444444444444</h2>
				<h2>44444444444444444</h2>
				<h2>44444444444444444</h2>
				<h2>44444444444444444</h2>
			</li>
		</ul>
	</div>
	
	
</div>